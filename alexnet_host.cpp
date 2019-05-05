/*
    OpenCL implementation of AlexNet: Host side code
    Project Group ID: 8
    Member name: Pratikkumar Prajapati (012541477)
    Member name: Siddharth Chawla(012451855)
    For CMPE214 (Spring 2019), under guidance of Dr. Hyeran Jeon <hyeran.jeon@sjsu.edu>
*/

#pragma clang diagnostic push
#pragma ide diagnostic ignored "modernize-use-nullptr"

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <CL/cl.h>
#include <sys/time.h>

#define PROGRAM_FILE "alexnet_opencl.cl"
#define L1_CONV_KERNEL_FUNC "executeFirstLayer"
#define L1_NORM_KERNEL_FUNC "executelrnNorm_split"
#define POOL_KERNEL_FUNC "executepooling"
#define CONV3D_KERNEL_FUNC "execute3Dconvolution"
#define CONV3D_GROUP2_KERNEL_FUNC "execute3Dconvolutiongroup2"
#define NORMLRN_KERNEL_FUNC "executelrnNorm"
#define FULLY_CONNECTED_KERNEL_FUNC "executeFCLayer"

#define true 1
#define false 0
//#define DEBUG_AN 0

#define L1_KERNEL_SIZE 11*11*3
#define L1_OUT 96
#define L2_KERNEL_SIZE 5*5*48
#define L2_OUT 256
#define L3_KERNEL_SIZE 3*3*256
#define L3_OUT 384
#define L4_KERNEL_SIZE 3*3*192
#define L4_OUT 384
#define L5_KERNEL_SIZE 3*3*192
#define L5_OUT 256
#define INPUT_SIZE 227*227*3

#define L1_FMAP 55*55
#define L2_FMAP 27*27
#define L3_FMAP 13*13
#define L4_FMAP 13*13
#define L5_FMAP 13*13
#define POOL1_FMAP 27*27
#define POOL2_FMAP 13*13
#define POOL3_FMAP 6*6

/* OpenCL structures */
cl_command_queue queue;
cl_context context;
cl_program program;
cl_kernel kernel_l1_conv;
cl_kernel kernel_l1_norm;
cl_kernel kernel_pool;
cl_kernel kernel_conv3d;
cl_kernel kernel_conv3d_g2;
cl_kernel kernel_normlrn;
cl_kernel kernel_fully_connected;

/* Read Input File 227*227*3 */
float *Layer1_Neurons_CPU;

/* Declaration of Bias and Weights for CPU */
float bias_1[96], bias_2[256], bias_3[384], bias_4[384], bias_5[256];
float bias_6[4096], bias_7[4096], bias_8[1000];

float *Layer1_Weights_CPU;
float *Layer2_Weights_CPU;
float *Layer3_Weights_CPU;
float *Layer4_Weights_CPU;
float *Layer5_Weights_CPU;
float *Layer6_Weights_CPU;
float *Layer7_Weights_CPU;
float *Layer8_Weights_CPU;
float *fc9_Neurons_CPU; /* for final results */

size_t global_size[2];
size_t local_size[2];
int err;

/* for Layer 1*/
cl_mem Layer1_bias_GPU, Layer1_Weights_GPU,
        Layer1_Neurons_GPU, Layer1_Norm_GPU,
        Layer1_pool_GPU, Layer2_Neurons_GPU;

/* for Layer 2*/
cl_mem Layer2_bias_GPU, Layer2_Weights_GPU, Layer2_Norm_GPU,
        Layer2_pool_GPU, Layer3_Neurons_GPU;

/* for layer 3*/
cl_mem Layer3_bias_GPU, Layer3_Weights_GPU, Layer4_Neurons_GPU;

/* for layer 4*/
cl_mem Layer4_bias_GPU, Layer4_Weights_GPU, Layer5_Neurons_GPU;

/* for layer 5*/
cl_mem Layer5_bias_GPU, Layer5_Weights_GPU, Layer5_pool_GPU, Layer6_Neurons_GPU;

/* for layer 6*/
cl_mem Layer6_bias_GPU, Layer6_Weights_GPU, Layer7_Neurons_GPU;

/* for layer 7*/
cl_mem Layer7_bias_GPU, Layer7_Weights_GPU, Layer8_Neurons_GPU;

/* for layer 8*/
cl_mem Layer8_bias_GPU, Layer9_Neurons_GPU, Layer8_Weights_GPU;

char *input_file;

/* Find a GPU or CPU associated with the first available platform */
cl_device_id create_device() {


}

/* Create program from a file and compile it */
cl_program build_program(cl_context ctx, cl_device_id dev, const char *filename) {

    cl_program program;
    FILE *program_handle;
    char *program_buffer, *program_log;
    size_t program_size, log_size;

    /* Read program file and place content into buffer */
    program_handle = fopen(filename, "r");
    if (program_handle == NULL) {
        printf("Couldn't find the program file");
        exit(1);
    }
    fseek(program_handle, 0, SEEK_END);
    program_size = ftell(program_handle);
    rewind(program_handle);
    program_buffer = (char *) malloc(program_size + 1);
    program_buffer[program_size] = '\0';
    fread(program_buffer, sizeof(char), program_size, program_handle);
    fclose(program_handle);

    /* Create program from file */
    program = clCreateProgramWithSource(ctx, 1,
                                        (const char **) &program_buffer, &program_size, &err);
    if (err < 0) {
        printf("Couldn't create the program");
        exit(1);
    }
    free(program_buffer);

    /* Build program */
    err = clBuildProgram(program, 0, NULL, NULL, NULL, NULL);
    if (err < 0) {

        /* Find size of log and print to std output */
        clGetProgramBuildInfo(program, dev, CL_PROGRAM_BUILD_LOG,
                              0, NULL, &log_size);
        program_log = (char *) malloc(log_size + 1);
        program_log[log_size] = '\0';
        clGetProgramBuildInfo(program, dev, CL_PROGRAM_BUILD_LOG,
                              log_size + 1, program_log, NULL);
        printf("%s\n", program_log);
        free(program_log);
        exit(1);
    }

    return program;
}

#ifdef DEBUG_AN
void dump_CPU_array_to_file(float* cpu_mem, int count, char *filename) {

    if (cpu_mem != NULL) {
        /* Read the kernel's output */
        FILE *fptr = fopen(filename, "wa+");
        if (fptr != NULL) {
            printf("starting to save data in file %s\n", filename);
            for (int i = 0; i < count; i++) {
                fprintf(fptr, "%f\n", cpu_mem[i]);
            }
            fclose(fptr);
            printf("data saved in file %s\n", filename);
        } else {
            printf("failed to create file %s\n", filename);
            exit(0);
        }
    } else {
        printf("passed mem is null\n");
        exit(0);
    }
}

void dump_GPU_array_to_file(cl_mem gpu_mem, int count, char *filename) {

    float *cpu_mem;
    cpu_mem = (float *) malloc(sizeof(float) * count);
    if (cpu_mem != NULL) {
        /* Read the kernel's output */
        err = clEnqueueReadBuffer(queue, gpu_mem, CL_TRUE, 0,
                                  sizeof(float) * count, cpu_mem, 0, NULL, NULL);
        if (err < 0) {
            printf("Couldn't read the buffer to dump in file");
            exit(1);
        }

        FILE *fptr = fopen(filename, "wa+");
        if (fptr != NULL) {
            printf("starting to save data in file %s\n", filename);
            for (int i = 0; i < count; i++) {
                fprintf(fptr, "%f\n", cpu_mem[i]);
            }
            fclose(fptr);
            printf("data saved in file %s\n", filename);
            free(cpu_mem);
        } else {
            printf("failed to create file %s\n", filename);
            exit(0);
        }
    } else {
        printf("failed to allocate mem\n");
        exit(0);
    }
}

#endif

void build_kernels() {

    kernel_l1_conv = clCreateKernel(program, L1_CONV_KERNEL_FUNC, &err);
    if (err < 0) {
        printf("Couldn't create a kernel %s, err=%d\n", L1_CONV_KERNEL_FUNC, err);
        exit(1);
    }

    kernel_l1_norm = clCreateKernel(program, L1_NORM_KERNEL_FUNC, &err);
    if (err < 0) {
        printf("Couldn't create a kernel %s, err=%d\n", L1_NORM_KERNEL_FUNC, err);
        exit(1);
    }

    /* Create a kernel */
    kernel_pool = clCreateKernel(program, POOL_KERNEL_FUNC, &err);
    if (err < 0) {
        printf("Couldn't create a kernel %s", POOL_KERNEL_FUNC);
        exit(1);
    }

    /* Create a kernel */
    kernel_conv3d = clCreateKernel(program, CONV3D_KERNEL_FUNC, &err);
    if (err < 0) {
        printf("Couldn't create a kernel %s", CONV3D_KERNEL_FUNC);
        exit(1);
    }


    kernel_conv3d_g2 = clCreateKernel(program, CONV3D_GROUP2_KERNEL_FUNC, &err);
    if (err < 0) {
        printf("Couldn't create a kernel %s err=%d\n", CONV3D_GROUP2_KERNEL_FUNC, err);
        exit(1);
    }

    kernel_normlrn = clCreateKernel(program, NORMLRN_KERNEL_FUNC, &err);
    if (err < 0) {
        printf("Couldn't create a kernel %s err=%d\n", NORMLRN_KERNEL_FUNC, err);
        exit(1);
    }

    kernel_fully_connected = clCreateKernel(program, FULLY_CONNECTED_KERNEL_FUNC, &err);
    if (err < 0) {
        printf("Couldn't create a kernel %s err=%d\n", FULLY_CONNECTED_KERNEL_FUNC, err);
        exit(1);
    }

}

void extract_weights(const char *pFileName, float *layer_weights, int bias) {
    FILE *pFile1 = fopen(pFileName, "rb");
    char delim[2];
    if (bias == true)
        delim[0] = ' ';
    else
        delim[0] = '\n';
    delim[1] = 0;
    char *token;
    int count = 0;
    char *line = NULL;
    size_t len = 0;
    if (!(pFile1 != NULL))
        printf("File Not Found\n");
    if (pFile1 != NULL && (bias == false)) {
        {

            while (getline(&line, &len, pFile1) != -1) {
                token = strtok(line, delim);
                float temp_num = atof(token);
                layer_weights[count] = temp_num;
                count++;
            }
        }
        fclose(pFile1);
    }
    if (pFile1 != NULL && (bias == true)) {
        {
            char weights[94590] = "";
            fread(weights, sizeof(weights), 1, pFile1);
            token = strtok(weights, delim);
            while (token != NULL) {
                float temp_num = atof(token);
                layer_weights[count] = temp_num;
                count++;
                token = strtok(NULL, delim);
            }
        }
        fclose(pFile1);
    }

}

void Fill_weights(float *Layer1_Weights_CPU, float *Layer2_Weights_CPU,
                  float *Layer3_Weights_CPU, float *Layer4_Weights_CPU,
                  float *Layer5_Weights_CPU, float *Layer6_Weights_CPU,
                  float *Layer7_Weights_CPU, float *Layer8_Weights_CPU) {
    printf("\n\t weights for layer 1");
    extract_weights("data/conv1.txt", Layer1_Weights_CPU, false);
    printf("\n\t weights for layer 2");
    extract_weights("data/conv2.txt", Layer2_Weights_CPU, false);
    printf("\n\t weights for layer 3");
    extract_weights("data/conv3.txt", Layer3_Weights_CPU, false);
    printf("\n\t weights for layer 4");
    extract_weights("data/conv4.txt", Layer4_Weights_CPU, false);
    printf("\n\t weights for layer 5");
    extract_weights("data/conv5.txt", Layer5_Weights_CPU, false);
    printf("\n\t weights for layer 6");
    extract_weights("data/fc6.txt", Layer6_Weights_CPU, false);
    printf("\n\t weights for layer 7");
    extract_weights("data/fc7.txt", Layer7_Weights_CPU, false);
    printf("\n\t weights for layer 8");
    extract_weights("data/fc8.txt", Layer8_Weights_CPU, false);
}

void Fill_bias(float *bias_1, float *bias_2, float *bias_3,
               float *bias_4, float *bias_5, float *bias_6,
               float *bias_7, float *bias_8) {
    printf("\n\t bias for layer 1");
    extract_weights("data/bias1.txt", bias_1, true);
    printf("\n\t bias for layer 2");
    extract_weights("data/bias2.txt", bias_2, true);
    printf("\n\t bias for layer 3");
    extract_weights("data/bias3.txt", bias_3, true);
    printf("\n\t bias for layer 4");
    extract_weights("data/bias4.txt", bias_4, true);
    printf("\n\t bias for layer 5");
    extract_weights("data/bias5.txt", bias_5, true);
    printf("\n\t bias for layer 6");
    extract_weights("data/bias6.txt", bias_6, true);
    printf("\n\t bias for layer 7");
    extract_weights("data/bias7.txt", bias_7, true);
    printf("\n\t bias for layer 8");
    extract_weights("data/bias8.txt", bias_8, true);
}

void readIn(float *layer1, char *input_file) {
    //FILE *fp = fopen("data/input.txt", "rb");
    FILE *fp = fopen(input_file, "rb");
    printf("Loading input from %s\n", input_file);
    size_t len;
    char delim[1];
    delim[0] = '\n';
    int count = 0;
    char *token;
    char *line = NULL;
    if (fp != NULL) {
        while ((getline(&line, &len, fp)) != -1) {
            token = strtok(line, delim);
            layer1[count] = atof(token);
            count++;
        }
        fclose(fp);
    } else {
        printf("input file %s Not FOUND\n", input_file);
        exit(-1);
    }
}

void allocate_mem() {

    /* Read Input File 227*227*3 */
    Layer1_Neurons_CPU = (float *) malloc(INPUT_SIZE * sizeof(float));
    Layer1_Weights_CPU = (float *) malloc(sizeof(float) * (L1_KERNEL_SIZE * L1_OUT));
    Layer2_Weights_CPU = (float *) malloc(sizeof(float) * (L2_KERNEL_SIZE * L2_OUT));
    Layer3_Weights_CPU = (float *) malloc(sizeof(float) * (L3_KERNEL_SIZE * L3_OUT));
    Layer4_Weights_CPU = (float *) malloc(sizeof(float) * (L4_KERNEL_SIZE * L4_OUT));
    Layer5_Weights_CPU = (float *) malloc(sizeof(float) * (L5_KERNEL_SIZE * L5_OUT));
    Layer6_Weights_CPU = (float *) malloc(sizeof(float) * (4096 * 256 * 6 * 6));
    Layer7_Weights_CPU = (float *) malloc(sizeof(float) * (4096 * 4096));
    Layer8_Weights_CPU = (float *) malloc(sizeof(float) * (4096 * 1000));
    fc9_Neurons_CPU = (float *) malloc(sizeof(float) * (1000));

}


void cleanup_mem() {

    /* Deallocate resources */
    clReleaseKernel(kernel_l1_conv);
    clReleaseKernel(kernel_l1_norm);
    clReleaseKernel(kernel_pool);
    clReleaseKernel(kernel_conv3d);
    clReleaseKernel(kernel_conv3d_g2);
    clReleaseKernel(kernel_normlrn);
    clReleaseKernel(kernel_fully_connected);
    clReleaseMemObject(Layer1_bias_GPU);
    clReleaseMemObject(Layer1_Weights_GPU);
    clReleaseMemObject(Layer1_Neurons_GPU);
    clReleaseMemObject(Layer1_Norm_GPU);
    clReleaseMemObject(Layer1_pool_GPU);
    clReleaseMemObject(Layer2_Neurons_GPU);
    clReleaseMemObject(Layer2_bias_GPU);
    clReleaseMemObject(Layer2_Weights_GPU);
    clReleaseMemObject(Layer2_Norm_GPU);
    clReleaseMemObject(Layer2_pool_GPU);
    clReleaseMemObject(Layer3_Neurons_GPU);
    clReleaseMemObject(Layer3_bias_GPU);
    clReleaseMemObject(Layer3_Weights_GPU);
    clReleaseMemObject(Layer4_Neurons_GPU);
    clReleaseMemObject(Layer4_bias_GPU);
    clReleaseMemObject(Layer4_Weights_GPU);
    clReleaseMemObject(Layer5_Neurons_GPU);
    clReleaseMemObject(Layer5_bias_GPU);
    clReleaseMemObject(Layer5_Weights_GPU);
    clReleaseMemObject(Layer5_pool_GPU);
    clReleaseMemObject(Layer6_Neurons_GPU);
    clReleaseMemObject(Layer6_bias_GPU);
    clReleaseMemObject(Layer6_Weights_GPU);
    clReleaseMemObject(Layer7_Neurons_GPU);
    clReleaseMemObject(Layer7_bias_GPU);
    clReleaseMemObject(Layer7_Weights_GPU);
    clReleaseMemObject(Layer8_Neurons_GPU);
    clReleaseMemObject(Layer8_bias_GPU);
    clReleaseMemObject(Layer9_Neurons_GPU);
    clReleaseMemObject(Layer8_Weights_GPU);
    clReleaseCommandQueue(queue);
    clReleaseProgram(program);
    clReleaseContext(context);
    free(Layer1_Neurons_CPU);
    free(Layer1_Weights_CPU);
    free(Layer2_Weights_CPU);
    free(Layer3_Weights_CPU);
    free(Layer4_Weights_CPU);
    free(Layer5_Weights_CPU);
    free(Layer6_Weights_CPU);
    free(Layer7_Weights_CPU);
    free(Layer8_Weights_CPU);
    free(fc9_Neurons_CPU);
}


void init_data() {
    readIn(Layer1_Neurons_CPU, input_file);
    /* Fill Bias and Weights */
    printf("Loading Bias values");
    Fill_bias(bias_1, bias_2, bias_3, bias_4, bias_5, bias_6, bias_7, bias_8);
    printf("\nLoading Weights values");
    Fill_weights(Layer1_Weights_CPU, Layer2_Weights_CPU, Layer3_Weights_CPU,
                 Layer4_Weights_CPU, Layer5_Weights_CPU, Layer6_Weights_CPU,
                 Layer7_Weights_CPU, Layer8_Weights_CPU);
    printf("\n\t Weights and Bias loaded successfully\n");
}


void conv_layer1() {

    cl_int r_offset;
    cl_int c_offset;
#ifdef DEBUG_AN
    dump_CPU_array_to_file(bias_1, 96, "Layer1_bias_CPU_p.txt");
#endif
    /*Layer1 */
    Layer1_bias_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                     sizeof(float) * L1_OUT, bias_1, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer1_bias_GPU");
        exit(1);
    }

    Layer1_Neurons_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                        sizeof(float) * INPUT_SIZE, Layer1_Neurons_CPU, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer1_Neurons_GPU");
        exit(1);
    }

    Layer1_Weights_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                        sizeof(float) * L1_KERNEL_SIZE * L1_OUT, Layer1_Weights_CPU, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer1_Weights_GPU");
        exit(1);
    }

    Layer1_Norm_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                     sizeof(float) * (L1_OUT * L1_FMAP), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer1_Norm_GPU");
        exit(1);
    }

    err = clSetKernelArg(kernel_l1_conv, 0, sizeof(cl_mem), &Layer1_bias_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_bias_GPU\n");
        exit(1);
    }
    err = clSetKernelArg(kernel_l1_conv, 1, sizeof(cl_mem), &Layer1_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_Neurons_GPU err=%d\n", err);
        exit(1);
    }
    err = clSetKernelArg(kernel_l1_conv, 2, sizeof(cl_mem), &Layer1_Weights_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_Weights_GPU");
        exit(1);
    }
    err = clSetKernelArg(kernel_l1_conv, 3, sizeof(cl_mem), &Layer1_Norm_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_Norm_GPU");
        exit(1);
    }

    r_offset = 0;
    c_offset = 0;

    err = clSetKernelArg(kernel_l1_conv, 4, sizeof(cl_int), &r_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_Norm_GPU");
        exit(1);
    }

    err = clSetKernelArg(kernel_l1_conv, 5, sizeof(cl_int), &c_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_Norm_GPU");
        exit(1);
    }

    local_size[0] = 32;
    local_size[1] = 32;
    global_size[0] = 96 * local_size[0];
    global_size[1] = 1 * local_size[1];

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_l1_conv, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_l1_conv %d\n", err);
        exit(1);
    }
#ifdef DEBUG_AN
    dump_GPU_array_to_file(Layer1_Norm_GPU, (L1_OUT * L1_FMAP), "Layer1_Norm_GPU_1.txt");
#endif

    r_offset = 0;
    c_offset = 32;

    err = clSetKernelArg(kernel_l1_conv, 4, sizeof(cl_int), &r_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_Norm_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_l1_conv, 5, sizeof(cl_int), &c_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_Norm_GPU\n");
        exit(1);
    }

    local_size[0] = 32;
    local_size[1] = 23;
    global_size[0] = 96 * local_size[0];
    global_size[1] = 1 * local_size[1];


    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_l1_conv, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_l1_conv\n");
        exit(1);
    }

#ifdef DEBUG_AN
    dump_GPU_array_to_file(Layer1_Norm_GPU, (L1_OUT * L1_FMAP), "Layer1_Norm_GPU_2.txt");
#endif
    r_offset = 32;
    c_offset = 0;

    err = clSetKernelArg(kernel_l1_conv, 4, sizeof(cl_int), &r_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_Norm_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_l1_conv, 5, sizeof(cl_int), &c_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_Norm_GPU\n");
        exit(1);
    }

    local_size[0] = 23;
    local_size[1] = 32;
    global_size[0] = 96 * local_size[0];
    global_size[1] = 1 * local_size[1];

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_l1_conv, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_l1_conv");
        exit(1);
    }

    r_offset = 32;
    c_offset = 32;

    err = clSetKernelArg(kernel_l1_conv, 4, sizeof(cl_int), &r_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument r_offset\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_l1_conv, 5, sizeof(cl_int), &c_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument c_offset\n");
        exit(1);
    }

    local_size[0] = 23;
    local_size[1] = 23;
    global_size[0] = 96 * local_size[0];
    global_size[1] = 1 * local_size[1];

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_l1_conv, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_l1_conv\n");
        exit(1);
    }
#ifdef DEBUG_AN
    dump_GPU_array_to_file(Layer1_Norm_GPU, (L1_OUT * L1_FMAP), "Layer1_Norm_GPU_4.txt");
#endif
}


void normalise_layer1() {

    cl_int r_offset;
    cl_int c_offset;

    err = clSetKernelArg(kernel_l1_norm, 0, sizeof(cl_mem), &Layer1_Norm_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_Norm_GPU\n");
        exit(1);
    }

    Layer1_pool_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                     sizeof(float) * (L1_OUT * L1_FMAP), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer1_Norm_GPU\n");
        exit(1);
    };

    err = clSetKernelArg(kernel_l1_norm, 1, sizeof(cl_mem), &Layer1_pool_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_pool_GPU");
        exit(1);
    }

    r_offset = 0;
    c_offset = 0;

    err = clSetKernelArg(kernel_l1_norm, 2, sizeof(cl_int), &r_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument r_offset\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_l1_norm, 3, sizeof(cl_int), &c_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument c_offset\n");
        exit(1);
    }

    local_size[0] = 32;
    local_size[1] = 32;
    global_size[0] = 96 * local_size[0];
    global_size[1] = 1 * local_size[1];

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_l1_norm, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_l1_norm\n");
        exit(1);
    }

    r_offset = 0;
    c_offset = 32;

    err = clSetKernelArg(kernel_l1_norm, 2, sizeof(cl_int), &r_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument r_offset\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_l1_norm, 3, sizeof(cl_int), &c_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument c_offset\n");
        exit(1);
    }

    local_size[0] = 32;
    local_size[1] = 23;
    global_size[0] = 96 * local_size[0];
    global_size[1] = 1 * local_size[1];


    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_l1_norm, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_l1_norm\n");
        exit(1);
    }


    r_offset = 32;
    c_offset = 0;

    err = clSetKernelArg(kernel_l1_norm, 2, sizeof(cl_int), &r_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument r_offset\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_l1_norm, 3, sizeof(cl_int), &c_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument c_offset\n");
        exit(1);
    }

    local_size[0] = 23;
    local_size[1] = 32;
    global_size[0] = 96 * local_size[0];
    global_size[1] = 1 * local_size[1];



    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_l1_norm, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_l1_norm\n");
        exit(1);
    }

    r_offset = 32;
    c_offset = 32;

    err = clSetKernelArg(kernel_l1_norm, 2, sizeof(cl_int), &r_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument r_offset\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_l1_norm, 3, sizeof(cl_int), &c_offset);
    if (err < 0) {
        printf("Couldn't create a kernel argument c_offset\n");
        exit(1);
    }

    local_size[0] = 23;
    local_size[1] = 23;
    global_size[0] = 96 * local_size[0];
    global_size[1] = 1 * local_size[1];


    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_l1_norm, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_l1_norm\n");
        exit(1);
    }
#ifdef DEBUG_AN
    dump_GPU_array_to_file(Layer1_pool_GPU, (L1_OUT * L1_FMAP), "Layer1_pool_GPU.txt");
#endif

}

void max_pool_layer1() {

    /* Max Pool */

    cl_int out = 96;
    cl_int out_fr = 27;
    cl_int out_fc = 27;
    cl_int kernel_mask = 3;
    cl_int stride_width = 2;
    cl_int in_fr = 55;
    cl_int in_fc = 55;

    Layer2_Neurons_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                        sizeof(float) * (L1_OUT * POOL1_FMAP), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer2_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 0, sizeof(cl_mem), &Layer1_pool_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer1_pool_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 1, sizeof(cl_mem), &Layer2_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 2, sizeof(cl_int), &out);
    if (err < 0) {
        printf("Couldn't create a kernel argument out\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 3, sizeof(cl_int), &out_fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument out_fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 4, sizeof(cl_int), &out_fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument out_fc\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 5, sizeof(cl_int), &kernel_mask);
    if (err < 0) {
        printf("Couldn't create a kernel argument kernel_mask\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 6, sizeof(cl_int), &stride_width);
    if (err < 0) {
        printf("Couldn't create a kernel argument stride_width\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 7, sizeof(cl_int), &in_fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 8, sizeof(cl_int), &in_fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_fc\n");
        exit(1);
    }

    local_size[0] = 27;
    local_size[1] = 27;
    global_size[0] = 96 * local_size[0];
    global_size[1] = 1 * local_size[1];

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_pool, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_pool\n");
        exit(1);
    }

#ifdef DEBUG_AN
    dump_GPU_array_to_file(Layer2_Neurons_GPU, (L1_OUT * POOL1_FMAP), "Layer2_Neurons_GPU.txt");
#endif
}

void conv_layer2() {

    cl_int out = 128;
    cl_int fr = 27;
    cl_int fc = 27;
    cl_int stride_width = 1;
    cl_int kernel_mask = 5;
    cl_int pad = 2;
    cl_int in_output = 48;
    cl_int group = 2;

    Layer2_bias_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                     sizeof(float) * L2_OUT, bias_2, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer2_bias_GPU\n");
        exit(1);
    }

    Layer2_Weights_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                        sizeof(float) * L2_KERNEL_SIZE * L2_OUT, Layer2_Weights_CPU, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer2_Weights_GPU\n");
        exit(1);
    }

    Layer2_Norm_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                     sizeof(float) * (L2_OUT * L2_FMAP), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer2_Norm_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 0, sizeof(cl_mem), &Layer2_bias_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_bias_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 1, sizeof(cl_mem), &Layer2_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 2, sizeof(cl_mem), &Layer2_Weights_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 3, sizeof(cl_mem), &Layer2_Norm_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Norm_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 4, sizeof(cl_int), &out);
    if (err < 0) {
        printf("Couldn't create a kernel argument out\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 5, sizeof(cl_int), &fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 6, sizeof(cl_int), &fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument fc\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 7, sizeof(cl_int), &stride_width);
    if (err < 0) {
        printf("Couldn't create a kernel argument stride_width\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 8, sizeof(cl_int), &kernel_mask);
    if (err < 0) {
        printf("Couldn't create a kernel argument kernel_mask\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 9, sizeof(cl_int), &pad);
    if (err < 0) {
        printf("Couldn't create a kernel argument pad\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 10, sizeof(cl_int), &in_output);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_output\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 11, sizeof(cl_int), &group);
    if (err < 0) {
        printf("Couldn't create a kernel argument group\n");
        exit(1);
    }

    /* Group = 2 and each group is 128*27*27 */

    local_size[0] = 27;
    local_size[1] = 27;
    global_size[0] = 128 * local_size[0];
    global_size[1] = 1 * local_size[1];

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_conv3d, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_conv3d\n");
        exit(1);
    }

#ifdef DEBUG_AN
    dump_GPU_array_to_file(Layer2_Norm_GPU, (L2_OUT * L2_FMAP), "Layer2_Norm_GPU_3dcov.txt");
#endif
    err = clSetKernelArg(kernel_conv3d_g2, 0, sizeof(cl_mem), &Layer2_bias_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_bias_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 1, sizeof(cl_mem), &Layer2_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 2, sizeof(cl_mem), &Layer2_Weights_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 3, sizeof(cl_mem), &Layer2_Norm_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Norm_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 4, sizeof(cl_int), &out);
    if (err < 0) {
        printf("Couldn't create a kernel argument out\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 5, sizeof(cl_int), &fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 6, sizeof(cl_int), &fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument fc\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 7, sizeof(cl_int), &stride_width);
    if (err < 0) {
        printf("Couldn't create a kernel argument stride_width\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 8, sizeof(cl_int), &kernel_mask);
    if (err < 0) {
        printf("Couldn't create a kernel argument kernel_mask\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 9, sizeof(cl_int), &pad);
    if (err < 0) {
        printf("Couldn't create a kernel argument pad\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 10, sizeof(cl_int), &in_output);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_output\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 11, sizeof(cl_int), &group);
    if (err < 0) {
        printf("Couldn't create a kernel argument group\n");
        exit(1);
    }

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_conv3d_g2, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_conv3d_g2\n");
        exit(1);
    }
#ifdef DEBUG_AN
    dump_GPU_array_to_file(Layer2_Norm_GPU, (L2_OUT * L2_FMAP), "Layer2_Norm_GPU_3dcovg2.txt");
#endif
}

void normalise_layer2() {

    Layer2_pool_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                     sizeof(float) * (L2_OUT * L2_FMAP), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer2_pool_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_normlrn, 0, sizeof(cl_mem), &Layer2_Norm_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Norm_GPU\n");
        exit(1);
    }
    err = clSetKernelArg(kernel_normlrn, 1, sizeof(cl_mem), &Layer2_pool_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_pool_GPU\n");
        exit(1);
    }

    local_size[0] = 27;
    local_size[1] = 27;
    global_size[0] = 256 * local_size[0];
    global_size[1] = 1 * local_size[1];

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_normlrn, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_normlrn\n");
        exit(1);
    }

}

void max_pool_layer2() {

    /* Max Pool */
    Layer3_Neurons_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                        sizeof(float) * (L2_OUT * POOL2_FMAP), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer3_Neurons_GPU\n");
        exit(1);
    }

    cl_int out = 256;
    cl_int out_fr = 13;
    cl_int out_fc = 13;
    cl_int kernel_mask = 3;
    cl_int stride_width = 2;
    cl_int in_fr = 27;
    cl_int in_fc = 27;

    err = clSetKernelArg(kernel_pool, 0, sizeof(cl_mem), &Layer2_pool_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_pool_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 1, sizeof(cl_mem), &Layer3_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer3_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 2, sizeof(cl_int), &out);
    if (err < 0) {
        printf("Couldn't create a kernel argument out err=%d\n", err);
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 3, sizeof(cl_int), &out_fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument out_fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 4, sizeof(cl_int), &out_fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument out_fc\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 5, sizeof(cl_int), &kernel_mask);
    if (err < 0) {
        printf("Couldn't create a kernel argument kernel_mask\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 6, sizeof(cl_int), &stride_width);
    if (err < 0) {
        printf("Couldn't create a kernel argument stride_width\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 7, sizeof(cl_int), &in_fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 8, sizeof(cl_int), &in_fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_fc\n");
        exit(1);
    }

    local_size[0] = 13;
    local_size[1] = 13;
    global_size[0] = 256 * local_size[0];
    global_size[1] = 1 * local_size[1];

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_pool, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_pool\n");
        exit(1);
    }
#ifdef DEBUG_AN
    dump_GPU_array_to_file(Layer3_Neurons_GPU, (L2_OUT * POOL2_FMAP), "Layer3_Neurons_GPU_pool.txt");
#endif
}

void conv_layer3() {

    Layer3_bias_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                     sizeof(float) * L3_OUT, bias_3, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer3_bias_GPU\n");
        exit(1);
    }


    Layer3_Weights_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                        sizeof(float) * L3_KERNEL_SIZE * L3_OUT, Layer3_Weights_CPU, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer3_Weights_GPU\n");
        exit(1);
    }


    Layer4_Neurons_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                        sizeof(float) * (L3_OUT * L3_FMAP), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer4_Neurons_GPU\n");
        exit(1);
    }

    local_size[0] = 13;
    local_size[1] = 13;
    global_size[0] = 384 * local_size[0];
    global_size[1] = 1 * local_size[1];

    cl_int out = 384;
    cl_int fr = 13;
    cl_int fc = 13;
    cl_int stride_width = 1;
    cl_int kernel_mask = 3;
    cl_int pad = 1;
    cl_int in_output = 256;
    cl_int group = 1;

    err = clSetKernelArg(kernel_conv3d, 0, sizeof(cl_mem), &Layer3_bias_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_bias_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 1, sizeof(cl_mem), &Layer3_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 2, sizeof(cl_mem), &Layer3_Weights_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 3, sizeof(cl_mem), &Layer4_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Norm_GPU\n");
        exit(1);
    }


    err = clSetKernelArg(kernel_conv3d, 4, sizeof(cl_int), &out);
    if (err < 0) {
        printf("Couldn't create a kernel argument out\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 5, sizeof(cl_int), &fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 6, sizeof(cl_int), &fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument fc\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 7, sizeof(cl_int), &stride_width);
    if (err < 0) {
        printf("Couldn't create a kernel argument stride_width\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 8, sizeof(cl_int), &kernel_mask);
    if (err < 0) {
        printf("Couldn't create a kernel argument kernel_mask\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 9, sizeof(cl_int), &pad);
    if (err < 0) {
        printf("Couldn't create a kernel argument pad\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 10, sizeof(cl_int), &in_output);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_output\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 11, sizeof(cl_int), &group);
    if (err < 0) {
        printf("Couldn't create a kernel argument group\n");
        exit(1);
    }

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_conv3d, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_conv3d\n");
        exit(1);
    }

}

void conv_layer4() {

    Layer4_bias_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                     sizeof(float) * L4_OUT, bias_4, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer4_bias_GPU\n");
        exit(1);
    }

    Layer4_Weights_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                        sizeof(float) * L4_KERNEL_SIZE * L4_OUT, Layer4_Weights_CPU, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer4_Weights_GPU\n");
        exit(1);
    }

    Layer5_Neurons_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                        sizeof(float) * (L4_OUT * L4_FMAP), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer4_Neurons_GPU\n");
        exit(1);
    }

    local_size[0] = 13;
    local_size[1] = 13;
    global_size[0] = 192 * local_size[0];
    global_size[1] = 1 * local_size[1];

    cl_int out = 192;
    cl_int fr = 13;
    cl_int fc = 13;
    cl_int stride_width = 1;
    cl_int kernel_mask = 3;
    cl_int pad = 1;
    cl_int in_output = 192;
    cl_int group = 2;

    err = clSetKernelArg(kernel_conv3d, 0, sizeof(cl_mem), &Layer4_bias_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer4_bias_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 1, sizeof(cl_mem), &Layer4_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer4_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 2, sizeof(cl_mem), &Layer4_Weights_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 3, sizeof(cl_mem), &Layer5_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer5_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 4, sizeof(cl_int), &out);
    if (err < 0) {
        printf("Couldn't create a kernel argument out\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 5, sizeof(cl_int), &fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 6, sizeof(cl_int), &fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument fc\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 7, sizeof(cl_int), &stride_width);
    if (err < 0) {
        printf("Couldn't create a kernel argument stride_width\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 8, sizeof(cl_int), &kernel_mask);
    if (err < 0) {
        printf("Couldn't create a kernel argument kernel_mask\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 9, sizeof(cl_int), &pad);
    if (err < 0) {
        printf("Couldn't create a kernel argument pad\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 10, sizeof(cl_int), &in_output);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_output\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 11, sizeof(cl_int), &group);
    if (err < 0) {
        printf("Couldn't create a kernel argument group\n");
        exit(1);
    }

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_conv3d, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_conv3d\n");
        exit(1);
    }

    out = 192;
    fr = 13;
    fc = 13;
    stride_width = 1;
    kernel_mask = 3;
    pad = 1;
    in_output = 192;
    group = 2;

    err = clSetKernelArg(kernel_conv3d_g2, 0, sizeof(cl_mem), &Layer4_bias_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer4_bias_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 1, sizeof(cl_mem), &Layer4_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer4_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 2, sizeof(cl_mem), &Layer4_Weights_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer4_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 3, sizeof(cl_mem), &Layer5_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer5_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 4, sizeof(cl_int), &out);
    if (err < 0) {
        printf("Couldn't create a kernel argument out\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 5, sizeof(cl_int), &fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 6, sizeof(cl_int), &fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument fc\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 7, sizeof(cl_int), &stride_width);
    if (err < 0) {
        printf("Couldn't create a kernel argument stride_width\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 8, sizeof(cl_int), &kernel_mask);
    if (err < 0) {
        printf("Couldn't create a kernel argument kernel_mask\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 9, sizeof(cl_int), &pad);
    if (err < 0) {
        printf("Couldn't create a kernel argument pad\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 10, sizeof(cl_int), &in_output);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_output\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 11, sizeof(cl_int), &group);
    if (err < 0) {
        printf("Couldn't create a kernel argument group\n");
        exit(1);
    }

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_conv3d_g2, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_conv3d_g2\n");
        exit(1);
    }

}

void conv_layer5() {

    /* Fifth Layer convolution + ReLU + pooling */
    Layer5_bias_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                     sizeof(float) * L5_OUT, bias_5, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer5_bias_GPU\n");
        exit(1);
    }

    Layer5_Weights_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                        sizeof(float) * L5_KERNEL_SIZE * L5_OUT, Layer5_Weights_CPU, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer5_Weights_GPU\n");
        exit(1);
    }

    Layer5_pool_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                     sizeof(float) * (L5_OUT * L5_FMAP), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer5_pool_GPU\n");
        exit(1);
    }

    local_size[0] = 13;
    local_size[1] = 13;
    global_size[0] = 128 * local_size[0];
    global_size[1] = 128 * local_size[1];

    cl_int out = 128;
    cl_int fr = 13;
    cl_int fc = 13;
    cl_int stride_width = 1;
    cl_int kernel_mask = 3;
    cl_int pad = 1;
    cl_int in_output = 192;
    cl_int group = 2;

    err = clSetKernelArg(kernel_conv3d, 0, sizeof(cl_mem), &Layer5_bias_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer5_bias_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 1, sizeof(cl_mem), &Layer5_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer5_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 2, sizeof(cl_mem), &Layer5_Weights_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 3, sizeof(cl_mem), &Layer5_pool_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer2_Norm_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 4, sizeof(cl_int), &out);
    if (err < 0) {
        printf("Couldn't create a kernel argument out\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 5, sizeof(cl_int), &fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 6, sizeof(cl_int), &fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument fc\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 7, sizeof(cl_int), &stride_width);
    if (err < 0) {
        printf("Couldn't create a kernel argument stride_width\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 8, sizeof(cl_int), &kernel_mask);
    if (err < 0) {
        printf("Couldn't create a kernel argument kernel_mask\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 9, sizeof(cl_int), &pad);
    if (err < 0) {
        printf("Couldn't create a kernel argument pad\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 10, sizeof(cl_int), &in_output);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_output\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d, 11, sizeof(cl_int), &group);
    if (err < 0) {
        printf("Couldn't create a kernel argument group\n");
        exit(1);
    }

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_conv3d, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_conv3d\n");
        exit(1);
    }

    out = 128;
    fr = 13;
    fc = 13;
    stride_width = 1;
    kernel_mask = 3;
    pad = 1;
    in_output = 192;
    group = 2;

    err = clSetKernelArg(kernel_conv3d_g2, 0, sizeof(cl_mem), &Layer5_bias_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer5_bias_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 1, sizeof(cl_mem), &Layer5_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer5_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 2, sizeof(cl_mem), &Layer5_Weights_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer5_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 3, sizeof(cl_mem), &Layer5_pool_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer5_pool_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 4, sizeof(cl_int), &out);
    if (err < 0) {
        printf("Couldn't create a kernel argument out\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 5, sizeof(cl_int), &fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 6, sizeof(cl_int), &fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument fc\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 7, sizeof(cl_int), &stride_width);
    if (err < 0) {
        printf("Couldn't create a kernel argument stride_width\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 8, sizeof(cl_int), &kernel_mask);
    if (err < 0) {
        printf("Couldn't create a kernel argument kernel_mask\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 9, sizeof(cl_int), &pad);
    if (err < 0) {
        printf("Couldn't create a kernel argument pad\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 10, sizeof(cl_int), &in_output);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_output\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_conv3d_g2, 11, sizeof(cl_int), &group);
    if (err < 0) {
        printf("Couldn't create a kernel argument group\n");
        exit(1);
    }

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_conv3d_g2, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_conv3d_g2\n");
        exit(1);
    }

    /*cudaMalloc((void**) &Layer6_Neurons_GPU,sizeof(float)*L5_OUT * POOL3_FMAP);*/

    Layer6_Neurons_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                        sizeof(float) * (L5_OUT * POOL3_FMAP), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer6_Neurons_GPU\n");
        exit(1);
    }

    local_size[0] = 6;
    local_size[1] = 6;
    global_size[0] = 256 * local_size[0];
    global_size[1] = 256 * local_size[1];

    out = 256;
    cl_int out_fr = 6;
    cl_int out_fc = 6;
    kernel_mask = 3;
    stride_width = 2;
    cl_int in_fr = 13;
    cl_int in_fc = 13;

    err = clSetKernelArg(kernel_pool, 0, sizeof(cl_mem), &Layer5_pool_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer5_pool_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 1, sizeof(cl_mem), &Layer6_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer6_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 2, sizeof(cl_int), &out);
    if (err < 0) {
        printf("Couldn't create a kernel argument out\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 3, sizeof(cl_int), &out_fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument out_fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 4, sizeof(cl_int), &out_fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument out_fc\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 5, sizeof(cl_int), &kernel_mask);
    if (err < 0) {
        printf("Couldn't create a kernel argument kernel_mask\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 6, sizeof(cl_int), &stride_width);
    if (err < 0) {
        printf("Couldn't create a kernel argument stride_width\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 7, sizeof(cl_int), &in_fr);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_fr\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_pool, 8, sizeof(cl_int), &in_fc);
    if (err < 0) {
        printf("Couldn't create a kernel argument in_fc\n");
        exit(1);
    }

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_pool, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_pool\n");
        exit(1);
    }
}

void conv_layer6() {

    /* Sixth Layer Fully connected + ReLU */
    Layer6_bias_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                     sizeof(float) * 4096, bias_6, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer6_bias_GPU\n");
        exit(1);
    }

    Layer6_Weights_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                        sizeof(float) * 4096 * 256 * 6 * 6, Layer6_Weights_CPU, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer6_Weights_GPU\n");
        exit(1);
    }

    Layer7_Neurons_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                        sizeof(float) * (4096), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer7_Neurons_GPU\n");
        exit(1);
    }

    local_size[0] = 1;
    local_size[1] = 1;
    global_size[0] = 4096 * local_size[0];
    global_size[1] = 1 * local_size[1];

    cl_int output = 4096;
    cl_int input = 256 * 6 * 6;
    cl_int reLU = true;
    cl_int dropout = false;

    err = clSetKernelArg(kernel_fully_connected, 0, sizeof(Layer6_bias_GPU), &Layer6_bias_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer6_bias_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 1, sizeof(cl_mem), &Layer6_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer6_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 2, sizeof(cl_mem), &Layer6_Weights_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer6_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 3, sizeof(cl_mem), &Layer7_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer6_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 4, sizeof(cl_int), &output);
    if (err < 0) {
        printf("Couldn't create a kernel argument output\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 5, sizeof(cl_int), &input);
    if (err < 0) {
        printf("Couldn't create a kernel argument input\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 6, sizeof(cl_int), &reLU);
    if (err < 0) {
        printf("Couldn't create a kernel argument reLU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 7, sizeof(cl_int), &dropout);
    if (err < 0) {
        printf("Couldn't create a kernel argument dropout\n");
        exit(1);
    }

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_fully_connected, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_fully_connected\n");
        exit(1);
    }
}

void conv_layer7() {

    /* Seventh Layer Fully connected + ReLU */
    Layer7_bias_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                     sizeof(float) * 4096, bias_7, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer7_bias_GPU\n");
        exit(1);
    }

    Layer7_Weights_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                        sizeof(float) * 4096 * 4096, Layer7_Weights_CPU, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer7_Weights_GPU\n");
        exit(1);
    }

    Layer8_Neurons_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                        sizeof(float) * (4096), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer7_Neurons_GPU\n");
        exit(1);
    }

    local_size[0] = 1;
    local_size[1] = 1;

    global_size[0] = 4096 * local_size[0];
    global_size[1] = 4096 * local_size[1];

    cl_int output = 4096;
    cl_int input = 4096;
    cl_int reLU = true;
    cl_int dropout = false;

    err = clSetKernelArg(kernel_fully_connected, 0, sizeof(cl_mem), &Layer7_bias_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer7_bias_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 1, sizeof(cl_mem), &Layer7_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer7_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 2, sizeof(cl_mem), &Layer7_Weights_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer6_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 3, sizeof(cl_mem), &Layer8_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer6_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 4, sizeof(cl_int), &output);
    if (err < 0) {
        printf("Couldn't create a kernel argument output\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 5, sizeof(cl_int), &input);
    if (err < 0) {
        printf("Couldn't create a kernel argument input\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 6, sizeof(cl_int), &reLU);
    if (err < 0) {
        printf("Couldn't create a kernel argument reLU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 7, sizeof(cl_int), &dropout);
    if (err < 0) {
        printf("Couldn't create a kernel argument dropout\n");
        exit(1);
    }

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_fully_connected, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_fully_connected\n");
        exit(1);
    }
}

void conv_layer8() {

    Layer8_bias_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                     sizeof(float) * 1000, bias_8, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer8_bias_GPU\n");
        exit(1);
    }

    Layer8_Weights_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_COPY_HOST_PTR,
                                        sizeof(float) * 4096 * 1000, Layer8_Weights_CPU, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer8_Weights_GPU\n");
        exit(1);
    }

    Layer9_Neurons_GPU = clCreateBuffer(context, CL_MEM_READ_WRITE,
                                        sizeof(float) * (1000), NULL, &err);
    if (err < 0) {
        printf("Couldn't create a buffer Layer9_Neurons_GPU\n");
        exit(1);
    }

    local_size[0] = 1;
    local_size[1] = 1;
    global_size[0] = 1000 * local_size[0];
    global_size[1] = 1 * local_size[1];

    cl_int output = 1000;
    cl_int input = 4096;
    cl_int reLU = false;
    cl_int dropout = false;

    err = clSetKernelArg(kernel_fully_connected, 0, sizeof(cl_mem), &Layer8_bias_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer8_bias_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 1, sizeof(cl_mem), &Layer8_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer8_Neurons_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 2, sizeof(cl_mem), &Layer8_Weights_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer8_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 3, sizeof(cl_mem), &Layer9_Neurons_GPU);
    if (err < 0) {
        printf("Couldn't create a kernel argument Layer6_Weights_GPU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 4, sizeof(cl_int), &output);
    if (err < 0) {
        printf("Couldn't create a kernel argument output\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 5, sizeof(cl_int), &input);
    if (err < 0) {
        printf("Couldn't create a kernel argument input\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 6, sizeof(cl_int), &reLU);
    if (err < 0) {
        printf("Couldn't create a kernel argument reLU\n");
        exit(1);
    }

    err = clSetKernelArg(kernel_fully_connected, 7, sizeof(cl_int), &dropout);
    if (err < 0) {
        printf("Couldn't create a kernel argument dropout\n");
        exit(1);
    }

    /* Enqueue kernel */
    err = clEnqueueNDRangeKernel(queue, kernel_fully_connected, 2, NULL, global_size,
                                 local_size, 0, NULL, NULL);
    if (err < 0) {
        printf("Couldn't enqueue the kernel_fully_connected\n");
        exit(1);
    }
}

long get_time_us() {
    struct timeval current_time;

    gettimeofday(&current_time, NULL);
    return current_time.tv_sec * (int) 1e6 + current_time.tv_usec;
}

void collect_results() {
    unsigned long start, end;
    start = get_time_us();
    printf("Staring CL finish\n");
    clFinish(queue);
    clFlush(queue);
    end = get_time_us();
    printf("\tCL finished, took %ld us\n", end - start);

    printf("Copying data from GPU\n");
    start = get_time_us();

    err = clEnqueueReadBuffer(queue, Layer9_Neurons_GPU, CL_TRUE, 0, sizeof(float) * 1000,
                              fc9_Neurons_CPU, 0, NULL, NULL);

    if (err < 0) {
        printf("Couldn't clEnqueueReadBuffer for results\n");
        exit(1);
    }
    end = get_time_us();
    printf("\tCopying data from GPU took %ld us\n", end - start);

#ifdef DEBUG_AN
    dump_CPU_array_to_file(fc9_Neurons_CPU, 1000, "final_results.txt");
#endif
    printf("Finding highest probability prediction\n");
    /* Check the output */
    float max = 0.0;
    int index = 0;
    for (int i = 0; i < 1000; i++) {
        if (max < fc9_Neurons_CPU[i]) {
            max = fc9_Neurons_CPU[i];
            index = i;
        }
    }
    printf("=========================\n");
    printf("Predicted Class id is = %d\n", index);
    printf("=========================\n");
}

int parse_input_param(int argc, char **argv) {

    if (argc == 2) {
        input_file = argv[1];
        return 0;
    }
    return -1;
}

void init_opencl() {

    cl_device_id device;
    cl_platform_id platform;
    size_t valueSize;
    int i, j;
    char *value;

    /* Identify a platform */
    err = clGetPlatformIDs(1, &platform, NULL);
    if (err < 0) {
        printf("Couldn't identify a platform");
        exit(1);
    }

    /* Access a device */
    err = clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1, &device, NULL);
    if (err == CL_DEVICE_NOT_FOUND) {
        err = clGetDeviceIDs(platform, CL_DEVICE_TYPE_CPU, 1, &device, NULL);
        if (err == CL_DEVICE_NOT_FOUND) {
            printf("Couldn't access any devices");
            exit(1);
        }
    }

    clGetDeviceInfo(device, CL_DEVICE_NAME, 0, NULL, &valueSize);
    value = (char *) malloc(valueSize);
    clGetDeviceInfo(device, CL_DEVICE_NAME, valueSize, value, NULL);
    printf("Device: %s\n", value);
    free(value);

    if (!device) {
        printf("Couldn't create a context\n");
        exit(1);
    }
    context = clCreateContext(NULL, 1, &device, NULL, NULL, &err);
    if (err < 0) {
        printf("Couldn't create a context\n");
        exit(1);
    }
    allocate_mem();
    /* Build program */
    program = build_program(context, device, PROGRAM_FILE);
    /* Create a command queue */
    queue = clCreateCommandQueue(context, device, 0, &err);
    if (err < 0) {
        printf("Couldn't create a command queue\n");
        exit(1);
    }

    /* build OpenCL kernels */
    build_kernels();
}

void show_usage(char *base) {
    printf("Usage: %s <input_filename>\n"
           "input_filename is the txt file which represents"
           " the 3 channel pixel values of an image\n", base);
}

int main(int argc, char **argv) {

    /* variables for time measurements */
    unsigned long start, start_an;
    unsigned long end, total;

    if (parse_input_param(argc, argv) < 0) {
        show_usage(argv[0]);
        exit(-1);
    }

    /* OpenCl initialization stuff */
    init_opencl();

    /* load bias and weights */
    init_data();

    /* kick-off Alex Net layers */
    printf("\n========= Executing AlexNet =========\n");
    printf("Starting Layer1\n");
    start = get_time_us();
    start_an = start;
    conv_layer1();
    normalise_layer1();
    max_pool_layer1();
    end = get_time_us();
    printf("\tLayer1 took %ld us\n", end - start);

    printf("Starting Layer2\n");
    start = get_time_us();
    conv_layer2();
    normalise_layer2();
    max_pool_layer2();
    end = get_time_us();
    printf("\tLayer2 took %ld us\n", end - start);

    printf("Starting Layer3\n");
    start = get_time_us();
    conv_layer3();
    end = get_time_us();
    printf("\tLayer3 took %ld us\n", end - start);

    printf("Starting Layer4\n");
    start = get_time_us();
    conv_layer4();
    end = get_time_us();
    printf("\tLayer4 took %ld us\n", end - start);

    printf("Starting Layer5\n");
    start = get_time_us();
    conv_layer5();
    end = get_time_us();
    printf("\tLayer5 took %ld us\n", end - start);

    printf("Starting Layer6\n");
    start = get_time_us();
    conv_layer6();
    end = get_time_us();
    printf("\tLayer6 took %ld us\n", end - start);

    printf("Starting Layer7\n");
    start = get_time_us();
    conv_layer7();
    end = get_time_us();
    printf("\tLayer7 took %ld us\n", end - start);

    printf("Starting Layer8\n");
    start = get_time_us();
    conv_layer8();
    end = get_time_us();
    printf("\tLayer8 took %ld us\n", end - start);

    total = end - start_an;
    printf("All layers took total %ld us\n", total);

    /* Checking for results */
    collect_results();

    /* release GPU and CPU resources */
    cleanup_mem();

    return 0;
}

#pragma clang diagnostic pop
