¡§README.txt¡¨ file describes the features in your program and how to compile
and run your program

Function: get the highest common factor
First, by rule APCS:
	In hw5_test.s, entering the file should write:
		MOV ip, sp
		STMFD sp!, {fp, ip, lr, pc}	
		SUB fp, ip, #4
	ending the file should write:
		LDMEA fp, {fp, sp, pc}
	
	In gcd.s, entering the file should also use "callee saved registers". 
	For example: 
		STMFD sp!, {r4-r10, fp, ip, lr, pc}
Second, in hw5_test.s, set r0, r1 two random numbers, and find their highest common 
factor. In gcd.s, to get their highest common factor, use Euclid¡¦s Algorithm.
Afterwards, the r0 register will be stored the highest common factor.

The environment of my linux is ubuntu 16.04.
To conpile my program, use "arm-none-eabi-gcc -g -O0 hw5_test.s gcd.s -o hw5.exe".
Since I set gcd and main as global, linker will connect gcd and main together,
and finally become an exe file.
	Parameters:
		"-g" provide debug message.
		"-O0" means do not optimize the program, which won't lead to 
		problems when conducting the program one line by one line.

Afterwards, use arm-none-eabi-insight to check the result. To run the code,
it is necessary to set target to "simulator", and then click "run". The 
result is stored in r0 register.

