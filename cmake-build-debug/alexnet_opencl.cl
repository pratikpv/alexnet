
__kernel void conv_layer1(__global float *bias, __global float *Layer1_Neurons_GPU,
                            __global float *Layer1_Weights_GPU, __global float *Layer2_Neurons_GPU,
                                int r_offset, int c_offset) {

    float product = 0.0;
    int col_width = 227;
    int stride_width = 4;
    int stride = 0,colstride = 0;
    int output = get_group_id(0);
    int row = get_local_id(0) + r_offset;
    int col = get_local_id(1) + c_offset;
    colstride = 3*row*stride_width*col_width;
    stride = 0;
    product = 0;
    stride = col * 4 * 3;
    /* RGB weights and input 11*11*3 */

    /*if( get_group_id(0) == 0){
        printf("r_offset = %d\n",r_offset);
        printf("c_offset = %d\n",c_offset);
    }*/
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
    product = 0.0;
}

__kernel void executelrnNorm_split(__global float *Layer_InNeurons_GPU, __global float *Layer_OutNeurons_GPU,
                                   int r_offset, int c_offset)
{
    int nStart = 0, nEnd = 0;
    float value = 0.0;
    float sum = 0.0;
    int output = get_group_id(0);
    int row = get_local_id(0) + r_offset;
    int col = get_local_id(1) + c_offset;

    float alpha = 0.0001;
    float beta = 0.75;
    int local_size = 5;
    int out = 96;
    int fr = 55;
    int fc = 55;

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

__kernel void executepooling(__global float *Layer2_Neurons_GPU, __global float *Layer2_pool_GPU,
                             int out, int out_fr, int out_fc, int kernel_mask,
                             int stride_width, int in_fr, int in_fc)
{
    float max = 0.0;
    int stride = 0,colstride = 0;
    int output = get_group_id(0);
    int row = get_local_id(0);
    int col = get_local_id(1);
    colstride = row * stride_width*in_fc;
    stride = col * stride_width;
    for(int i = 0; i < kernel_mask; i++)
    {
        for(int j = 0; j < kernel_mask; j++)
        {
            if(max < ((Layer2_Neurons_GPU[(output*in_fr*in_fc) + i*in_fc + j + stride + colstride])))
                max =   ((Layer2_Neurons_GPU[(output*in_fr*in_fc) + i*in_fc + j + stride + colstride])) ;

        }
    }
    Layer2_pool_GPU[output*out_fr*out_fc + row*out_fc + col] = max;
    max = 0.0;
    stride+= stride_width;
}

__kernel void execute3Dconvolution(__global float *bias, __global float *Layer2_Neurons_GPU,
                                   __global float *Layer2_Weights_GPU,__global float *Layer3_Neurons_GPU,
                                   int out, int fr, int fc, int stride_width, int kernel_mask,
                                   int pad ,int in_output, int group)
{
    float product = 0.0;
    int x_pad = 0, y_pad = 0, loopc = 0,loopr = 0;
    int stride = 0,colstride = 0;
    int output = get_group_id(0);
    colstride = 0;
    int row = get_local_id(0);
    stride = 0;
    if(row > pad)
        colstride = (row - pad) * fr;
    int col = get_local_id(1);
    if(col >= pad)
        stride = col * stride_width;
    x_pad = 0; y_pad = 0;
    /* set the loops value */
    loopc = kernel_mask;loopr = kernel_mask;
    /* take care of padding in left hand side of image*/
    if( row < pad)
    {
        x_pad = pad - row;
        loopr = kernel_mask - x_pad;
    }
    /* take care of padding in upper side of image*/
    if( col < pad )
    {
        y_pad = pad - col;
        loopc = kernel_mask - y_pad;
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
                product += ( Layer2_Neurons_GPU[feature*fr*fc + i*fc + j + stride + colstride] *
                             Layer2_Weights_GPU [ output*kernel_mask*kernel_mask*in_output +
                                                  feature*kernel_mask*kernel_mask + i*kernel_mask + j +
                                                  kernel_mask*x_pad + y_pad
                             ]
                );
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

__kernel void execute3Dconvolutiongroup2(__global float *bias, __global float *Layer2_Neurons_GPU,
                                         __global float *Layer2_Weights_GPU, __global  float *Layer3_Neurons_GPU,
                                         int out, int fr, int fc, int stride_width, int kernel_mask,
                                         int pad, int in_output, int group)
{
    float product = 0.0;
    int x_pad = 0, y_pad = 0, loopc = 0,loopr = 0;
    int stride = 0,colstride = 0;
    /* Execute second set of inputs */
    int output = get_group_id(0) + out;
    colstride = 0;
    int row = get_local_id(0);
    stride = 0;
    if(row > pad)
        colstride = (row - pad) * fr;
    int col = get_local_id(1);
    if(col >= pad)
        stride = col*stride_width;
    x_pad = 0; y_pad = 0;
    /* set the loops value */
    loopc = kernel_mask;loopr = kernel_mask;
    /* take care of padding in left hand side of image*/
    if( row < pad)
    {
        x_pad = pad - row;
        loopr = kernel_mask - x_pad;
    }
    /* take care of padding in upper side of image*/
    if( col < pad )
    {
        y_pad = pad - col;
        loopc = kernel_mask - y_pad;
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
                product += (
                        Layer2_Neurons_GPU[feature*fr*fc + i*fc + j + stride + colstride] *
                        Layer2_Weights_GPU[output*kernel_mask*kernel_mask*in_output +
                                           (feature-in_output)*kernel_mask*kernel_mask +
                                           i*kernel_mask + j + kernel_mask*x_pad + y_pad
                        ]
                );
            }
        }
    }
    product += bias[output];
    if(product < 0) /* ReLU Layer */
        product = 0;
    Layer3_Neurons_GPU[output*fr*fc + row*fc + col] = product;
    product = 0.0;
}

__kernel void executelrnNorm(__global float *Layer_InNeurons_GPU, __global float *Layer_OutNeurons_GPU)
{
    float alpha = 0.0001;
    float beta = 0.75;
    int local_size_kernel = 5;
    int out = 256;
    int fr = 27;
    int fc = 27;
    int func_call = 0;
    int nStart = 0, nEnd = 0;
    float value = 0.0;float sum = 0.0;
    int output = get_group_id(0);
    int row = get_local_id(0) + func_call * 32;
    int col = get_local_id(1) + func_call * 32;
    nStart=(output-2) > 1 ? (output-2) : 1 ;
    nEnd=(output+2) <  out ? (output+2) : out ;
    for(int i = (nStart-1); i < (nEnd-1) ; i++) // kernel convolution
    {
        sum += pow(( Layer_InNeurons_GPU[i*fr*fc + row*fc + col]),2);
    }
    value = (Layer_InNeurons_GPU[output*fr*fc + row*fc + col]) / (pow( 1 + ((alpha/local_size_kernel) *sum),beta));
    sum = 0;
    Layer_OutNeurons_GPU[output*fr*fc + row*fc + col] = value;
}

__kernel void executeFCLayer(__global float *bias, __global float *Layer_InNeurons_GPU,
                             __global float *Layer_Weights_GPU,__global float *Layer_OutNeurons_GPU,
                             int output, int input,int reLU,int dropout)
{
    float product = 0.0;
    int out = get_group_id(0);
    int weight = out * input;
    {
        for(int in = 0; in < input; in++)
        {
            product += Layer_InNeurons_GPU[in] * Layer_Weights_GPU[weight+in];
        }
        product += bias[out];
        if(reLU)
        {
            if(product < 0) /* ReLU Layer */
                product = 0;
        }

        Layer_OutNeurons_GPU[out] = product;
        product = 0.0;
    }
}
