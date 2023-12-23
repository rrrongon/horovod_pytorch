#!/bin/bash

export ENV_PREFIX=/home/rongon/anaconda3/envs/tt_2
#export CUDA_HOME=/home/rongon/anaconda3/pkgs/cuda-nvcc-11.8.89-0
export CUDA_HOME=$ENV_PREFIX
export HOROVOD_CUDA_HOME=$CUDA_HOME
export HOROVOD_NCCL_HOME=$ENV_PREFIX
export HOROVOD_GPU_OPERATIONS=NCCL
export HOROVOD_WITH_PYTORCH=1
export CUDAToolkit_ROOT=$ENV_PREFIX:$CUDAToolkit_ROOT
export LIBRARY_PATH=/home/rongon/anaconda3/pkgs/cuda-nvcc-11.8.89-0/lib

conda env create --prefix $ENV_PREFIX --file environment.yml --force
source activate $ENV_PREFIX
#pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
HOROVOD_GPU_OPERATIONS=NCCL pip3 install horovod
