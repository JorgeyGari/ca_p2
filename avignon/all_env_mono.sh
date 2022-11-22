#!/bin/sh
export LD_LIBRARY_PATH=/opt/gcc-12.1.0/lib64

echo --- SEQUENTIAL ---
export OMP_NUM_THREADS=1

echo aos
release/img-aos in out mono

echo soa
release/img-soa in out mono


echo ---  2-THREAD  ---
export OMP_NUM_THREADS=2

echo aos
release/img-aos in out mono

echo soa
release/img-soa in out mono


echo ---  4-THREAD  ---
export OMP_NUM_THREADS=4

echo aos
release/img-aos in out mono

echo soa
release/img-soa in out mono


echo ---  8-THREAD  ---
export OMP_NUM_THREADS=8

echo aos
release/img-aos in out mono

echo soa
release/img-soa in out mono


echo --- 16-THREAD  ---
export OMP_NUM_THREADS=16

echo aos
release/img-aos in out mono

echo soa
release/img-soa in out mono