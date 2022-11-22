# How to test in Avignon
Once you have made a pull request and merged your branches with `main`, it is time to upload your code to Avignon. Here are some steps to do this.

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
2. Upload your local copy of the repo to Avignon using the comand `scp -r <dir_to_upload> user@avignon.lab.inf.uc3m.es:<path_to_destination>` (scp stands for "safe copy"). Here is an example: `scp -r ca_p2/ a0452172@avignon.lab.inf.uc3m.es:~/ComputerArchitecture`.
3. In Avignon, run the [build configuration script](avignon/build.sh) **with `sbatch`**. This file sets up a release configuration and changes the compiler to G++-12, and then builds the project. The binaries will be located at `release`.
4. Now that you have the compiled version of `img-aos` and `img-soa`, you can run them (**with `sbatch`**). Inside of [this folder](avignon) there are scripts for running each of the functions (`gauss`, `histo` and `mono`) with 1, 2, 4, 8 and 16 threads (using environment variables) in both versions of the program.
5. Gather the data. **It is recommended that you try running everything five times** so we can have more accurate data to use in the report. You can use [this spreadsheet](avignon/mono_results.xlsx) as a template.
