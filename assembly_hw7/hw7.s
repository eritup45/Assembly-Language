.set SWI_Open, 0x1
.set SWI_Close, 0x2
.set SWI_WriteC, 0x3
.set SWI_Write, 0x5
.set SWI_Read, 0x6
.set SWI_FLen, 0xC
.set AngelSWI, 0x123456	/* similar to "execute SWI" */


/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- a string --- */
.input_addr:
	.ascii "input.txt\000"
.output_addr:
	.ascii "output.txt\000"
.readbuffer:
	.space 4

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function

/* Open input_file */
.open_input_param:		
	.word .input_addr	@The address of file name
	.word 0x2		@Argument (Read 0x2, Write 0x4, Append 0x8)
	.word 0x8		@Length of file name
				/* Return file descriptor in r0 */

/* Open output_file */
.open_output_param:		
	.word .output_addr	
	.word 0x4		
	.word 0x8
		
/* Get file length */
.flen_param:			
	.space 4		@File descriptor
				/* Return "current length of the file" in r0 */

/* Read file */
.read_param:
	.space 4		@File descriptor
	.word .readbuffer	@Address of the read buffer (save word in here)
	.space 4		@# of bytes to be read

/* Close file */
.close_param:
	.space 4		@File descriptor

/* Write in file */
.write_param:
	.space 4   		@File descriptor
	.space 4   		@Address of the string
	.space 4   		@Length of the string

.output_string:			@Word written in output.txt
	.space 10000

main:
	/* Rule APCS */
	mov ip, sp
	stmfd sp!, {fp, ip, lr, pc}
	sub fp, ip, #4

        /* open a file */
	mov r0, #SWI_Open
	adrl r1, .open_input_param
	swi AngelSWI
	mov r2, r0		/* r2 is file descriptor */

	/* get length of a file */
	mov r0, #SWI_FLen
	adrl r1, .flen_param
	str r2, [r1, #0]
	swi AngelSWI
	mov r6, r0		/* r6 is file length (used when read) */
	mov r8, r6		/* r8 is temporary length (used when write) */     

        /* read from a file */
	adrl r1, .read_param
	str r2, [r1, #0]	/* store file descriptor */

	ldr r5, [r1, #4]        /* r5 is the address of readbuffer */

	mov r3, #1
	str r3, [r1, #8]        /* store the length of the string (once read a byte) */

	/* r7 is the address of output string */
	ldr r7, =.output_string

loop:
	cmp r6, #0
	ble final		/* break */
	mov r0, #SWI_Read
	swi AngelSWI
	ldrb r4, [r5, #0]       /* r4 is the readed data ("ldrb" make r5 (originally 1 word) be 1 byte)*/
	bl is_capital_letter
	strb r4, [r7], #1	/* r7 is the output */

	sub r6, r6, #1
	b loop

/* If r4 is capital letter, return the capital letter. Else, not changed. */
is_capital_letter:
	/* callee save (not written, since hard to read) */
	/* 
	STMFD sp!, {r4-r10, fp, ip, lr, pc}
	LDMEA fp, {r4-r10, fp, sp, pc} 
	*/

	cmp r4, #97		/* if r4 < 'a' */
	movlt pc, lr
	cmp r4, #122		/* if r4 > 'z' */
	movgt pc, lr
	sub r4, r4, #32		/* else */
	mov pc, lr

final:
	/* close input file */
	adrl r1, .close_param
	str r2, [r1, #0]

	mov r0, #SWI_Close
	swi AngelSWI

	/* open output file */
	mov r0, #SWI_Open
	adrl r1, .open_output_param
	swi AngelSWI
	mov r2, r0                /* r2 is file descriptor */

	/* write output_string to file "output.txt" */
	adrl r1, .write_param
	str r2, [r1, #0]          /* store file descriptor */
	
	ldr r3, =.output_string
	str r3, [r1, #4]          /* store the address of string */

	str r8, [r1, #8]          /* store the length of the string */

	mov r0, #SWI_Write
	swi AngelSWI

	/* close output file */
	adrl r1, .close_param
	str r2, [r1, #0]

	mov r0, #SWI_Close
	swi AngelSWI

end:
	nop
	ldmea fp, {fp, sp, pc}	/* Rule APCS */
	.end
