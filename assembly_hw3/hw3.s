/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- 3*2 matrix a --- */
	.type a, %object
	.size a, 24	/* 4(int)*3*2=24 */
a:
	.word 1	/* [1,1] */
	.word 2	/* [1,2] */
	.word 3	/* [2,1] */
	.word 4	/* [2,2] */
	.word 5	/* [3,1] */
	.word 6	/* [3,2] */

/* --- 2*3 matrix b --- */
	.type b, %object
	.size b, 24	/* 4(int)*2*3=24 */
b:
	.word 6	/* [1,1] */
	.word 5	/* [2,1] */
	.word 4	/* [1,2] */
	.word 3	/* [2,2] */
	.word 2	/* [1,3] */
	.word 1	/* [2,3] */

/* --- 3*3 result_matrix c --- */
c:
	.space 36, 0	/* 4(int)*9=36 */

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function
.matrix:		/* seem as a pointer array */
	.word a
	.word b
	.word c
main:
	ldr r0, .matrix		/* r0 := matrix a */
	@ldr r2, .matrix + 4	/* r2 := matrix b */
	ldr r1, .matrix + 8	/* r1 := matrix c */
	mov r3, #0

/* for(i=0; i<3 (r3); i++) */
loop_three_times:
	ldr r4, [r0], #4	/* matrix a's rows */
	ldr r5, [r0], #4	/* r4 := mem32[r0] */
		 	 	/* r0 := r0 + 4    */
	mov r12, #0
	ldr r2, .matrix + 4	/* r2 := matrix b */
	bl loop_mul_and_add

	add r3, r3, #1
	cmp r3, #3		/*by reaching 3, already done 3 times*/
	blt loop_three_times
	bge end

/* for(i=0; i<3 (r12); i++) */	
loop_mul_and_add:
	ldr r6, [r2], #4	/* matrix b's columns */
	ldr r7, [r2], #4	
	mul r10, r4, r6
	mul r11, r5, r7
	add r10, r10, r11
	str r10, [r1], #4	/* store r10 in r1 (matrix c) */

	add r12, r12, #1
	cmp r12, #3
	movge pc, lr		/* return to loop_three_times */
	blt loop_mul_and_add
	
end:
	nop









