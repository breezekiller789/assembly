/* --- variable a --- */
	.type a, %object
	.size a, 80		/*	Input(5x4), it is 20 words, so that is 80 bytes	*/
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
	.size b, 36		/*	Kernel(3x3), it is 9 words, so that is 36 bytes	*/
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

.matrix:
	.word a
	.word b

	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"malloc.c"
	.text
	.align	2
	.global	conv
	.type	conv, %function
conv:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r0, #24
	bl	malloc
	mov	r7, r0
	str	r7, [fp, #-16]

	ldr r0, .matrix			//	Input Matrix
	ldr r2, .matrix + 4		//	Kernel


	//	Each element in output array will do 3x3=9 times of calculations, every
	//	code block implies each calculation

	//	1st Round
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

	str r6, [r7], #4


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

	str r6, [r7], #4

	//	3rd Round
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

	str r6, [r7], #4

	//	4th Round
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

	str r6, [r7], #4

	//	5 Round
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

	str r6, [r7], #4

	//	6 Round
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

	str r6, [r7], #4

	ldr r0, [fp, #-16]

	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	lr
	.size	conv, .-conv
	.align	2
	.global	main
	.type	main, %function

main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]

	//	jump to convolution function, and it will return output matrix r0
	bl	conv

	//	r0 is the return value of conv() store it back to frame pointer
	mov r3, r0
	str r3, [fp, #-16]
	ldr r3, [fp, #-16]
	mov r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	lr
	.size	main, .-main
	.ident	"GCC: (GNU) 4.9.4"
