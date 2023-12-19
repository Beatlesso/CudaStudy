#include <stdio.h>

__global__ void hello_from_gpu()
{
    const int block_id = blockIdx.x;
    const int thread_id = threadIdx.x;
    printf("%d %d hello from gpu!\n", block_id, thread_id);
}

int main(void)
{
    hello_from_gpu<<<2, 4>>>();
    cudaDeviceReset();
    cudaDeviceSynchronize();
    printf("end\n");
    return 0;
}