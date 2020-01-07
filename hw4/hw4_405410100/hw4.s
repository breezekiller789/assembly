/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- variable a --- */
	.type a, %object
	.size a, 80		/*	Matrix A(5x4), it is 20 words, so that is 80 bytes	*/
a:
	.word 1
	.word 2
	.word 3
	.word 4
	.word 5
	.word 6
	.word 7
	.word 8
	.word 9
	.word 10
	.word 11
	.word 12
	.word 13
	.word 14
	.word 15
	.word 16
	.word 17
	.word 18
	.word 19
	.word 20 

/* --- variable b --- */
	.type b, %object
	.size b, 80		/*	Matrix B(3x3), it is 9 words, so that is 36 bytes	*/
b:
	.word 1			
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1

c:
	.space 24, 0	/* 80 bytes with initial value 0	*/

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function
.matrix:
	.word a
	.word b
	.word c
main:
	//	1th Round
	ldr r0, .matrix			/*	matrix A	*/
	ldr r2, .matrix + 4		/*	matrix B	*/
	ldr r1, .matrix + 8		/*	matrix C	*/

	mov r6, #0
	ldr r3, [r0], #4		/*	matrix A 1th value	*/
	ldr r4, [r2], #4		/*	matrix B 1th value	*/
	mul r5, r3, r4
	add r6, r6, r5
	
	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	str r6, [r1], #4


	// 2nd Round
	ldr r0, .matrix			/*	matrix A	*/
	ldr r2, .matrix + 4		/*	matrix B	*/
	add r0, r0, #4

	mov r6, #0
	ldr r3, [r0], #4		/*	matrix A 1th value	*/
	ldr r4, [r2], #4		/*	matrix B 1th value	*/
	mul r5, r3, r4
	add r6, r6, r5

	
	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	str r6, [r1], #4

	//	3nd Round
	ldr r0, .matrix			/*	matrix A	*/
	ldr r2, .matrix + 4		/*	matrix B	*/
	add r0, r0, #8

	mov r6, #0
	ldr r3, [r0], #4		/*	matrix A 1th value	*/
	ldr r4, [r2], #4		/*	matrix B 1th value	*/
	mul r5, r3, r4
	add r6, r6, r5

	
	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	str r6, [r1], #4

	//	4nd Round
	ldr r0, .matrix			/*	matrix A	*/
	ldr r2, .matrix + 4		/*	matrix B	*/
	add r0, r0, #20

	mov r6, #0
	ldr r3, [r0], #4		/*	matrix A 1th value	*/
	ldr r4, [r2], #4		/*	matrix B 1th value	*/
	mul r5, r3, r4
	add r6, r6, r5

	
	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	str r6, [r1], #4

	//	5nd Round
	ldr r0, .matrix			/*	matrix A	*/
	ldr r2, .matrix + 4		/*	matrix B	*/
	add r0, r0, #24

	mov r6, #0
	ldr r3, [r0], #4		/*	matrix A 1th value	*/
	ldr r4, [r2], #4		/*	matrix B 1th value	*/
	mul r5, r3, r4
	add r6, r6, r5

	
	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	str r6, [r1], #4

	//	6nd Round
	ldr r0, .matrix			/*	matrix A	*/
	ldr r2, .matrix + 4		/*	matrix B	*/
	add r0, r0, #28

	mov r6, #0
	ldr r3, [r0], #4		/*	matrix A 1th value	*/
	ldr r4, [r2], #4		/*	matrix B 1th value	*/
	mul r5, r3, r4
	add r6, r6, r5

	
	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #4
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	ldr r3, [r0], #12
	ldr r4, [r2], #4
	mul r5, r3, r4
	add r6, r6, r5

	str r6, [r1], #4

        nop

