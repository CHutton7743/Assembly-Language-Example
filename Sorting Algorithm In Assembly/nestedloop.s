.data
width:	.word 15
outsides: .word 7
insides: .word -1
i: .word 0
promptStar: .asciz "*"
promptSpace: .asciz " "
promptLine: .asciz "\n"

.text
.global main
.global printf

writeSpace:
	str lr, [sp, #-4]!
	ldr r0, addrSpace
	bl printf
	ldr lr, [sp], #+4
	bx lr

writeStar:
	str lr, [sp, #-4]!
	ldr r0, addrStar
	bl printf
	ldr lr, [sp], #+4
	bx lr

writeLine:
	str lr, [sp, #-4]!
	ldr r0, addrLine
	bl printf
	ldr lr, [sp], #+4
	bx lr

firstInnerLoop:
	
	str lr, [sp, #-4]!
	bl writeStar
	ldr lr, [sp], #+4

	mov r10, #0

	b outerLoopRight

main:

	ldr r4, addrWidth
	ldr r4, [r4]

	ldr r5, addrOut
	ldr r6, [r5]

	ldr r7, addrIn
	ldr r8, [r7]

	ldr r9, addrI
	ldr r10, [r9]

outerLoop:
	cmp r6, #0
	ble  lastLine

	mov r10, #0

outerLoopLeft:
	str lr, [sp, #-4]!
	bl writeSpace
	ldr lr, [sp], #+4

	add r10, r10, #1
	
	cmp r10, r6
	blt outerLoopLeft

innerLoop:
	cmp r8, #-1
	beq firstInnerLoop

	str lr, [sp, #-4]!
	bl writeStar
	ldr lr, [sp], #+4
	
	mov r10, #0

innerLoopSpaces:
	str lr, [sp, #-4]!
	bl writeSpace
	ldr lr, [sp], #+4

	add r10, r10, #1	

	cmp r10, r8
	blt innerLoopSpaces

	str lr, [sp, #-4]!
	bl writeStar
	ldr lr, [sp], #+4
	
	mov r10, #0
	
outerLoopRight:
	str lr, [sp, #-4]!
	bl writeSpace
	ldr lr, [sp], #+4

	add r10, r10, #1
	
	cmp r10, r6
	blt outerLoopRight

	sub r6, r6, #1
	add r8, r8, #2

	str lr, [sp, #-4]!
	bl writeLine
	ldr lr, [sp], #+4

	b outerLoop 


lastLine:
	str lr, [sp, #-4]!
	bl writeStar
	ldr lr, [sp], #+4
	
	sub r4, r4, #1
	cmp r4, #0
	bgt lastLine
	


endProgram:

	mov r0, #0
	bx lr
	

addrWidth: .word width
addrOut: .word outsides
addrIn: .word insides
addrI: .word i
addrStar: .word promptStar
addrSpace: .word promptSpace
addrLine: .word promptLine
