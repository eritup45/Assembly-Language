¡§README.txt¡¨ file describes the features in your program and how to 
compile and run your program

First of all, I set the matrix a and b. A word is 4 bytes, so a and b are
set in 24 bytes. I also have written the comments of the position of the 
matrix on my code, so user can see the word correspond to the position 
of the matrix.
Second, I should decide the size of matrix c. It's 3*3 matrix, so the size
of it is 36.
Third, I put a, b, c in a label ".matrix". Therefore, if I want to use a,
b, or c, I could just write: ldr r0, .matrix, ldr r0, .matrix+4, ldr 
r0, .matrix+8 respectivly.
Fourth, I use two loop to finish the result. The first loop is to control 
the row of matrix a. The second loop is to control the column of matrix b.
Using row and column, I can get the result of matrix a multiple matrix b.

The environment of my linux is ubuntu 16.04.
To conpile my program, use "arm-none-eabi-gcc -g -O0 hw3.s -o hw3.exe". 
	parameters:
		"-g" provide debug message.
		"-O0" means do not optimize the program, which won't lead to 
		problems when conducting the program one line by one line.

Afterwards, use arm-none-eabi-insight to check the result. To run the code,
it is necessary to set target to "simulator", and then click "run". The 
result is stored in memory, which is matrix c's value.

