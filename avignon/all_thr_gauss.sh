#!/bin/sh
export LD_LIBRARY_PATH=/opt/gcc-12.1.0/lib64

echo --- SEQUENTIAL ---
export OMP_NUM_THREADS=1

echo aos
perf stat -e 'power/energy-cores/,power/energy-gpu/,power/energy-pkg/,power/energy-ram/' release/img-aos in out gauss

echo soa
perf stat -e 'power/energy-cores/,power/energy-gpu/,power/energy-pkg/,power/energy-ram/' release/img-soa in out gauss


echo ---  2-THREAD  ---
export OMP_NUM_THREADS=2

echo aos
perf stat -e 'power/energy-cores/,power/energy-gpu/,power/energy-pkg/,power/energy-ram/' release/img-aos in out gauss

echo soa
perf stat -e 'power/energy-cores/,power/energy-gpu/,power/energy-pkg/,power/energy-ram/' release/img-soa in out gauss


echo ---  4-THREAD  ---
export OMP_NUM_THREADS=4

echo aos
perf stat -e 'power/energy-cores/,power/energy-gpu/,power/energy-pkg/,power/energy-ram/' release/img-aos in out gauss

echo soa
perf stat -e 'power/energy-cores/,power/energy-gpu/,power/energy-pkg/,power/energy-ram/' release/img-soa in out gauss


echo ---  8-THREAD  ---
export OMP_NUM_THREADS=8

echo aos
perf stat -e 'power/energy-cores/,power/energy-gpu/,power/energy-pkg/,power/energy-ram/' release/img-aos in out gauss

echo soa
perf stat -e 'power/energy-cores/,power/energy-gpu/,power/energy-pkg/,power/energy-ram/' release/img-soa in out gauss


echo --- 16-THREAD  ---
export OMP_NUM_THREADS=16

echo aos
perf stat -e 'power/energy-cores/,power/energy-gpu/,power/energy-pkg/,power/energy-ram/' release/img-aos in out gauss

echo soa
perf stat -e 'power/energy-cores/,power/energy-gpu/,power/energy-pkg/,power/energy-ram/' release/img-soa in out gauss

