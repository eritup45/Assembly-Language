The program's function: 
	Read data from "input.txt".
	The maximum words are 10000.
	Transform all letters to capital letters.
	Write the result in "output.txt".

To read and write data, we should call SWI to help us. 
So we should set the variable first:
	.set SWI_Open, 0x1
	.set SWI_Close, 0x2
	.set SWI_WriteC, 0x3
	.set SWI_Write, 0x5
	.set SWI_Read, 0x6
	.set SWI_FLen, 0xC
	.set AngelSWI, 0x123456	/* similar to "execute SWI" */
To use SWI, we should follow its rule. For example:
	/* Open input_file */
	.open_input_param:		
		.word .input_addr	@The address of file name
		.word 0x2		@Argument (Read 0x2, Write 0x4, Append 0x8)
		.word 0x8		@Length of file name
					/* Return file descriptor in r0 */



The environment of my linux is ubuntu 16.04.
To conpile my program, use "arm-none-eabi-gcc -g -O0 hw7.s -o hw7.exe",
or use my make file.
	Parameters:
		"-g" provide debug message.
		"-O0" means do not optimize the program, which won't lead to 
		problems when conducting the program one line by one line.

Afterwards, use arm-none-eabi-insight to check the result. To run the code,
it is necessary to set target to "simulator", and then click "run". The 
result is stored in "output.txt".