/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdlib.h>
#include "platform.h"
#include "xil_mmu.h"
#include "xil_cache.h"
#include "xil_cache_l.h"
#include <string.h>
#include <stdio.h>
#include "alexnet.h"
#include "xtime_l.h"

XTime tStart, tEnd;

void print(char *str);

volatile char *control = (volatile char*)0x43C00000;
volatile int *wg_x = (volatile int*)0x43C00010;
volatile int *wg_y = (volatile int*)0x43C00018;
volatile int *wg_z = (volatile int*)0x43C00020;
volatile int *Layer1_Bias = (volatile int*)0x43C00028;
volatile int * Layer1_Neurons_GPU = (volatile int*)0x43C00030;
volatile int *Layer1_Weights_GPU = (volatile int*)0x43C00038;
volatile int *Layer2_Neurons_GPU = (volatile int*)0x43C00040;
volatile int *r_offset = (volatile int*)0x43C00048;
volatile int *c_offset = (volatile int*)0x43C00050;


/* kernel 2 execution convolution part2 */
volatile char *control_ex_p2 = (volatile char*)0x43C10000;
volatile int *wg_x_ex_p2 = (volatile int*)0x43C10010;
volatile int *wg_y_ex_p2 = (volatile int*)0x43C10018;
volatile int *wg_z_ex_p2 = (volatile int*)0x43C10020;
volatile int *Layer1_Bias_ex_p2 = (volatile int*)0x43C10028;
volatile int * Layer1_Neurons_GPU_ex_p2 = (volatile int*)0x43C10030;
volatile int *Layer1_Weights_GPU_ex_p2 = (volatile int*)0x43C10038;
volatile int *Layer2_Neurons_GPU_ex_p2 = (volatile int*)0x43C10040;


/* kernel 3 execution convolution part2 */
volatile char *control_ex_p3 = (volatile char*)0x43C20000;
volatile int *wg_x_ex_p3 = (volatile int*)0x43C20010;
volatile int *wg_y_ex_p3 = (volatile int*)0x43C20018;
volatile int *wg_z_ex_p3 = (volatile int*)0x43C20020;
volatile int *Layer1_Bias_ex_p3 = (volatile int*)0x43C20028;
volatile int * Layer1_Neurons_GPU_ex_p3 = (volatile int*)0x43C20030;
volatile int *Layer1_Weights_GPU_ex_p3 = (volatile int*)0x43C20038;
volatile int *Layer2_Neurons_GPU_ex_p3= (volatile int*)0x43C20040;


/* kernel 4 execution convolution part2 */
volatile char *control_ex_p4 = (volatile char*)0x43C30000;
volatile int *wg_x_ex_p4 = (volatile int*)0x43C30010;
volatile int *wg_y_ex_p4 = (volatile int*)0x43C30018;
volatile int *wg_z_ex_p4 = (volatile int*)0x43C30020;
volatile int *Layer1_Bias_ex_p4 = (volatile int*)0x43C30028;
volatile int * Layer1_Neurons_GPU_ex_p4 = (volatile int*)0x43C30030;
volatile int *Layer1_Weights_GPU_ex_p4 = (volatile int*)0x43C30038;
volatile int *Layer2_Neurons_GPU_ex_p4 = (volatile int*)0x43C30040;


#define INPUT_SIZE 227*227*3
#define L1_KERNEL_SIZE 11*11*3
#define L1_OUT 96


void executeKernel(volatile char *control,volatile int *group_id,int num_groups)
{
	print("Status of control register: \n\r");
	unsigned int con = *control;
	int i;
	for (i = 0; i < 8; i ++)
	{
	 	if (con & (1 << i))
	 	{
	 		print("1");
	 	}
	 	else
	 	{
	 		print("0");
	 	}
	}
	print("\n\r");
	print("Starting OpenCL kernel execution\n\r");
 	for (i = 0; i < num_groups; i ++)
	{
 		//printf("grpid = %d\n",i);
	 	*group_id = i;
	 	*control |= 1; /* start */
	 	while (! ((*control) & 2)); /* waiting for hardware to report "done" */
	}
	print("\nDONE!\n\r");
}

int main()
{
    init_platform();
    Xil_SetTlbAttributes(0x43c00000,0x10c06); /* non cacheable */

        /*Layer1 memory*/
        float Layer1_Bias_host[96];
        float* Layer1_Neurons_host;
        float* Layer1_Weights_host;
        float* Layer2_Neurons_host;
        int r = 0;
        int c = 0;




        int inp_size = INPUT_SIZE;
        /*Layer1 memory allocations*/
        Layer1_Neurons_host = (float*) malloc(sizeof(float)*(inp_size));
    	Layer1_Weights_host = (float *)malloc(sizeof(float) *(L1_KERNEL_SIZE * L1_OUT));
        Layer2_Neurons_host = (float *)malloc(sizeof(float) *(96*55*55));
        memset(Layer2_Neurons_host,0,sizeof(float)*(96*55*55));

        int i=0;
    	for (i=0; i<96;i++)
    	{
    		Layer1_Bias_host[i] = bias1[i];
    	}
    	printf("Copied Bias\n");
    	if(Layer1_Neurons_host !=NULL)
    		{
    		for (i=0; i< inp_size; i++)
    			{
    			//printf("input[%d] = %f\n",i,Layer1_Neurons[i]);
    			Layer1_Neurons_host[i] = Layer1_Neurons[i];
    			}
    		}
    		else{
    			printf("Memory not allocated\n");
    			exit(0);
    		}
    	printf("Copied neurons\n");

    	if(Layer1_Weights_host!=NULL)
    			for (i=0; i< L1_KERNEL_SIZE * L1_OUT; i++)
    			{
    				//printf("weights[%d] = %f\n",i,weights_layer1[i]);
    				Layer1_Weights_host[i] = weights_layer1[i];
    			}
    		else
    		{
    			printf("Memory not allocated to weights\n");
    			exit(0);
    		}
    		printf("Copying completed\n");

    	    Xil_DCacheFlush();
    	    //copying the variables to register
    	    *Layer1_Bias=(int)Layer1_Bias_host;
    	    *Layer1_Neurons_GPU = (int)Layer1_Neurons_host;
    	    *Layer1_Weights_GPU = (int)Layer1_Weights_host;
    	    *Layer2_Neurons_GPU = (int)Layer2_Neurons_host;
    	    *r_offset = r;
    	    *c_offset = c;

    	    *Layer1_Bias_ex_p2 = (int)Layer1_Bias_host;;
    	    * Layer1_Neurons_GPU_ex_p2 = (int)Layer1_Neurons_host;
    	    *Layer1_Weights_GPU_ex_p2 = (int)Layer1_Weights_host;
    	    *Layer2_Neurons_GPU_ex_p2 = (int)Layer2_Neurons_host;

    	    *Layer1_Bias_ex_p3 = (int)Layer1_Bias_host;;
    	    * Layer1_Neurons_GPU_ex_p3 = (int)Layer1_Neurons_host;
    	    *Layer1_Weights_GPU_ex_p3 = (int)Layer1_Weights_host;
    	    *Layer2_Neurons_GPU_ex_p3 = (int)Layer2_Neurons_host;

    	    *Layer1_Bias_ex_p4 = (int)Layer1_Bias_host;;
    	    *Layer1_Neurons_GPU_ex_p4 = (int)Layer1_Neurons_host;
    	    *Layer1_Weights_GPU_ex_p4 = (int)Layer1_Weights_host;
    	    *Layer2_Neurons_GPU_ex_p4 = (int)Layer2_Neurons_host;

    	    //Layer 1 workgroup id
    	    *wg_y = 0;
    	    *wg_z = 0;
    	    *wg_x = 0;
    	    *wg_x_ex_p2 = 0;
    	    *wg_y_ex_p2 = 0;
    	    *wg_z_ex_p2 = 0;
    	    *wg_x_ex_p3 = 0;
    	    *wg_y_ex_p3 = 0;
    	    *wg_z_ex_p3 = 0;
    	    *wg_x_ex_p4 = 0;
    	    *wg_y_ex_p4 = 0;
    	    *wg_z_ex_p4 = 0;


    	    XTime_GetTime(&tStart);
    	    executeKernel(control,wg_x,96);
    	    executeKernel(control_ex_p2,wg_x_ex_p2,96);
    	    executeKernel(control_ex_p3,wg_x_ex_p3,96);
    	    executeKernel(control_ex_p4,wg_x_ex_p4,96);

    	    XTime_GetTime(&tEnd);
    	    printf("\n\nOutput took %llu clock cycles.\n", 2*(tEnd - tStart));
    	    printf("Done executing the kernel\n");
    	    printf("Output took %.2f seconds.\n",
    	    				1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND));

//#if 1
////    	    for(int i =0; i<(96*55*55); i++)
////    	    {
////    	    	printf("val[%d] = %f\n",i,Layer2_Neurons_host[i]);
////    	    }
//#endif

    	    Xil_DCacheInvalidate();
    	    cleanup_platform();
    	    return 0;
}
