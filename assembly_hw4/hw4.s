/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function
/* Function: find the highest common factor */
main:
	mov r0, #40
	mov r1, #45
/* Euclid’s Algorithm */
loop:
	cmp r0, r1
	beq end
	subgt r0, r0, r1
	sublt r1, r1, r0
	b loop

end:	
    nop
	.end
