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

	sub r4, r0, #0 @ R4 = R0 - 0 (update flags)
	sub r3, r1, #0 @ first
	sub r5, r2, #0 @ second
	cmp r0, #0 @ if(R0 <= 0) goto .L3 (which returns second)
	ble .L3

	cmp r4, #1 @ Compare R4 wtih 1
	beq .L4  @ If R4 == 1 goto .L4 (which returns first)

	sub r0, r4, #1 @ R0 = R4 - 1
	add r1, r3, r5 @ R1 = first+second
	mov r2, r3     @ R2 = first
	bl fibonacci @ Recursive call to fibonacci 

	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, r5			@ R0 = second
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, r3			@ R0 = first
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
