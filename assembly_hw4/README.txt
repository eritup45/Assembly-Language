¡§README.txt¡¨ file describes the features in your program and how to compile
and run your program

Function: get the highest common factor
First, set r0, r1 two random numbers, and find their highest common 
factor. To get their highest common factor, use Euclid¡¦s Algorithm.
Afterwards, the r0 register will be stored the highest common factor.

The environment of my linux is ubuntu 16.04.
To conpile my program, use "arm-none-eabi-gcc -g -O0 hw3.s -o hw3.exe". 
	parameters:
		"-g" provide debug message.
		"-O0" means do not optimize the program, which won't lead to 
		problems when conducting the program one line by one line.

Afterwards, use arm-none-eabi-insight to check the result. To run the code,
it is necessary to set target to "simulator", and then click "run". The 
result is stored in r0 register.

