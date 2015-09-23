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
	push {r4, r5, lr}

	subs r4, r0, #0 	@ R4 = R0 - 0 (update flags)
	beq .L4  			@ If R4 == 0 goto .L4 (which returns second)

	sub r5, r1, #0 		@ R5 = first

	sub r0, r4, #1 		@ R0 = R4 - 1
	add r1, r5, r2 		@ R1 = first+second
	mov r2, r5     		@ R2 = first
	bl fibonacci 		@ Recursive call to fibonacci 

	pop {r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

.L4:
	sub r0, r2, #0				@ R0 = second
	pop {r4, r5, pc}			@ EPILOG

	.size fibonacci, .-fibonacci
	.end
