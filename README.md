# horovod_pytorch

Installating horovod has been a challenge in revent days. There are conda or Pip, yet those can not help you much. Because, starting from cmake, cuda version, not having nvcc in the cuda toolkit, MPI_CXX not found, libcudart.so not found, there can be hundreds of issures. As a researcher it is hard to focuus on these system issues. Soon, these system errors can dive you into frustration. You are supposed to focus on implementing something using horovod and now stuck into setting up the installing horovod forever. That's how I came into sharing the installation guide. Now, you can ask, there are horovod insttalation guide given in their website why this! Good question. However, answe is simple. Horovod installation guide probably does not update frequestly. There is performance gap between horovod development pace and pytorch development pace ended up horovod can not work with updated pytorch anymore. I will describe few issues that I have faced over the time and solution.

Finally I have realied, horovod pytorch is challenging because of the version mismatch and compatability issue. Horovod does not support latest pytorch anymore. However, if you follow horovod installation guide that installs latest pytorch and you have no idea al

Issue 1: There is no cuda compiler nvcc inside your Cuda toolkit installed from conda.
Solve: cudatoolkit-dev package. Cudatoolkit installed from conda does not come up with nvcc. this is a bare minimum package.

Issue 2: MPI_CXX can not found. I spent a lot of time into here. installing from conda was not working initially. I had to build the cmake from source. Installing cmake from conda sometimes show ""CMakeCUDACompilerId.cu" failed.".
Solve: Build cmake from source and add the cmake path in your PATH variable.

Issue 3: Finally, horovod setuptool issue. I found this issue was for incompatible C++ version while building pytorch. Pytorch from 2.0 demands C++ version 17. 
Solve: installing pytorch 1.13. Pytorch 1.13 is the last version that works with C++ 14. After that it demands higher.
