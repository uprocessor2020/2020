@ Copyright (c) 2020 Jungrae Kim <dale40@skku.edu>
@ This file is for programming assignments of micro-processor class at SungKyunKwan University.

@ This template mimics a C program of
@ #include <stdio.h>
@
@ int A[] = {1, 2, 3, 4};
@ int B[] = {2, 4, 6, 8};
@
@ int main()
@ {
@     printf("Output is %d\n", A[0]*B[0]+A[1]*B[1]+A[2]*B[2]+A[3]*B[3]);
@     return 0;
@ }

	.global main
main:
	push	{lr}		@ temporarily store the link register value into the stack

@ Your codes for part 3 (vector multiplication) starts
				@ Reset r1, which will serve as a storage of sum, to 0

				@ Use a LDR pseudo instruction to set r2 to vectorA address
				@ Use a LDR pseudo instruction to set r3 to vectorB address

				@ Use a LDR normal instruction to load the first element of vector A to r4
				@ Use a LDR normal instruction to load the first element of vector B to r5

				@ Use a MLA instruction to multiply r4 and r5 and accumulate the result to r1
				@ (r1 will be the second argument of the printf("Output is %d", n) call).

				@ Increment r2 by 4 to point to the next word in VectorA
				@ Increment r3 by 4 to point to the next word in VectorB

				@ Use a LDR normal instruction to load the second element of vector A to r4
				@ Use a LDR normal instruction to load the second element of vector B to r5

				@ Use a MLA instruction to multiply r4 and r5 and accumulate the result to r1

				@ Increment r2 by 4 to point to the next word in VectorA
				@ Increment r3 by 4 to point to the next word in VectorB

				@ Use a LDR normal instruction to load the third element of vector A to r4
				@ Use a LDR normal instruction to load the third element of vector B to r5

				@ Use a MLA instruction to multiply r4 and r5 and accumulate the result to r1

				@ Increment r2 by 4 to point to the next word in VectorA
				@ Increment r3 by 4 to point to the next word in VectorB

				@ Use a LDR normal instruction to load the third element of vector A to r4
				@ Use a LDR normal instruction to load the third element of vector B to r5

				@ Use a MLA instruction to multiply r4 and r5 and accumulate the result to r1

@ Your codes for part 3 (vector multiplication) ends

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
