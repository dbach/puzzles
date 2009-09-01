#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
	int i;
	int last = 1000;
	int sum = 0;
	
	if (argc > 1) { last = atoi(argv[1]); }
	
	for (i = 0; i < last; ++i) {
		if (i % 3 == 0 || i % 5 == 0) 
		{
			sum += i;
		}
	}
	
	printf ("Up to %d: sum=%d\n", last, sum);
	return 0;
}