# Benchmarking execution time of AlexNet[[1]](https://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks.pdf) CNN on FPGA and GPU.
#### FPGA used - Zynq ZC706
#### GPU used -  Nvidia Tesla P100
**For the baseline code of Alexnet i.e. Alexnet CUDA. We referred the Tango Benchmarking Suite from [here](https://gitlab.com/Tango-DNNbench/Tango) and ported it to Opencl**

The project has two sections -  
1. FPGA 
2. GPU

**Important:** Before proceeding please download the data from [here](https://gitlab.com/Tango-DNNbench/Tango/-/archive/master/Tango-master.zip?path=GPU%2FAlexNet%2Fdata)
and unzip it. **If the folder name is other than data then please rename it to data** 

The FPGA directory hosts the sub-directories from Xilinx HLS and Xilinx Vivado. You will need the Xilinx Vivado and Xilinx SDK installed to run this program

```
FPGA
├── HLS
│   ├── layer1_con_p1
│   ├── layer1_con_p2
│   ├── layer1_con_p3
│   └── layer1_con_p4
└── Vivado
    └── project_execution_layer_con1_p2
```

GPU directory will hosts the Cuda version of Alexnet and Opencl version of Alexnet. ***Initially***, it's structure will look like this. 

```
GPU
│   ├── AlexNet_cuda
│   │   ├── Makefile
│   │   ├── README
│   │   ├── alexnet_host.cu
│   │   ├── an_kernel.cu
│   │   └── build.sh
│   ├── AlexNet_opencl
│   │   ├── AlexNet_opencl
│   │   ├── Makefile
│   │   ├── alexnet_host.cpp
│   │   └── alexnet_opencl.cl
│   └── log
│       └── execution.log
```


### Building the Opencl version
To run the Opencl version of the program execute the following steps- 
1. Clone this repository 

```git clone https://github.com/sidd91/cudaProject.git```

2. Switch to the cudaProject Directory

``` cd cudaProject```

3. Copy ```data``` folder which was downloaded and unzipped in the very beginning in this directory. After copying the data folder in the cudaProject folder. 

The structure of the **cudaProject** folder can be verified by running the command

```
tree -L 1 ./
```
The output of the above command should look like below - 

```
├── FPGA
├── GPU
├── Image_rgb_to_txt.py
├── README.md
├── Validation_results_with_various_inputs.xlsx
├── FPGAtutorial.pdf
├── graph.xlsx
└── data
```

4. Go to GPU folder

``` cd GPU ```

5. Copy data folder to AlexNet_opencl and go to AlexNet_opencl directory

```cp -r ../data/  AlexNet_opencl/```

```cd AlexNet_opencl```

6. Build the opencl code

 ```make clean && make```

7. Execute the opencl code

```./AlexNet_opencl data/input.txt ```

### Building the CUDA Version
1. Go back to project_code

```cd  ../ ```
  
2. Copy data folder to AlexNet_cuda and go to AlexNet_cuda directory

```cp -r ../data/  AlexNet_cuda/```

```cd AlexNet_cuda```

3. Build the CUDA code

 ```./build.sh```

4. Execute the CUDA code

```./AN 1 ```

### Running the FPGA version of the layers

1. This guide assumes that you have Vivado installed. If not then please download it from [here](https://www.xilinx.com/member/forms/download/xef-vivado.html?filename=Xilinx_Vivado_SDK_Web_2018.3_1207_2324_Win64.exe)

#### Below steps only provide the summary of the steps. Detailed steps are listed in [this](https://github.com/sidd91/cudaProject/blob/master/FPGAtutorial.pdf) file "FPGAtutorial.pdf"

2. Launch Xilinx Vivado

3. Open Project

4. Go the FPGA directory -> VIVADO -> project_execution_layer_con1_p2

5. Select project_execution_layer_con1_p2.xpr and click on Open

6. Go to Files and go to Launch SDK

7. Let the Xilinx SDK load

8. Click on the Debug option and select Debug configurations

9. Create a new configuration and choose the following options

10. Go to the Application tab and select the processor

11. In the console window. Go to the SDK console and click on the plus(+) icon and select the COM port of your device. 

12. Go to debug configuration and run debug

13. Check the print messages in the Terminal console screen.

#### The detailed tutorial for running OpenCL on ZYNQ FPGA can be found [here](https://gitlab.com/Tango-DNNbench/Tango/tree/master/FPGA)


### Using the Image_rgb_to_txt.py, 
This is a python script which takes any image as input and it would scale down the image to 227x227 and then extact the RGB values to a text file.
ImageNet validation dataset can be downloaded from [[3]](http://www.image-net.org/
) and any image from it can be passed to script.
e.g.

```python3 Image_rgb_to_txt.py ILSVRC2012_val_00000573.JPEG```


### Validation_results_with_various_inputs.xlsx ###
We tested the accuracy of the model using 300 images from Imagenet dataset. The summary of the results are located in this file. 
