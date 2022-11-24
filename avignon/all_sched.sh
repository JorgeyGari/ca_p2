#!/bin/sh
echo ---  STATIC SCHEDULING  ---
export OMP_SCHEDULE=static
sbatch all_thr.sh

echo --- DYNAMIC SCHEDULING  ---
export OMP_SCHEDULE=dynamic
sbatch all_thr.sh

echo ---  GUIDED SCHEDULING  ---
export OMP_SCHEDULE=guided
sbatch all_thr.sh
