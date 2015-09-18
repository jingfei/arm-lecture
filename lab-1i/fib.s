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
	cmp r0, #0 @ if(R0 <= 0) goto .L3 (which returns 0)
	ble .L3

	cmp r4, #1 @ Compare R4 wtih 1
	beq .L4  @ If R4 == 1 goto .L4 (which returns 1)
	
	cmp r4, #2
	beq .L4

	mov r3, #1
	mov r5, #1
.L5:
	mov r0, r5
	add r5, r3, r5
	mov r3, r0
	sub r0, r4, #1 @ R0 = R4 - 1
	mov r4, r0
	cmp r0, #2
	bne .L5

	mov r0, r5
	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
