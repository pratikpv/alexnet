/**********************************************************************
* FILENAME :        alexnet_host.cu             
* 
* DESCRIPTION :
*       Host side implementation of AlexNet network
*
* NOTES :
*       This file includes CUDA memory allocations and CUDA
*       memory copies to host.
*       Invokes kernel from host.
*       Reads inputs and weight from files
* 
* AUTHOR :    Aajna Karki 
*             https://www.linkedin.com/in/aajna/
*********************************************************************/

// includes, system
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>
// includes, project
//#include <cutil.h>
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
//#define CPU
//#define NUM 10
// includes, kernels
#include "an_kernel.cu"
////////////////////////////////////////////////////////////////////////////////
// declaration, forward
extern "C"
void NeuralNetwork();
unsigned g_verbose;
unsigned NUM;
void extract_weights(const char *pFileName,float *layer_weights,bool bias)
{
	FILE * pFile1 = fopen (pFileName,"rb");
	char delim[2];
	if(bias == true)
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
	if (pFile1 != NULL && (bias == false))
	{
		//printf(" File FOUND %s\n",pFileName);
		{
			
			//fread(weights,sizeof(weights),1,pFile1);
			//token = strtok(weights,delim);
			//while(token != NULL)
			while (getline(&line, &len, pFile1) != -1)
			{
				token = strtok(line,delim);
				float temp_num = atof(token);
			        layer_weights[count] = temp_num;	
				//printf("%.8f\t",temp_num); 
				count++; 
			//	token = strtok(NULL,delim);
			}
		}
		//printf("Final Count : %d\n",count);
		fclose(pFile1);
	}
	if (pFile1 != NULL && (bias == true))
	{
		//printf(" File FOUND %s\n",pFileName);
		{

			char weights[94590] = "";
			fread(weights,sizeof(weights),1,pFile1);
			token = strtok(weights,delim);
			while(token != NULL)
			{
				float temp_num = atof(token);
			        layer_weights[count] = temp_num;	
				//printf("%.8f\t",temp_num); 
				count++; 
				token = strtok(NULL,delim);
			}
		}
		//printf("Final Count : %d\n",count);
		fclose(pFile1);
	}

}
int main(int argc, char** argv)
{
	int i, commandline_error;
	commandline_error = 0;
	g_verbose = 0;
	if (argc >= 2) {
		NUM = atoi(argv[1]);
		for (i=2; i < argc;i++) {
			if (argv[i][0] == '-') {
				switch (argv[i][1]) {
				case 'v': g_verbose = 1;
					break;
				default: commandline_error=1;
				}
			}
			else commandline_error=1;
		}
	} else commandline_error=1;
	if (commandline_error || !NUM) {
		printf("Usage: ./AN <NUM> [-v]\n");
		printf("where NUM is the number of images to process in parallel (up to 10000 for the t10k-images-idx3-ubyte database file) and -v is used to display approximately what each image looks like.\n");
		return 1;
	}
	NeuralNetwork();
}
void Fill_weights(float *Layer1_Weights_CPU,float *Layer2_Weights_CPU,float *Layer3_Weights_CPU,float *Layer4_Weights_CPU,float *Layer5_Weights_CPU,float *Layer6_Weights_CPU,float *Layer7_Weights_CPU,float *Layer8_Weights_CPU)
{
	printf("Loading weights\n");
	extract_weights("data/conv1.txt",Layer1_Weights_CPU,false);
	extract_weights("data/conv2.txt",Layer2_Weights_CPU,false);
	extract_weights("data/conv3.txt",Layer3_Weights_CPU,false);
	extract_weights("data/conv4.txt",Layer4_Weights_CPU,false);
	extract_weights("data/conv5.txt",Layer5_Weights_CPU,false);
	extract_weights("data/fc6.txt",Layer6_Weights_CPU,false);
	extract_weights("data/fc7.txt",Layer7_Weights_CPU,false);
	extract_weights("data/fc8.txt",Layer8_Weights_CPU,false);
	//printf("Extracted Weights and Bias successfully\n");
}
void Fill_bias(float *bias_1,float *bias_2,float *bias_3,float *bias_4,float *bias_5,float *bias_6,float *bias_7,float *bias_8)
{
	printf("Loading bias values\n");
	extract_weights("data/bias1.txt",bias_1,true);
	extract_weights("data/bias2.txt",bias_2,true);
	extract_weights("data/bias3.txt",bias_3,true);
	extract_weights("data/bias4.txt",bias_4,true);
	extract_weights("data/bias5.txt",bias_5,true);
	extract_weights("data/bias6.txt",bias_6,true);
	extract_weights("data/bias7.txt",bias_7,true);
	extract_weights("data/bias8.txt",bias_8,true);
}
void readIn(float *layer1)
{
	printf("Loading input\n");
	FILE *fp = fopen ("data/input.txt","rb");
	size_t len;
        char delim[1];
        delim[0] = '\n';
	int count = 0;
	char *token;
        char *line = NULL;
	if (fp != NULL)
	{
		//printf(" File FOUND\n");
		{
			while ((getline(&line, &len, fp)) != -1)
			{
                                token = strtok(line,delim);
                                layer1[count] = atof(token);
				count++;		
			}
			//printf("READ INPUT Final Count :: %d\n",count);		
		}
		fclose(fp);
	}
	else
	{
		printf(" File NOt FOUND\n");
	}
}

unsigned long get_time_us() {
    struct timeval current_time;

    gettimeofday(&current_time, NULL);
    return (unsigned long)(current_time.tv_sec * (unsigned long) 1e6 + (unsigned long) current_time.tv_usec);
}
void NeuralNetwork()
{

    unsigned long start, start_total;
    unsigned long end, end_total;

     start_total = get_time_us();
#ifndef CPU// Set the CUDA device	
	int deviceCount;                                                         
	cudaGetDeviceCount(&deviceCount);                
	if (deviceCount == 0) {                                                  
		fprintf(stderr, "There is no device.\n");                            
		exit(EXIT_FAILURE);                                                  
	}                                                                        
	int dev;                                                                 
	for (dev = 0; dev < deviceCount; ++dev) {                                
		cudaDeviceProp deviceProp;                                           
		cudaGetDeviceProperties(&deviceProp, dev);   
		if (deviceProp.major >= 1)                                           
			break;                                                           
	}                                                                        
	if (dev == deviceCount) {                                                
		fprintf(stderr, "There is no device supporting CUDA.\n");            
		exit(EXIT_FAILURE);                                                  
	}                                                                        
	else                                                                     
		cudaSetDevice(dev);
#endif  
        /* Read Input File 227*227*3 */	
	float *Layer1_Neurons_CPU = (float*) malloc (INPUT_SIZE * sizeof(float));
	readIn(Layer1_Neurons_CPU);

        /* Declaration of Bias and Weights for CPU */ 
	float bias_1[96],bias_2[256],bias_3[384],bias_4[384],bias_5[256],bias_6[4096],bias_7[4096],bias_8[1000];
	float *Layer1_Weights_CPU = (float *)malloc(sizeof(float) *(L1_KERNEL_SIZE * L1_OUT));
	float *Layer2_Weights_CPU = (float *)malloc(sizeof(float) *(L2_KERNEL_SIZE * L2_OUT));
	float *Layer3_Weights_CPU = (float *)malloc(sizeof(float) *(L3_KERNEL_SIZE * L3_OUT));
	float *Layer4_Weights_CPU = (float *)malloc(sizeof(float) *(L4_KERNEL_SIZE * L4_OUT));
	float *Layer5_Weights_CPU = (float *)malloc(sizeof(float) *(L5_KERNEL_SIZE * L5_OUT));
	float *Layer6_Weights_CPU = (float *)malloc(sizeof(float) *(4096*256*6*6));
	float *Layer7_Weights_CPU = (float *)malloc(sizeof(float) *(4096*4096));
	float *Layer8_Weights_CPU = (float *)malloc(sizeof(float) *(4096*1000));
        
	/* Fill Bias and Weights */	
	Fill_bias(bias_1,bias_2,bias_3,bias_4,bias_5,bias_6,bias_7,bias_8);
        Fill_weights(Layer1_Weights_CPU,Layer2_Weights_CPU,Layer3_Weights_CPU,Layer4_Weights_CPU,Layer5_Weights_CPU,Layer6_Weights_CPU,Layer7_Weights_CPU,Layer8_Weights_CPU);

        /* if CPU = 1 then CPU version of code ,else CUDA code */
#ifdef CPU 
	/* First Layer convolution + ReLU + pooling */ 

    float *Layer2_Neurons_CPU = (float *)malloc(sizeof(float) *(96*55*55));
	executeFirstLayer(bias_1,Layer1_Neurons_CPU,Layer1_Weights_CPU,Layer2_Neurons_CPU,4,227,55,55,96);
	/*Normalisation */	
    float *Layer2_Norm_CPU = (float *)malloc(sizeof(float) *(96*55*55));
    executelrnNorm(Layer2_Neurons_CPU,0.0001,0.75,5,96,55,55,Layer2_Norm_CPU);
    /* Max Pool */
    float *Layer2_pool_CPU = (float *)malloc(sizeof(float) *(96*27*27));
    pooling(Layer2_Norm_CPU,Layer2_pool_CPU,96,27,27,3,2,55,55);

	/* Second Layer */	
	float *Layer3_Neurons_CPU = (float *)malloc(sizeof(float) *(256*27*27));
	execute3Dconvolution(bias_2,Layer2_pool_CPU,Layer2_Weights_CPU,Layer3_Neurons_CPU,256,27,27,1,5,2,96,2);
    /*Normalisation */
    float *Layer3_Norm_CPU = (float *)malloc(sizeof(float) *(256*27*27));
    executelrnNorm(Layer3_Neurons_CPU,0.0001,0.75,5,256,27,27,Layer3_Norm_CPU);
    /* Max Pool */ 
	float *Layer3_pool_CPU = (float *)malloc(sizeof(float) *(256*13*13));
    pooling(Layer3_Norm_CPU,Layer3_pool_CPU,256,13,13,3,2,27,27);

	/* Third Layer convolution + ReLU  */ 
	float *Layer4_Neurons_CPU = (float *)malloc(sizeof(float) *(384*13*13));
	execute3Dconvolution(bias_3,Layer3_pool_CPU,Layer3_Weights_CPU,Layer4_Neurons_CPU,384,13,13,1,3,1,256,1);
	
	/* Fourth Layer convolution + ReLU  */ 
	float *Layer5_Neurons_CPU = (float *)malloc(sizeof(float) *(384*13*13));
	execute3Dconvolution(bias_4,Layer4_Neurons_CPU,Layer4_Weights_CPU,Layer5_Neurons_CPU,384,13,13,1,3,1,384,2);

	/* Fifth Layer convolution + ReLU + pooling */ 
	float *fc6_Neurons_CPU = (float *)malloc(sizeof(float) *(256*13*13));
	execute3Dconvolution(bias_5,Layer5_Neurons_CPU,Layer5_Weights_CPU,fc6_Neurons_CPU,256,13,13,1,3,1,384,2);
	float *fc6_pool_CPU = (float *)malloc(sizeof(float) *(256*6*6));
    pooling(fc6_Neurons_CPU,fc6_pool_CPU,256,6,6,3,2,13,13);

    /* Sixth Layer Fully connected + ReLU */	
	float *fc7_Neurons_CPU = (float *)malloc(sizeof(float) * (4096));
	executeFCLayer(bias_6,fc6_pool_CPU,Layer6_Weights_CPU,fc7_Neurons_CPU,4096,(256*6*6),true,true);

	/* Seventh Layer Fully connected + ReLU */	
	float *fc8_Neurons_CPU = (float *)malloc(sizeof(float) * (4096));
	executeFCLayer(bias_7,fc7_Neurons_CPU,Layer7_Weights_CPU,fc8_Neurons_CPU,4096,4096,true,true);

    /*Eigth Layer */
	float *fc9_Neurons_CPU = (float *)malloc(sizeof(float) * (1000));
	executeFCLayer(bias_8,fc8_Neurons_CPU,Layer8_Weights_CPU,fc9_Neurons_CPU,1000,4096,false,false);
#else
    /*Layer1 */
    // Layer1 Neurons -> Layer1_norm -> Layer1_pool -> Layer2_Neurons-> 

	printf("\n========= Executing AlexNet =========\n");
	float *Layer1_bias_GPU,*Layer1_Weights_GPU,*Layer1_Neurons_GPU,*Layer1_Norm_GPU,*Layer1_pool_GPU,*Layer2_Neurons_GPU;

	cudaMalloc((void**) &Layer1_Neurons_GPU, sizeof(float)* INPUT_SIZE);
	cudaMalloc((void**) &Layer1_Weights_GPU, sizeof(float)* L1_KERNEL_SIZE * L1_OUT);
	cudaMalloc((void**) &Layer1_bias_GPU, sizeof(float)* L1_OUT);
	cudaMalloc((void**) &Layer1_Norm_GPU, sizeof(float)* (L1_OUT * L1_FMAP));

	cudaMemcpy(Layer1_Weights_GPU,Layer1_Weights_CPU, sizeof(float)*L1_KERNEL_SIZE * L1_OUT, cudaMemcpyHostToDevice);
	cudaMemcpy(Layer1_Neurons_GPU,Layer1_Neurons_CPU, sizeof(float)*INPUT_SIZE, cudaMemcpyHostToDevice);
	cudaMemcpy(Layer1_bias_GPU,bias_1, sizeof(float)* L1_OUT, cudaMemcpyHostToDevice);
    /* Output is 96*55*55 , hence launch as 96*32*32 + 96*23*23 */

	unsigned long execution_time = 0;
	unsigned long layer_count = 0;
	printf("Starting Layer1\n");
	dim3 Layer1_Block(96,1,1);
	dim3 Layer1_Thread(32,32);
    	start = get_time_us();
	executeFirstLayer<<<Layer1_Block,Layer1_Thread>>>(Layer1_bias_GPU,Layer1_Neurons_GPU,Layer1_Weights_GPU,Layer1_Norm_GPU,0,0);
    	end = get_time_us();
	execution_time += (end-start);
	dim3 Layer11_Block(96,1,1);
	dim3 Layer11_Thread(32,23);	
    	start = get_time_us();
	executeFirstLayer<<<Layer11_Block,Layer11_Thread>>>(Layer1_bias_GPU,Layer1_Neurons_GPU,Layer1_Weights_GPU,Layer1_Norm_GPU,0,32);
    	end = get_time_us();
	execution_time += (end-start);
	dim3 Layer12_Block(96,1,1);
	dim3 Layer12_Thread(23,32);	
    	start = get_time_us();
	executeFirstLayer<<<Layer12_Block,Layer12_Thread>>>(Layer1_bias_GPU,Layer1_Neurons_GPU,Layer1_Weights_GPU,Layer1_Norm_GPU,32,0);
    	end = get_time_us();
	execution_time += (end-start);
	dim3 Layer13_Block(96,1,1);
	dim3 Layer13_Thread(23,23);	
    	start = get_time_us();
	executeFirstLayer<<<Layer13_Block,Layer13_Thread>>>(Layer1_bias_GPU,Layer1_Neurons_GPU,Layer1_Weights_GPU,Layer1_Norm_GPU,32,32);
    	end = get_time_us();
	execution_time += (end-start);
	printf("\t Layer1 Conv took %ld us\n", execution_time);
	layer_count += execution_time;

	/*Normalisation */
	execution_time = 0;
	cudaMalloc((void**) &Layer1_pool_GPU,sizeof(float)* L1_OUT*L1_FMAP);
	dim3 Norm1_Block(96,1,1);
	dim3 Norm1_Thread(32,32);   
    	start = get_time_us();
	executelrnNormCuda_split<<<Norm1_Block,Norm1_Thread>>>(Layer1_Norm_GPU,0.0001,0.75,5,96,55,55,Layer1_pool_GPU,0,0);
	end = get_time_us();
	execution_time += (end-start);
	dim3 Norm11_Block(96,1,1);
	dim3 Norm11_Thread(32,23);   
    	start = get_time_us();
	executelrnNormCuda_split<<<Norm11_Block,Norm11_Thread>>>(Layer1_Norm_GPU,0.0001,0.75,5,96,55,55,Layer1_pool_GPU,0,32);
	end = get_time_us();
	execution_time += (end-start);
	dim3 Norm12_Block(96,1,1);
	dim3 Norm12_Thread(23,32);   
    	start = get_time_us();
	executelrnNormCuda_split<<<Norm12_Block,Norm12_Thread>>>(Layer1_Norm_GPU,0.0001,0.75,5,96,55,55,Layer1_pool_GPU,32,0);
	end = get_time_us();
	execution_time += (end-start);	
	dim3 Norm13_Block(96,1,1);
	dim3 Norm13_Thread(23,23);   
    	start = get_time_us();
	executelrnNormCuda_split<<<Norm13_Block,Norm13_Thread>>>(Layer1_Norm_GPU,0.0001,0.75,5,96,55,55,Layer1_pool_GPU,32,32);
	end = get_time_us();
	execution_time += (end-start);
	printf("\t Layer1 Norm took %ld us\n", execution_time);
	layer_count += execution_time;

	/* Max Pool */
	cudaMalloc((void**) &Layer2_Neurons_GPU,sizeof(float)*L1_OUT * POOL1_FMAP);
	dim3 pool1_Block(96,1,1);
	dim3 pool1_Thread(27,27); 
    	start = get_time_us();
	executepoolingCuda<<<pool1_Block,pool1_Thread>>>(Layer1_pool_GPU,Layer2_Neurons_GPU,96,27,27,3,2,55,55);
	end = get_time_us();
	execution_time += (end-start);
	printf("\t Layer1 Max Pool took %ld us\n", execution_time);

	layer_count += execution_time;
	printf("\t ----------------------------\n");
	printf("\t Layer1 took %ld us\n", layer_count);

	printf("Starting Layer2\n");
	layer_count = 0;
	execution_time = 0;

	/* Second Layer convolution + ReLU + pooling */ 
	float *Layer2_bias_GPU,*Layer2_Weights_GPU,*Layer2_Norm_GPU,*Layer2_pool_GPU,*Layer3_Neurons_GPU;

	cudaMalloc((void**) &Layer2_Weights_GPU,sizeof(float)*(L2_KERNEL_SIZE * L2_OUT));
	cudaMalloc((void**) &Layer2_bias_GPU, sizeof(float)* L2_OUT);
	cudaMalloc((void**) &Layer2_Norm_GPU, sizeof(float)* L2_OUT * L2_FMAP);

	/* Memcpy of weights and bias */ 
	cudaMemcpy(Layer2_Weights_GPU,Layer2_Weights_CPU, sizeof(float)*(L2_KERNEL_SIZE * L2_OUT), cudaMemcpyHostToDevice);
	cudaMemcpy(Layer2_bias_GPU,bias_2, sizeof(float)* L2_OUT,cudaMemcpyHostToDevice);
 
    /* Group = 2 and each group is 128*27*27 */
	dim3 Layer2_Block(128,1,1);
	dim3 Layer2_Thread(27,27);   
	start = get_time_us();
	execute3DconvolutionCuda<<<Layer2_Block,Layer2_Thread>>>(Layer2_bias_GPU,Layer2_Neurons_GPU,Layer2_Weights_GPU,Layer2_Norm_GPU,128,27,27,1,5,2,48,2);
	execute3Dconvolutiongroup2Cuda<<<Layer2_Block,Layer2_Thread>>>(Layer2_bias_GPU,Layer2_Neurons_GPU,Layer2_Weights_GPU,Layer2_Norm_GPU,128,27,27,1,5,2,48,2);
	end = get_time_us();
	execution_time = (end-start);
	layer_count += execution_time;
	printf("\t Layer2 Conv took %ld us\n", execution_time);
	/*Normalisation */	
	(cudaMalloc((void**) &Layer2_pool_GPU,sizeof(float)*L2_OUT * L2_FMAP));
	dim3 Norm2_Block(256,1,1);
	dim3 Norm2_Thread(27,27);   
	start = get_time_us();
	executelrnNormCuda<<<Norm2_Block,Norm2_Thread>>>(Layer2_Norm_GPU,0.0001,0.75,5,256,27,27,Layer2_pool_GPU,0);
	end = get_time_us();
	execution_time = (end-start);
	layer_count += execution_time;
	printf("\t Layer2 Norm took %ld us\n", execution_time);
	/* Max Pool */
	cudaMalloc((void**) &Layer3_Neurons_GPU,sizeof(float)*L2_OUT * POOL2_FMAP);
	dim3 pool2_Block(256,1,1);
	dim3 pool2_Thread(13,13);   
	start = get_time_us();
	executepoolingCuda<<<pool2_Block,pool2_Thread>>>(Layer2_pool_GPU,Layer3_Neurons_GPU,256,13,13,3,2,27,27);
	end = get_time_us();
	execution_time = (end-start);
	layer_count += execution_time;
	printf("\t Layer2 Max Pool took %ld us\n", execution_time);
	printf("\t ----------------------------\n");
    	printf("\t Layer2 took %ld us\n", layer_count);

	printf("Starting Layer3\n");
	/* Third Layer convolution + ReLU  */ 
	float *Layer3_bias_GPU,*Layer3_Weights_GPU,*Layer4_Neurons_GPU;
	cudaMalloc((void**) &Layer3_Weights_GPU,sizeof(float)*(L3_KERNEL_SIZE * L3_OUT));
	cudaMalloc((void**) &Layer3_bias_GPU, sizeof(float)*L3_OUT);
	cudaMalloc((void**) &Layer4_Neurons_GPU, sizeof(float)*(L3_FMAP * L3_OUT));

	/* Memcpy of weights and bias */ 
	cudaMemcpy(Layer3_Weights_GPU,Layer3_Weights_CPU, sizeof(float)*(L3_KERNEL_SIZE * L3_OUT), cudaMemcpyHostToDevice);
	cudaMemcpy(Layer3_bias_GPU,bias_3, sizeof(float)*L3_OUT,cudaMemcpyHostToDevice);
	dim3 Layer3_Block(384,1,1);
	dim3 Layer3_Thread(13,13);   
	start = get_time_us();
	execute3DconvolutionCuda<<<Layer3_Block,Layer3_Thread>>>(Layer3_bias_GPU,Layer3_Neurons_GPU,Layer3_Weights_GPU,Layer4_Neurons_GPU,384,13,13,1,3,1,256,1);
    	end = get_time_us();
	printf("\t Layer3 took %ld us\n", end - start);


   	printf("Starting Layer4\n");
	
	/* Fourth Layer convolution + ReLU  */
	float *Layer4_bias_GPU,*Layer4_Weights_GPU,*Layer5_Neurons_GPU;
	cudaMalloc((void**) &Layer4_Weights_GPU,sizeof(float)*(L4_KERNEL_SIZE * L4_OUT));
	cudaMalloc((void**) &Layer4_bias_GPU, sizeof(float)*L4_OUT);
	cudaMalloc((void**) &Layer5_Neurons_GPU, sizeof(float)*(L4_FMAP * L4_OUT));

	/* Memcpy of weights and bias */ 
	cudaMemcpy(Layer4_Weights_GPU,Layer4_Weights_CPU, sizeof(float)*(L4_KERNEL_SIZE * L4_OUT), cudaMemcpyHostToDevice);
	cudaMemcpy(Layer4_bias_GPU,bias_4, sizeof(float)*L4_OUT,cudaMemcpyHostToDevice);
	dim3 Layer4_Block(192,1,1);
	dim3 Layer4_Thread(13,13);   
	start = get_time_us();
	execute3DconvolutionCuda<<<Layer4_Block,Layer4_Thread>>>(Layer4_bias_GPU,Layer4_Neurons_GPU,Layer4_Weights_GPU,Layer5_Neurons_GPU,192,13,13,1,3,1,192,2);
	execute3Dconvolutiongroup2Cuda<<<Layer4_Block,Layer4_Thread>>>(Layer4_bias_GPU,Layer4_Neurons_GPU,Layer4_Weights_GPU,Layer5_Neurons_GPU,192,13,13,1,3,1,192,2);

	end = get_time_us();
	printf("\tLayer4 took %ld us\n", end - start);

	printf("Starting Layer5\n");
    	

	/* Fifth Layer convolution + ReLU + pooling */
	float *Layer5_bias_GPU,*Layer5_Weights_GPU,*Layer5_pool_GPU,*Layer6_Neurons_GPU;
	cudaMalloc((void**) &Layer5_Weights_GPU,sizeof(float)*(L5_KERNEL_SIZE * L5_OUT));
	cudaMalloc((void**) &Layer5_bias_GPU, sizeof(float)*L5_OUT);
	cudaMalloc((void**) &Layer5_pool_GPU, sizeof(float)*(L5_FMAP * L5_OUT));

	/* Memcpy of weights and bias */ 
	cudaMemcpy(Layer5_Weights_GPU,Layer5_Weights_CPU, sizeof(float)*(L5_KERNEL_SIZE * L5_OUT), cudaMemcpyHostToDevice);
	cudaMemcpy(Layer5_bias_GPU,bias_5, sizeof(float)*L5_OUT,cudaMemcpyHostToDevice);
	dim3 Layer5_Block(128,1,1);
	dim3 Layer5_Thread(13,13);   
	layer_count = 0;
	start = get_time_us();
	execute3DconvolutionCuda<<<Layer5_Block,Layer5_Thread>>>(Layer5_bias_GPU,Layer5_Neurons_GPU,Layer5_Weights_GPU,Layer5_pool_GPU,128,13,13,1,3,1,192,2);
	execute3Dconvolutiongroup2Cuda<<<Layer5_Block,Layer5_Thread>>>(Layer5_bias_GPU,Layer5_Neurons_GPU,Layer5_Weights_GPU,Layer5_pool_GPU,128,13,13,1,3,1,192,2);
    	end = get_time_us();
	layer_count += (end-start);
	cudaMalloc((void**) &Layer6_Neurons_GPU,sizeof(float)*L5_OUT * POOL3_FMAP);
	dim3 pool5_Block(256,1,1);
	dim3 pool5_Thread(6,6);   
	start = get_time_us();
	executepoolingCuda<<<pool5_Block,pool5_Thread>>>(Layer5_pool_GPU,Layer6_Neurons_GPU,256,6,6,3,2,13,13);
    	end = get_time_us();
	layer_count += (end-start);
	printf("\t Layer5 took %ld us\n", layer_count);

	printf("Starting Layer6\n");

	/* Sixth Layer Fully connected + ReLU */	
	float *Layer6_bias_GPU; 
	float *Layer6_Weights_GPU;
	float *Layer7_Neurons_GPU;

	cudaMalloc((void**) &Layer6_Weights_GPU,sizeof(float)*4096*256*6*6);
	cudaMalloc((void**) &Layer6_bias_GPU, sizeof(float)*4096);
	cudaMalloc((void**) &Layer7_Neurons_GPU, sizeof(float)*4096);

	/* Memcpy of weights and bias */ 
	cudaMemcpy(Layer6_Weights_GPU,Layer6_Weights_CPU, sizeof(float)*4096*256*6*6, cudaMemcpyHostToDevice);
	cudaMemcpy(Layer6_bias_GPU,bias_6, sizeof(float)*4096,cudaMemcpyHostToDevice);

	dim3 Layer6_Block(4096,1,1);
	dim3 Layer6_Thread(1,1);   // combi tried 10*10*10
	start = get_time_us();	
	executeFCLayer<<<Layer6_Block,Layer6_Thread>>>(Layer6_bias_GPU,Layer6_Neurons_GPU,Layer6_Weights_GPU,Layer7_Neurons_GPU,4096,(256*6*6),true,false);
	// RELU LAyer 
	end = get_time_us();
   	printf("\t Layer6 took %ld us\n", end - start);

	
	printf("Starting Layer7\n");
    	
	/* Seventh Layer Fully connected + ReLU */	
	float *Layer7_bias_GPU; 
	float *Layer7_Weights_GPU;
	float *Layer8_Neurons_GPU;

	cudaMalloc((void**) &Layer7_Weights_GPU,sizeof(float)*4096*4096);
	cudaMalloc((void**) &Layer7_bias_GPU, sizeof(float)*4096);
	cudaMalloc((void**) &Layer8_Neurons_GPU, sizeof(float)*4096);

	/* Memcpy of weights and bias */ 
	cudaMemcpy(Layer7_Weights_GPU,Layer7_Weights_CPU, sizeof(float)*4096*4096, cudaMemcpyHostToDevice);
	cudaMemcpy(Layer7_bias_GPU,bias_7, sizeof(float)*4096,cudaMemcpyHostToDevice);

	dim3 Layer7_Block(4096,1,1);
	dim3 Layer7_Thread(1,1);   // combi tried 10*10*10
	start = get_time_us();
	executeFCLayer<<<Layer7_Block,Layer7_Thread>>>(Layer7_bias_GPU,Layer7_Neurons_GPU,Layer7_Weights_GPU,Layer8_Neurons_GPU,4096,4096,true,false);
	end = get_time_us();
    	printf("\t Layer7 took %ld us\n", end - start);

    	printf("Starting Layer8\n");
    	
	/* Eigth Layer Fully connected + ReLU */	
	float *Layer8_bias_GPU; 
	float *Layer9_Neurons_GPU;
	float *Layer8_Weights_GPU;

	cudaMalloc((void**) &Layer8_Weights_GPU,sizeof(float)*4096*1000);
	cudaMalloc((void**) &Layer8_bias_GPU, sizeof(float)*1000);
	cudaMalloc((void**) &Layer9_Neurons_GPU, sizeof(float)*1000);

	/* Memcpy of weights and bias */ 
	cudaMemcpy(Layer8_Weights_GPU,Layer8_Weights_CPU, sizeof(float)*4096*1000, cudaMemcpyHostToDevice);
	cudaMemcpy(Layer8_bias_GPU,bias_8, sizeof(float)*1000,cudaMemcpyHostToDevice);

	dim3 Layer8_Block(1000,1,1);
	dim3 Layer8_Thread(1,1);   // combi tried 10*10*10
	start = get_time_us();
	executeFCLayer<<<Layer8_Block,Layer8_Thread>>>(Layer8_bias_GPU,Layer8_Neurons_GPU,Layer8_Weights_GPU,Layer9_Neurons_GPU,1000,4096,false,false);
	end = get_time_us();
	printf("\t Layer8 took %ld us\n", end - start);

    	//printf("All layers took total %ld us\n", total);

	float *fc9_Neurons_CPU = (float *)malloc(sizeof(float) * (1000));
	cudaMemcpy(fc9_Neurons_CPU,Layer9_Neurons_GPU, sizeof(float)*(1000), cudaMemcpyDeviceToHost);
	/* Check the output */
	float max = 0.0;int index = 0; 
	for(int i =0; i < 1000; i++)
	{
		if(max < fc9_Neurons_CPU[i])
		{
			max = fc9_Neurons_CPU[i];
			index = i;
		}
	}
	printf("=========================\n");
	printf("INDEX = %d\n",index);
	printf("=========================\n");
    cudaFree(Layer1_Neurons_GPU);
    cudaFree(Layer1_Weights_GPU);
    cudaFree(Layer1_bias_GPU);
    cudaFree(Layer1_Norm_GPU);
    cudaFree(Layer8_Weights_GPU);
    cudaFree(Layer8_bias_GPU);
    cudaFree(Layer9_Neurons_GPU);
    cudaFree(Layer7_Weights_GPU);
    cudaFree(Layer7_bias_GPU);
    cudaFree(Layer8_Neurons_GPU);
    cudaFree(Layer6_Weights_GPU);
    cudaFree(Layer6_bias_GPU);
    cudaFree(Layer7_Neurons_GPU);
    cudaFree(Layer5_Weights_GPU);
    cudaFree(Layer5_bias_GPU);
    cudaFree(Layer5_pool_GPU);
    cudaFree(Layer4_Weights_GPU);
    cudaFree(Layer4_bias_GPU);
    cudaFree(Layer5_Neurons_GPU);
    cudaFree(Layer3_Weights_GPU);
    cudaFree(Layer3_bias_GPU);
    cudaFree(Layer4_Neurons_GPU);
    cudaFree(Layer2_Weights_GPU);
    cudaFree(Layer2_bias_GPU);
    cudaFree(Layer2_Norm_GPU);
    free(Layer1_Weights_CPU);
    free(Layer2_Weights_CPU);
    free(Layer3_Weights_CPU);
    free(Layer4_Weights_CPU);
    free(Layer5_Weights_CPU);
    free(Layer6_Weights_CPU);
    free(Layer7_Weights_CPU);
    free(Layer8_Weights_CPU);
#endif
	/* SoftMax */
	//Confirm the functionality of SoftMax ,extract_weights("data/fc8_out.txt",fc9_Neurons_CPU,false);
	//executeSoftMax(fc9_Neurons_CPU);
	end_total = get_time_us();
    	printf("AlexNet total took %ld us using cuda\n", end_total - start_total);

	exit(0);
}
