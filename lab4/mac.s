@ Copyright (c) 2020 Jungrae Kim <dale40@skku.edu>
@ This file is for programming assignments of micro-processor class at SungKyunKwan University.

@ This template mimics a C program of
@ #include <stdio.h>
@ int main()
@ {
@     printf("Output is %d\n", 1);
@     return 0;
@ }

	.global main
main:
	push	{lr}		@ temporarily store the link register value into the stack

@ Your codes for part 2 (single element multiplication) starts
				@ Use a LDR pseudo instruction to set r2 to vectorA address
				@ Use a LDR pseudo instruction to set r3 to vectorB address

				@ Use a LDR normal instruction to load the first element of vector A to r4
				@ Use a LDR normal instruction to load the first element of vector B to r5

				@ Use a MUL instruction to multiply r4 and r5 and save the result to r1
				@ (the r1 will be the second argument of the printf("Output is %d", n) call).

@ Your codes for part 2 (single element multiplication) ends
				@ Your ALU codes start here
	ldr	r2, =vectorA	@ r2 has a pointer to vectorA
	ldr	r3, =vectorB	@ r3 has a pointer to vectorB

	ldr	r4, [r2]	@ r4 has the first element of vector A
	ldr	r5, [r3]	@ r5 has the first element of vector B

	mul	r1, r4, r5	@ r1 has the result of multiplication of A[0] and B[0]

				@ Your codes must NOT update the special registers (SP, LR, PC).

				@ Your ALU codes end here

				@ Your codes must put the output into r1, to be printed by the printf()
	ldr	r0, =message	@ the message string is the first argument of the printf()
	bl	printf		@ invoke the printf()

	mov	r0, #0		@ this is the return value (0) of this main function
	pop	{pc}		@ pop the saved link register value to update the PC to return

message:			@ literal part
	.align	2		@ message is aligned to 2 bytes (16 bits)
	.asciz 	"Output is %d\012\000"
	.align	4		@ vector are aligned to 4 bytes (32 bits)
vectorA:
	.word	1, 2, 3, 4	@ Vector A = {1, 2, 3, 4}
vectorB:
	.word	2, 4, 6, 8	@ Vector B = {2, 4, 6, 8}
