#!/bin/bash

if [ $# -ne 1 ]; then

  echo "Usage: $0 <target directory>"
  exit 1

fi

if [ -d "${1}" ]; then

  wget https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz

  echo "Extracting archive into $1..."

  tar -xf cifar-10-python.tar.gz -C $1

  echo "Removing archive..."

  rm cifar-10-python.tar.gz

  export CIFAR10_PATH=$1 
  

else

  echo "The directory $1 is invalid. Please make sure the target directory exists."

fi
