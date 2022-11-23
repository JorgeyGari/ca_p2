# How to test in Avignon
Once you have parallelized your function, it is time to upload your code to Avignon. Here are some steps to do this.

Before following these steps, **make sure that you have linked the OpenMP library** to the libraries `aos` and `soa` in their respective `CMakeLists.txt` files.

1. Modify your code to measure how long your function takes to run. To do this, you must:
* Include the `<chrono>` library by adding `#include <chrono>` at the beginning of the files `bitmap_aos.hpp` and `bitmap_soa.hpp`.
* Add this code snippet at the beginning of your function to create a "start" clock:
```
using clk = std::chrono::high_resolution_clock;
auto t1 = clk :: now();
```
* Add this code snippet at the end of your function to create an "end" clock and print the difference between both moments in time:
```
auto t2 = clk :: now();
auto diff = duration_cast<std::chrono::microseconds>(t2 - t1);
std :: cout << "Time= " << diff.count() << "microseconds\n";
```
**Remember that this code is not supposed to be in the final version.**

2. Upload your local copy of the repo to Avignon using the comand `scp -r <dir_to_upload> user@avignon.lab.inf.uc3m.es:<path_to_destination>` (scp stands for "safe copy"). Here is an example: `scp -r ca_p2/ a0452172@avignon.lab.inf.uc3m.es:~/ComputerArchitecture`.
3. In Avignon, run the [build configuration script](build.sh) **with `sbatch`**. This file sets up a release configuration and changes the compiler to G++-12, and then builds the project. The binaries will be located at `release`.
4. Inside of [this folder]() there are scripts called `all_thr_<function>.sh` for running each of the functions (`gauss`, `histo` and `mono`) with 1, 2, 4, 8 and 16 threads (using environment variables) in both versions of the program. In Avignon, copy the one corresponding to your function **and rename it to just `all_thr.sh`**.
5. Run [this script](all_sched.sh). It will invoke `all_thr.sh` with all three scheduling policies: static, dynamic and guided (in that order). You can check which number of `slurm-XXXXX.out` corresponds to which policy by reading the first one that you generated.
6. Gather the data. **It is recommended that you try running everything five times** so we can have more accurate data to use in the report. You can use [this spreadsheet](mono_results.xlsx) as a template.

And that's it! The speedup factors for 1, 2 and 4 threads should be close to the number of threads (linear speedup). Avignon only has four cores, so it won't take advantage of having 8 or 16 threads and **the speedup factor is supposed to be the same as with 4 threads**. When you are satisfied with your results, remember to make a pull request on your branch(es) and merge with `main`. Remember to merge the version **without `<chrono>`** (we only use `<chrono>` for testing purposes). 
