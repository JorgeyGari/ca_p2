#!/bin/sh
echo ---  STATIC SCHEDULING  ---
sbatch all_thr.sh

echo --- DYNAMIC SCHEDULING  ---
sbatch all_thr.sh

echo ---  GUIDED SCHEDULING  ---
sbatch all_thr.sh
