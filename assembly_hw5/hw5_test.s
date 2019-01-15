	.section .text
	.global main
	.type main,%function

main:
	MOV ip, sp
	STMFD sp!, {fp, ip, lr, pc}
	SUB fp, ip, #4

	/* --- begin of your function --- */
	MOV r0, #36    /* set argument value */
	MOV r1, #30    /* set argument value */

	bl gcd
	nop
	/* --- end of your function --- */

	LDMEA fp, {fp, sp, pc}
	.end
