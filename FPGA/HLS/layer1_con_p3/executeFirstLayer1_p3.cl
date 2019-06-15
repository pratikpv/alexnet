#include<clc.h>
#include<clc.h>
__kernel void __attribute__ ((reqd_work_group_size(23,32,1)))executeFirstLayer1_p3( __global float *bias, __global float *Layer1_Neurons_GPU,
                                 __global float *Layer1_Weights_GPU,__global float *Layer2_Neurons_GPU)
{

	int r_offset = 32;
	int c_offset = 0;

    float product = 0;
    int col_width = 227;
    int stride_width = 4;
    int stride = 0,colstride = 0;
    int output = get_group_id(0);
    int row = get_local_id(1) + r_offset;
    int col = get_local_id(0) + c_offset;
    //printf("output = %d\n",output);
    colstride = 3*row*stride_width*col_width;
    stride = 0;
    product = 0;
    stride = col * 4 * 3;
    /* RGB weights and input 11*11*3 */
    for(int i = 0; i < 11; i++)
    {
        for(int j = 0; j < 11; j++)
        {
            product += ((Layer1_Neurons_GPU[i*227*3 + j*3 + stride + colstride] * Layer1_Weights_GPU[i*11 + j + (output * 11*11*3)])
                        + (Layer1_Neurons_GPU[i*227*3 + j*3 + 1 + stride + colstride] * Layer1_Weights_GPU[i*11 + 11*11 + j+ (output * 11*11*3)])
                        + (Layer1_Neurons_GPU[i*227*3 + j*3 + 2 + stride + colstride] * Layer1_Weights_GPU[i*11 + 11*11*2 + j+ (output * 11*11*3)]));
        }
    }
    product += bias[output];
    if(product < 0) /* RELU Layer */
        product = 0; // max(0,x)
    Layer2_Neurons_GPU[output*55*55 + row*55 + col] = product;
    product = 0;
}
