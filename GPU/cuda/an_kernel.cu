/**********************************************************************
* FILENAME :        an_kernel.cu             
* 
* DESCRIPTION :
*       Kernel side implementation of AlexNet network
*
* NOTES :
*       This file includes implementation of 2D/3D convolution
*       normalisation,pooling and fully connected layer kernels.
* 
* AUTHOR :    Aajna Karki 
*             https://www.linkedin.com/in/aajna/
*********************************************************************/
#ifndef _AN_KERNEL_H_
#define _AN_KERNEL_H_

#include <stdio.h>

#define CHECK_BANK_CONFLICTS 0
#if CHECK_BANK_CONFLICTS
#define AS(i, j) CUT_BANK_CHECKER(((float*)&As[0][0]), (BLOCK_SIZE * i + j))
#define BS(i, j) CUT_BANK_CHECKER(((float*)&Bs[0][0]), (BLOCK_SIZE * i + j))
#else
#define AS(i, j) As[i][j]
#define BS(i, j) Bs[i][j]
#endif


//#define LAYER2_DEBUG 
//#define POOL_DEBUG 
__constant__ int kernelTemplate[25] = {
        0,  1,  2,  3,  4,
        29, 30, 31, 32, 33,
        58, 59, 60, 61, 62,
        87, 88, 89, 90, 91,
        116,117,118,119,120 };
__constant__ int kernelTemplate2[25] = {
        0,  1,  2,  3,  4,
        13, 14, 15, 16, 17, 
        26, 27, 28, 29, 30,
        39, 40, 41, 42, 43, 
        52, 53, 54, 55, 56   };

#ifndef CPU
__global__ void executeFirstLayer(float *bias,float *Layer1_Neurons_GPU,float *Layer1_Weights_GPU,float *Layer2_Neurons_GPU,int r_offset, int c_offset)
{
    float product = 0.0;
    int col_width = 227;
    int stride_width = 4;
    int stride = 0,colstride = 0;
    int output = blockIdx.x;
    int row = threadIdx.x + r_offset;
    int col = threadIdx.y + c_offset;
    colstride = 3*row*stride_width*col_width;
    stride = 0;
    product = 0;
    stride = col * 4 * 3;
    /* RGB weights and input 11*11*3 */
    for(int i = 0; i < 11; i++)
    {
        for(int j = 0; j < 11; j++)
        {
            product +=        ((Layer1_Neurons_GPU[i*227*3 + j*3 + stride + colstride]    * Layer1_Weights_GPU[i*11 + j + (output * 11*11*3)])
                    + (Layer1_Neurons_GPU[i*227*3 + j*3 + 1 + stride + colstride] * Layer1_Weights_GPU[i*11 + 11*11 + j+ (output * 11*11*3)])
                    + (Layer1_Neurons_GPU[i*227*3 + j*3 + 2 + stride + colstride] * Layer1_Weights_GPU[i*11 + 11*11*2 + j+ (output * 11*11*3)]));
        }
    }
    product += bias[output];
    if(product < 0) /* RELU Layer */
        product = 0; // max(0,x)
    Layer2_Neurons_GPU[output*55*55 + row*55 + col] = product;
    product = 0.0;
}
/* IN : Layer2_Neurons_GPU // Neurons input
        Layer2_pool_GPU    // output after pooling
        out                // number of outputs 
        out_fr             // feature map size of output in terms of row 
        out_fc             // feature map size of output in terms of column
        kernel             // kernel size
        stride_width       // stride
        in_fr             // feature map size of input in terms of row
        in_fc             // feature map size of input in terms of column 
*/
__global__ void executepoolingCuda(float *Layer2_Neurons_GPU,float *Layer2_pool_GPU,int out,int out_fr,int out_fc,int kernel,int stride_width,int in_fr,int in_fc)
{
    float max = 0.0;
    int stride = 0,colstride = 0;
    int output = blockIdx.x;
    int row = threadIdx.x;
    int col = threadIdx.y;
    colstride = row * stride_width*in_fc;
    stride = col * stride_width;
    for(int i = 0; i < kernel; i++)
    {
        for(int j = 0; j < kernel; j++)
        {
            if(max < ((Layer2_Neurons_GPU[(output*in_fr*in_fc) + i*in_fc + j + stride + colstride])))
                max =   ((Layer2_Neurons_GPU[(output*in_fr*in_fc) + i*in_fc + j + stride + colstride])) ;

        }
    }
    Layer2_pool_GPU[output*out_fr*out_fc + row*out_fc + col] = max;
    max = 0.0;
    stride+= stride_width;
}
__global__ void execute3DconvolutionCuda(float *bias,float *Layer2_Neurons_GPU, float *Layer2_Weights_GPU,float *Layer3_Neurons_GPU,int out,int fr,int fc,int stride_width,int kernel,int pad,int in_output,int group)
{
    float product = 0.0;
    int x_pad = 0, y_pad = 0, loopc = 0,loopr = 0;
    int stride = 0,colstride = 0;
    int output = blockIdx.x; // 128
    colstride = 0;
    int row = threadIdx.x;
    stride = 0;
    if(row > pad)
       colstride = (row - pad) * fr;
    int col = threadIdx.y;
    if(col >= pad)
        stride = col * stride_width;
    x_pad = 0; y_pad = 0;
    /* set the loops value */
    loopc = kernel;loopr = kernel;
    /* take care of padding in left hand side of image*/
    if( row < pad)
    {
        x_pad = pad - row;
        loopr = kernel - x_pad;
    }
    /* take care of padding in upper side of image*/
    if( col < pad )
    {
        y_pad = pad - col;
        loopc = kernel - y_pad;
    }
    /* take care of padding in right side of image*/
    if(col >= fc - pad)
        loopc =  fc + pad - col;
    /* take care of padding in bottom of image */
    if(row >= fr - pad)
        loopr =  fr + pad - row;
    for(int feature =0; feature < in_output ; feature++) // calculate the feature maps
    {
        for(int i =0; i < loopr ; i++) // kernel convolution
        {
            for(int j =0; j < loopc ; j++) // kernel convolution
            {
                product += ( Layer2_Neurons_GPU[feature*fr*fc + i*fc + j + stride + colstride] * Layer2_Weights_GPU[output*kernel*kernel*in_output + feature*kernel*kernel + i*kernel + j + kernel*x_pad + y_pad]);
            }
        }
    }
    product += bias[output];
    if(product < 0) /* ReLU Layer */
        product = 0;
    Layer3_Neurons_GPU[output*fr*fc + row*fc + col] = product;
    product = 0.0;
    if(col >= pad)
        stride+=stride_width;
}
__global__ void execute3Dconvolutiongroup2Cuda(float *bias,float *Layer2_Neurons_GPU, float *Layer2_Weights_GPU,float *Layer3_Neurons_GPU,int out,int fr,int fc,int stride_width,int kernel,int pad,int in_output,int group)
{
    float product = 0.0;
    int x_pad = 0, y_pad = 0, loopc = 0,loopr = 0;
    int stride = 0,colstride = 0;
    /* Execute second set of inputs */
    int output = blockIdx.x + out;
    colstride = 0;
    int row = threadIdx.x;
    stride = 0;
    if(row > pad)
        colstride = (row - pad) * fr;
    int col = threadIdx.y;
    if(col >= pad)
        stride = col*stride_width;
    x_pad = 0; y_pad = 0;
    /* set the loops value */
    loopc = kernel;loopr = kernel;
    /* take care of padding in left hand side of image*/
    if( row < pad)
    {
        x_pad = pad - row;
        loopr = kernel - x_pad;
    }
    /* take care of padding in upper side of image*/
    if( col < pad )
    {
        y_pad = pad - col;
        loopc = kernel - y_pad;
    }
    /* take care of padding in right side of image*/
    if(col >= fc - pad)
        loopc =  fc + pad - col;
    /* take care of padding in bottom of image */
    if(row >= fr - pad)
        loopr =  fr + pad - row;
    for(int feature = in_output ; feature < (in_output << 1) ; feature++) // calculate the feature maps
    {
        for(int i =0; i < loopr ; i++) // kernel convolution
        {
            for(int j =0; j < loopc ; j++) // kernel convolution
            {
                product += (( Layer2_Neurons_GPU[feature*fr*fc + i*fc + j + stride + colstride] * Layer2_Weights_GPU[output*kernel*kernel*in_output + (feature-in_output)*kernel*kernel + i*kernel + j + kernel*x_pad + y_pad]));
            }
        }
    }
    product += bias[output];
    if(product < 0) /* ReLU Layer */
        product = 0;
    Layer3_Neurons_GPU[output*fr*fc + row*fc + col] = product;
    product = 0.0;
}
__global__ void executelrnNormCuda_split(float *Layer_InNeurons_GPU, float alpha, float beta,int local_size,int out,int fr,int fc,float *Layer_OutNeurons_GPU,int r_offset, int c_offset)
{
        int nStart = 0, nEnd = 0;
        float value = 0.0;float sum = 0.0;
        int output = blockIdx.x;
        int row = threadIdx.x + r_offset;
        int col = threadIdx.y + c_offset;
        nStart=(output-2) > 1 ? (output-2) : 1 ;
        nEnd=(output+2) <  out ? (output+2) : out ;
        for(int i = (nStart-1); i < (nEnd-1) ; i++) // kernel convolution
        {
            sum += pow(( Layer_InNeurons_GPU[i*fr*fc + row*fc + col]),2);
        }
        value = (Layer_InNeurons_GPU[output*fr*fc + row*fc + col]) / (pow( 1 + ((alpha/local_size) *sum),beta));
        sum = 0;
        Layer_OutNeurons_GPU[output*fr*fc + row*fc + col] = value;
}
__global__ void executelrnNormCuda(float *Layer_InNeurons_GPU, float alpha, float beta,int local_size,int out,int fr,int fc,float *Layer_OutNeurons_GPU,int func_call)
{
        int nStart = 0, nEnd = 0;
        float value = 0.0;float sum = 0.0;
        int output = blockIdx.x;
        int row = threadIdx.x + func_call * 32;
        int col = threadIdx.y + func_call * 32;
        nStart=(output-2) > 1 ? (output-2) : 1 ;
        nEnd=(output+2) <  out ? (output+2) : out ;
        for(int i = (nStart-1); i < (nEnd-1) ; i++) // kernel convolution
        {
            sum += pow(( Layer_InNeurons_GPU[i*fr*fc + row*fc + col]),2);
        }
        value = (Layer_InNeurons_GPU[output*fr*fc + row*fc + col]) / (pow( 1 + ((alpha/local_size) *sum),beta));
        sum = 0;
        Layer_OutNeurons_GPU[output*fr*fc + row*fc + col] = value;
}
__global__ void executeFCLayer(float *bias,float *Layer_InNeurons_GPU,float *Layer_Weights_GPU,float *Layer_OutNeurons_GPU,int output, int input,bool reLU,bool dropout)
{
    float product = 0.0;
    int out = blockIdx.x;
    int weight = out * input;
    {
        for(int in = 0; in < input; in++)
        {
               product += Layer_InNeurons_GPU[in] * Layer_Weights_GPU[weight+in];
        }
        product += bias[out];
        if(reLU == true)
        {
            if(product < 0) /* ReLU Layer */
                product = 0;
        }

        Layer_OutNeurons_GPU[out] = product;
        product = 0.0;
    }
}
__global__ void executeThirdLayer(float *Layer3_Neurons_GPU, float *Layer3_Weights_GPU,float *Layer4_Neurons_GPU)
{
    int blockID=blockIdx.x;
    //int pixelY=threadIdx.y;


    int weightBegin=blockID*1251;

    float result=0;

    result+=Layer3_Weights_GPU[weightBegin];

    ++weightBegin;

    for (int i=0; i<1250; ++i )
    {
        result+=Layer3_Neurons_GPU[i+(1250*blockIdx.y)]*Layer3_Weights_GPU[weightBegin+i];
    }

    result=(1.7159*tanhf(0.66666667*result));

    Layer4_Neurons_GPU[blockID+(100*blockIdx.y)]=result;

}

__global__ void executeFourthLayer(float *Layer4_Neurons_GPU,float *Layer4_Weights_GPU,float *Layer5_Neurons_GPU)
{
    int blockID=blockIdx.x;
    //int pixelY=threadIdx.y;


    int weightBegin=blockID*101;

    float result=0;

    result+=Layer4_Weights_GPU[weightBegin];

    ++weightBegin;

    for (int i=0; i<100; ++i )
    {
        result+=Layer4_Neurons_GPU[i+(100*blockIdx.y)]*Layer4_Weights_GPU[weightBegin+i];
    }

    result=(1.7159*tanhf(0.66666667*result));

    Layer5_Neurons_GPU[blockID+(10*blockIdx.y)]=result;
}
#else
void executeFirstLayer(float *bias,float *Layer1_Neurons_GPU,float *Layer1_Weights_GPU,float *Layer2_Neurons_GPU,int stride_width,int col_width,int feature_r,int feature_c,int out)
{
    float product = 0.0;
    int stride = 0,colstride = 0;
    {
        for(int output =0;output < out ;output++)
        {
            for(int row =0; row < feature_r ;row++)
            {
                                colstride = 3*row*stride_width*col_width;
                stride = 0;
                for(int col =0; col < feature_c ;col++)
                {
                    product = 0;
                    /* RGB weights and input 11*11*3 , kernel is 11*11 */
                    for(int i = 0; i < 11; i++)
                    {
                        for(int j = 0; j < 11; j++)
                        {
                            product +=        ((Layer1_Neurons_GPU[i*col_width*3 + j*3 + stride + colstride]    * Layer1_Weights_GPU[i*11 + j + (output * 11*11*3)])
                                    + (Layer1_Neurons_GPU[i*col_width*3 + j*3 + 1 + stride + colstride] * Layer1_Weights_GPU[i*11 + 11*11 + j+ (output * 11*11*3)])
                                    + (Layer1_Neurons_GPU[i*col_width*3 + j*3 + 2 + stride + colstride] * Layer1_Weights_GPU[i*11 + 11*11*2 + j+ (output * 11*11*3)]));
                        }
                    }
                    product += bias[output];
                                        if(product < 0) /* RELU Layer */
                        product = 0; // max(0,x)
                    Layer2_Neurons_GPU[output*feature_r*feature_c + row*feature_c + col] = product;
#ifdef LAYER1_DEBUG         
                    printf("%f\n",product);
#endif
                    product = 0.0;
                    stride+= stride_width*3;
                }
            }
        }
    }
}
void pooling(float *Layer2_Neurons_GPU,float *Layer2_pool_GPU,int out,int out_fr,int out_fc,int kernel,int stride_width,int in_fr,int in_fc)
{
        printf("pooling Activation layer \n");
    float max = 0.0;
    int downsample = 0;
    int stride = 0,colstride = 0;
    {
        for(int output =0;output < out ;output++)
        {
            for(int row =0; row < out_fr ;row++)
            {
                                colstride = row * stride_width*in_fc;
                stride = 0;
                for(int col =0; col < out_fc ;col++)
                {
                    for(int i = 0; i < kernel; i++)
                    {
                        for(int j = 0; j < kernel; j++)
                        {
                            if(max < ((Layer2_Neurons_GPU[(output*in_fr*in_fc) + i*in_fc + j + stride + colstride])))
                                max =   ((Layer2_Neurons_GPU[(output*in_fr*in_fc) + i*in_fc + j + stride + colstride])) ;
                //          if(output == 141)
                //              printf("%f %d\t",Layer2_Neurons_GPU[(output*in_fr*in_fc) + i*in_fc + j + stride + colstride],((output*in_fr*in_fc) + i*in_fc + j + stride + colstride)) ;

                        }
                    }
                    Layer2_pool_GPU[downsample] = max;
#ifdef POOL_DEBUG           
                    printf("\n %f %d\n",max,downsample);
#endif
                    max = 0.0;
                    downsample++;
                    stride+= stride_width;
                }
            }
        }
    }
}

void execute3Dconvolution(float *bias,float *Layer2_Neurons_GPU, float *Layer2_Weights_GPU,float *Layer3_Neurons_GPU,int out,int fr,int fc,int stride_width,int kernel,int pad,int in_output,int group)
{
	float product = 0.0;
        int x_pad = 0, y_pad = 0, loopc = 0,loopr = 0;
        printf(" 3D convolution with group %d,output %d,feature %d x %d ,stride %d, kernel %d, pad %d, input %d\n",group,out,fr,fc,stride_width,kernel,pad,in_output); 
	if(group == 2)
	{
		out = out >> 1;
		in_output = in_output >> 1;
	}
	int stride = 0,colstride = 0;
	{
		for(int output =0;output < out  ;output++) /* out = 256 */
		{      
                        colstride = 0;	
			for(int row =0; row < fr ; row++) /* out = 256 */
			{	
				stride = 0;	
				if(row > pad)
					colstride = (row - pad) * fr;
				for(int col =0; col < fc ;col++) /* out = 256 */
				{
					x_pad = 0; y_pad = 0;
					/* set the loops value */
					loopc = kernel;loopr = kernel;
					/* take care of padding in left hand side of image*/ 
					if( row < pad)
					{
						x_pad = pad - row;
						loopr = kernel - x_pad;
					} 
					/* take care of padding in upper side of image*/ 
					if( col < pad )
					{
						y_pad = pad - col;
						loopc = kernel - y_pad;
					} 
					/* take care of padding in right side of image*/ 
					if(col >= fc - pad)
						loopc =  fc + pad - col;  
					/* take care of padding in bottom of image */ 
					if(row >= fr - pad)
						loopr =  fr + pad - row;
					for(int feature =0; feature < in_output ; feature++) // calculate the feature maps
					{
						for(int i =0; i < loopr ; i++) // kernel convolution
						{
							for(int j =0; j < loopc ; j++) // kernel convolution
							{
								product += ( Layer2_Neurons_GPU[feature*fr*fc + i*fc + j + stride + colstride] * Layer2_Weights_GPU[output*kernel*kernel*in_output + feature*kernel*kernel + i*kernel + j + kernel*x_pad + y_pad]);
							}
						}
					}
                                        product += bias[output];
					if(product < 0) /* ReLU Layer */
						product = 0;
#ifdef LAYER2_DEBUG
					printf("%f\n",product);
#endif                  
//					if((group == 2) && (out == 128) && (in_output == 192))
//						printf("%f\n",product);
					Layer3_Neurons_GPU[output*fr*fc + row*fc + col] = product;
					product = 0.0;
					if(col >= pad)
						stride+=stride_width;
				}
			}

		}
		if(group == 2)
		{
			/* Execute second set of inputs */
			for(int output = out ;output < (out << 1)   ;output++) /* out = 256 */
			{      
				colstride = 0;	
				for(int row =0; row < fr; row++) /* out = 256 */
				{	
					stride = 0;	
					if(row > pad)
						colstride = (row - pad) * fr;
					for(int col =0; col < fc ;col++) /* out = 256 */
					{
						x_pad = 0; y_pad = 0;
						/* set the loops value */
						loopc = kernel;loopr = kernel;
						/* take care of padding in left hand side of image*/ 
						if( row < pad)
						{
							x_pad = pad - row;
							loopr = kernel - x_pad;
						} 
						/* take care of padding in upper side of image*/ 
						if( col < pad )
						{
							y_pad = pad - col;
							loopc = kernel - y_pad;
						} 
						/* take care of padding in right side of image*/ 
						if(col >= fc - pad)
							loopc =  fc + pad - col;  
						/* take care of padding in bottom of image */ 
						if(row >= fr - pad)
							loopr =  fr + pad - row;
						for(int feature = in_output ; feature < (in_output << 1) ; feature++) // calculate the feature maps
						{
							for(int i =0; i < loopr ; i++) // kernel convolution
							{
								for(int j =0; j < loopc ; j++) // kernel convolution
								{
									product += (( Layer2_Neurons_GPU[feature*fr*fc + i*fc + j + stride + colstride] * Layer2_Weights_GPU[output*kernel*kernel*in_output + (feature-in_output)*kernel*kernel + i*kernel + j + kernel*x_pad + y_pad]));
								}
							}
						}
						product += bias[output];
						if(product < 0) /* ReLU Layer */
							product = 0;
#ifdef LAYER2_DEBUG
						printf("%f\n",product);
#endif                   
//						if((group == 2) && (out == 128) && (in_output == 192))
//							printf("%f\n",product);
						Layer3_Neurons_GPU[output*fr*fc + row*fc + col] = product;
						product = 0.0;
						if(col >= pad)
							stride+=stride_width;
					}
				}

			}
		}

	}
}
void executelrnNorm(float *Layer_InNeurons_GPU, float alpha, float beta,int local_size,int out,int fr,int fc,float *Layer_OutNeurons_GPU)
{
        printf(" Exexcute Norm Layer\n");
        int nStart = 0, nEnd = 0;
        float value = 0.0;float sum = 0.0;
	for(int row =0; row < fr; row++) 
	{	
		for(int col =0; col < fc ;col++)
		{
			for(int output = 0 ;output < out   ;output++)
			{
                                nStart=(output-floor(local_size/2)) > 1 ? (output-floor(local_size/2)) : 1 ;
                                nEnd=(output+floor(local_size/2)) <  out ? (output+floor(local_size/2)) : out ;
				for(int i = (nStart-1); i < (nEnd-1) ; i++) // kernel convolution
				{
					sum += pow(( Layer_InNeurons_GPU[i*fr*fc + row*fc + col]),2);
				}
				value = (Layer_InNeurons_GPU[output*fr*fc + row*fc + col]) / (pow( 1 + ((alpha/local_size) *sum),beta));
                                sum = 0;
                                Layer_OutNeurons_GPU[output*fr*fc + row*fc + col] = value;
			}
		}

	}
#ifdef NORM_LAYER
	for(int N = 0; N < out; N++)
	{

		for(int W = 0; W < fr; W++)
		{
			for(int H = 0; H < fc; H++)
			{
                                printf("%f\n",Layer_OutNeurons_GPU[N*fr*fc + W*fc + H]);;
			}
		}
	}
#endif
}
void executeFCLayer(float *bias,float *Layer_InNeurons_GPU,float *Layer_Weights_GPU,float *Layer_OutNeurons_GPU,int output, int input,bool reLU,bool dropout)
{
        printf("Execute FC Layer of output : %d input %d\n",output,input);
        float product = 0.0,max = 0.0; int weight = 0,index = 0;
	for(int out=0; out < output ; out++)
	{
		for(int in = 0; in < input; in++)
		{
                     product += Layer_InNeurons_GPU[in] * Layer_Weights_GPU[weight++];
		}
                product += bias[out];
		if(reLU == true)
		{
			if(product < 0) /* ReLU Layer */
				product = 0;
		}
		else
		{
			if(max < product)
			{
                                index = out;
				max = product;
			}
		}
                if(dropout == true)
		{

		}
		Layer_OutNeurons_GPU[out] = product;
#ifdef FC_DEBUG
		printf("%f\n",product);
#endif
		product = 0.0;
	}
        printf(" MAX from FC layer = %d\n",index);
}

void executeSoftMax(float *Layer_In_Neurons_GPU)
{
        printf("executeSoftMax \n");
        float max = 0,sum = 0;
	float output[1000] = {0};
        for(int i = 0; i < 1000; i++)
	{
		if(Layer_In_Neurons_GPU[i] > max)
			max = Layer_In_Neurons_GPU[i];
	}
#ifdef SOFTMAX_DEBUG
	printf("Max = %10e\n",max);
#endif
        for(int i = 0; i < 1000; i++)
	{
		output[i] = exp(Layer_In_Neurons_GPU[i] - max);
                sum += output[i];
	}
#ifdef SOFTMAX_DEBUG
	printf("Sum =  %10e\n",sum);
#endif
        for(int i = 0; i < 1000; i++)
	{
		output[i] *= (1/sum);
#ifdef SOFTMAX_DEBUG
                printf("%10e\n",output[i]);
#endif
	}
        
}
#endif


#endif // #ifndef _AN_KERNEL_H_
