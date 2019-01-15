To compile the program:
	1. gcc hw8.c
	2. gcc -msse4 hw8simd.c
	
In this project, there are hw8.c and hw8simd.c.
	1. hw8.c is without any SIMD intrinsic function.
	2. hw8simd.c uses SIMD_SSE intrinsic function.
	
	The programs will read 200 * 200 floating numbers.
	Then, it will compute the sum of the line itself multily other lines.
	
In simd:
	1. __mm128 a; 
		128 bits contain 4 bytes, which means it contains four "float", and it's a 4 space array. 
	2. float arr[max][max] __attribute__ ((aligned(16))); 
		store the input data (must be aligned), 16 = 4 * 4float
	
In makefile:
	gcc hw8.c
	./a.out
	gcc -msse4 hw8simd.c
	./a.out
