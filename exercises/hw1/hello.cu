#include <stdio.h>

__global__ void hello(){
  printf("Hello from block: %u, thread: %u\n", blockIdx.x, threadIdx.x);
}

int main(){

  dim3 grid(2);
  dim3 block(2);
  hello<<<grid, block>>>();
  cudaDeviceSynchronize();
}

