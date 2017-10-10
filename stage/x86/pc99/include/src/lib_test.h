#include <stdio.h>
#include <stdlib.h>

#include <refos-rpc/rpc.h>

// #define REPLY_RECV

uint64_t BP_As[MAX_BENCHMARK];
uint64_t BP_Bs[MAX_BENCHMARK];
uint64_t BP_Cs[MAX_BENCHMARK];
uint64_t BP_Ds[MAX_BENCHMARK];

int BP_cur;

void test_env_initial();
