cmake_minimum_required(VERSION 3.14)
project(AlexNet_opencl)

set(CMAKE_CXX_STANDARD 17)
include_directories(/opt/intel/system_studio_2019/include)
add_executable(AlexNet_opencl main.cpp)
target_link_libraries(AlexNet_opencl "/opt/intel/system_studio_2019/opencl/SDK/lib64/libOpenCL.so")