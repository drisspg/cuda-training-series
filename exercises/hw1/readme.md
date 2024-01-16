# Homework 1

These exercises will have you write some basic CUDA applications. You will learn how to allocate GPU memory, move data between the host and the GPU, and launch kernels.

## **1. Hello World**

Your first task is to create a simple hello world application in CUDA. The code skeleton is already given to you in `hello.cu`. Edit that file, paying attention to the FIXME locations, so that the output when run is like this:

```
Hello from block: 0, thread: 0
Hello from block: 0, thread: 1
Hello from block: 1, thread: 0
Hello from block: 1, thread: 1
```

(the ordering of the above lines may vary; ordering differences do not indicate an incorrect result)

Note the use of `cudaDeviceSynchronize()` after the kernel launch. In CUDA, kernel launches are *asynchronous* to the host thread. The host thread will launch a kernel but not wait for it to finish, before proceeding with the next line of host code. Therefore, to prevent application termination before the kernel gets to print out its message, we must use this synchronization function.

After editing the code, compile it using the following:

``` Shell
nvcc -gencode arch=compute_90,code=sm_90 hello.cu -o bin/hello
```

## **2. Vector Add**

If you're up for a challenge, see if you can write a complete vector add program from scratch. Or if you prefer, there is a skeleton code given to you in `vector_add.cu`. Edit the code to build a complete vector_add program. Compile it and run it similar to the method given in exercise 1. You can refer to `vector_add_solution.cu` for a complete example.

Note that this skeleton code includes something we didn't cover in lesson 1: CUDA error checking. Every CUDA runtime API call returns an error code. It's good practice (especially if you're having trouble) to rigorously check these error codes. A macro is given that will make this job easier. Note the special error checking method after a kernel call.

Typical output when complete would look like this:
```
A[0] = 0.840188
B[0] = 0.394383
C[0] = 1.234571
```

## **3. Matrix Multiply (naive)**

A skeleton naive matrix multiply is given to you in `matrix_mul.cu`. See if you can complete it to get a correct result. If you need help, you can refer to `matrix_mul_solution.cu`.

This example introduces 2D threadblock/grid indexing, something we did not cover in lesson 1. If you study the code you will probably be able to see how it is a structural extension from the 1D case.

This code includes built-in error checking, so a correct result is indicated by the program.
