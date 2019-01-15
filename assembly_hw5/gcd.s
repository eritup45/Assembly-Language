/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global gcd
	.type gcd,%function

gcd:
	/* function start */
	MOV ip, sp
	STMFD sp!, {r4-r10, fp, ip, lr, pc}
	SUB fp, ip, #4	

	/* --- begin your function --- */
	/* 傳入值會放在r0, r1 */
	/*Euclid’s Algorithm*/
loop:
	cmp r0, r1
	beq end
	subgt r0, r0, r1
	sublt r1, r1, r0
	b loop

end:	
    nop
	LDMEA fp, {r4-r10, fp, sp, pc}
	.end
