#include <stdio.h>
#include <stdlib.h>

#include "lib_test.h"

void test_env_initial()
{
    memset(BP_As, 0, MAX_BENCHMARK * sizeof(uint64_t));
    memset(BP_Bs, 0, MAX_BENCHMARK * sizeof(uint64_t));
    memset(BP_Cs, 0, MAX_BENCHMARK * sizeof(uint64_t));
    memset(BP_Ds, 0, MAX_BENCHMARK * sizeof(uint64_t));

    BP_cur = 0;

    return;
}
