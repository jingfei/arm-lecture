	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	sub r4, r0, #0 	@ R4 = R0 - 0 (update flags)

	mov r3, #0		@ init fib(0) = 0
	mov r5, #1		@ init fib(1) = 1
.L5:
	mov r0, r5		@ R0 = R5 and also the result
	add r5, r3, r5	@ R5 += R3
	mov r3, r0		@ R3 = R0   (exchange R5, R3)
	subs r4, r4, #1 	@ R4 = R4 - 1
	bne .L5

	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
