“README.txt” file describes the features in your program and how to compile
and run your program

Function: get the highest common factor, and print the result.
(A) In gcd.s:
First, by rule APCS:	
	Entering the file should use "callee saved registers". 
	For example: 
		mov ip, sp
		stmfd sp!, {r4-r10, fp, ip, lr, pc}
		sub fp, ip, #4
	when leaving,
		ldmea fp, {r4-r10, fp, sp, pc}
		
Second, to get their highest common factor, use Euclid’s Algorithm. Storing 
parameter in r0, r1, and result in r0.
(B) In hw6_test.c:
	The type of gcd is:
	int gcd(int a, int b)
	Fuction gcd will return result finally.
	
The environment of my linux is ubuntu 16.04.
To conpile my program, use "arm-none-eabi-gcc -g -O0 hw6_test.c gcd.s -o hw5.exe".
Since I set gcd as global, linker will connect gcd.s and hw6_test.c together,
and finally become an exe file.
	Parameters:
		"-g" provide debug message.
		"-O0" means do not optimize the program, which won't lead to 
		problems when conducting the program one line by one line.

Afterwards, use arm-none-eabi-insight to check the result. To run the code,
it is necessary to set target to "simulator", and then click "run". The 
result is stored in r0 register.
