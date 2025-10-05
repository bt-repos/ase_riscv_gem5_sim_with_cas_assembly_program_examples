   
## Getting started
+ copy any assembly program example
+ modify/replace `.s` file, with your program
    + a label `main:` is needed
    + after `main:` add at least following function call:
      + ```asm
        li a0, 1
        li a1, 1
        jal x1, m5_work_begin
        ```
+ run as usual `./simulate.sh -i path/to/program -nogui   #(or -gui)`


## Changes made to run assembly programs
+ copy any original program examples
+ remove any `*.c` sources
+ modify Makefile (line 23) to include all `.s` sources
+ add your assembly `<yourprogram>.s` source
+ label `main:` needed inside the assembly source
    + this is different to the lab0 requirement for the label to be `_start:`
+ inside the `main:`, add following code to start tracing and produce the log.
  + ```asm
    li a0, 1
    li a1, 1
    jal x1, m5_work_begin
    ```
  + Optionally, following code at the end before exit removes error at the end when program terminates
    ```asm
    li a0, 1
    li a1, 1
    jal x1, m5_work_end
    ```
  + the codes are the exact function calls present in the .c source translated to assembly.
+ in setup_default, 
    + set `CC` and `CC_INSTALLATION_PATH` depending on where you installed. I did `sudo apt install riscv64-linux-gnu-gcc` and these were the path, where the files were placed.
    + set `GEM5_INSTALLATION_PATH` to where you built your gem5.opt for RISCV.
    + set `GEM5_SIMULATION_SCRIPT` to whichever OoO COU you want among the three.
    + set `PATH_KONATA` to where you have placed your Konata binary if you use -gui option
        
        
        
# Tips
### Installing Konata
+ download and extract release
+ resolve any lib not found by installing the lib package
    + if lib was installed but is still not found due to name difference,  make symbolic links 
      ```
      ## eg. libasound.so.1 not found :  
      ln -s /path/to/libasound.so /same/path/with/sybolic/link/libasound.so.1
      ```

### Building gem5
+ If the process appears to be stuck, check if your SSD/HDD usage has high usage. If yes, you have run out of memory. And you disk is being used inplace of RAM. Since disk is significantly slower, it appears to be stuck (I think). So,
    + stop the build process and restart the build again. Anything already built will not be built again.
    + try running the build with lesser number of threads or constantly monitor disk usage and stop and restart when disk start getting used.
    + 8 cores, 16 threads CPU, 16GB RAM, WSL Ubuntu 20 LTS: -j4 was a good compromise for build/RISCV/gem5.opt 
        + **!! build/ALL/gem5.opt never completed due to high RAM usage at the final LINK stage**