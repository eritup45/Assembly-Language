/* ========================= */
/*       r0=r1+r2+r3+r4      */
/* ========================= */
.section .text
.global main
.type main,%function
main:
	mov r0, #0	@ r0 = 0
	mov r1, #1 	//r1 = 1
	mov r2, #2
	mov r3, #3
	add r0, r0, r1	@ r0 = r0 + r1
	add r1, r2, r3
	add r0, r0, r1
	nop;
	.end

