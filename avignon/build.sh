#!/bin/sh
export LD_LIBRARY_PATH=/opt/gcc-12.1.0/lib64
cmake -S . -B release -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=/opt/gcc-12.1.0/bin/g++
cmake --build release
