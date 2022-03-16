.data
i: .word 0
j: .word 0
n: .word 5
zero: .word 0
key: .word 0
array: .skip 20
promptLine: .asciz "\n"
promptDigit: .asciz "%d"

.text
.global main
.global printf

printSetup:
	mov r5, #0
	ldr r7, addrArray

print:
	cmp r5, #5
	bge return

	add r1, r7, r5, LSL #2
	ldr r1, [r1]

	str lr, [sp, #-4]!
	ldr r0, addrDigit
	bl printf
	ldr lr, [sp], #+4

	str lr, [sp, #-4]!
	ldr r0, addrLine
	bl printf
	ldr lr, [sp], #+4

	add r5, r5, #1

	b print

sort:
	cmp r5, #5
	bge return

	ldr r0, addrArray
	add r1, r0, r5, LSL #2

	ldr r2, [r1]

	sub r6, r5, #1

	str lr, [sp, #-4]!
	bl sortBody
	ldr lr, [sp], #+4

	add r6, r6, #1
	add r4, r0, r6, LSL #2

	str r2, [r4]
	add r5, r5, #1
	sub r6, r6, #1

	b sort

sortBody:
	cmp r6, #0
	blt return

	add r4, r0, r6, LSL #2
	ldr r8, [r4]

	cmp r8, r2
	ble return
	
	add r6, r6, #1
	add r7, r0, r6, LSL #2 
	ldr r8, [r4]
	str r8, [r7]  

	sub r6, r6, #2

	b sortBody

return:
	bx lr

main:
	mov r6, #0

	ldr r5, addrI //could be mov r5, #0
	ldr r5, [r5]

	ldr r1, addrArray
	mov r2, #51
	str r2, [r1]
	add r5, r5, #1

	add r3, r1, r5, LSL #2
	mov r2, #67
	str r2, [r3]
	add r5, r5, #1

	add r3, r1, r5, LSL #2
	mov r2, #34
	str r2, [r3]
	add r5, r5, #1

	add r3, r1, r5, LSL #2
	mov r2, #17
	str r2, [r3]
	add r5, r5, #1

	add r3, r1, r5, LSL #2
	mov r2, #1
	str r2, [r3]
	add r3, r1, r5, LSL #2

	mov r5, #1

	str lr, [sp, #-4]!
	bl sort
	ldr lr, [sp], #+4

	mov r5, #0
	ldr r8, addrI
	str r5, [r8]

	str lr, [sp, #-4]!
	bl printSetup
	ldr lr, [sp], #+4

	bx lr

addrI: .word i
addrJ: .word j
addrN: .word n
addrZero: .word zero
addrKey: .word key
addrArray: .word array
addrLine: .word promptLine
addrDigit: .word promptDigit
