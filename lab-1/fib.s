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
	push {r3, r4, lr}

	subs r4, r0, #0 	@ R4 = R0 - 0 (update flags)
	beq .L4  			@ If R4 == 0 goto .L4 (which returns second)

	sub r3, r1, #0 		@ R3 = first

	sub r0, r4, #1 		@ R0 = R4 - 1
	add r1, r3, r2 		@ R1 = first+second
	mov r2, r3     		@ R2 = first
	bl fibonacci 		@ Recursive call to fibonacci 

	pop {r3, r4, pc}		@EPILOG

	@ END CODE MODIFICATION

.L4:
	sub r0, r2, #0				@ R0 = second
	pop {r3, r4, pc}			@ EPILOG

	.size fibonacci, .-fibonacci
	.end
