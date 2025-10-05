# Data section
.section .data
# Place here your program data.
# In this example, two vector of floats
# a vector of ints and a single int are defined
V1: .float 1.0, 2.0, 3.0, 4.0
V2: .float 5.0, 6.0, 7.0, 8.0
V3: .word 0, 1, 2, 3
T0: .word 0x0BADC0DE

hello_msg: .string "HelloWorld\n"

# Code section
.section .text
# The _start label signals the entry point of your program
# DO NOT CHANGE ITS NAME.
# It must be “_start”, not “start”, not “main”, not “start_”. 
# It’s “_start” with a leading ‘_’ and all lowercase letters
.globl main 
main:


li a0, 1
li a1, 1
jal x1, m5_work_begin



# In the _start area, load the first byte/word of each of 
# the areas declared in the .data section
# This is needed to load data in the cache and avoid 
# pipeline stalls later
la x1, V1
flw fs1, 0(x1)
la x1, V2
flw fs1, 0(x1)
la x1, V3
lw x2, 0(x1)
la x1, T0
lw x2, 0(x1)
Main:
# Your code goes here


addi x1,x0,0


End:

## printf to stdout (write system call)
# li a0, 1
# la a1, hello_msg
# li a2, 11
# li a7, 64
# ecall

li a0, 1
li a1, 1
jal x1, m5_work_end



# exit() syscall. This is needed to end the simulation
# gracefully
li a0, 0
li a7, 93
ecall
