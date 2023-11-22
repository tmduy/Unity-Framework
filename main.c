#include "unity_fixture.h"
#include <stdio.h>

int main(void)
{
#ifdef MACRO_PRINT_INTRO
	printf("\n-----Test Start-----\n\n");
#endif

	volatile int test_var = 1;
	TEST_ASSERT(test_var);
	
	test_var = 0;
	TEST_ASSERT(test_var); // Fail
	
	printf("Done");
	
	return 0;
}