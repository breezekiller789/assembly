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
	.file	"conv.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\012\000"
	.text
	.align	2
	.global	conv
	.type	conv, %function
conv:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48

	//	Get The Input, Address of input, output, and
	//	Number of rows, cols
	str	r0, [fp, #-48]	//	Address of input is in #-48(base is frame pointer)
	str	r1, [fp, #-52]	//	Address of kernel is in #-52(base is frame pointer)
	str	r2, [fp, #-56]	//	Number of row, in #-56
	str	r3, [fp, #-60]	//	Number of col, in #-60

	//	Initialize the cnt variable, it is for counting
	//	the output array index
	mov	r3, #0
	str	r3, [fp, #-32]

	//	load row and col
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-60]

	//	multiply row and col, it's for malloc to
	//	allocate the size of integer and multiplied by
	//	row, col
	mul	r3, r2, r3
	mov	r3, r3, asl #2	//	shift left by 2 cuz it's integer
	mov	r0, r3

	//	do malloc
	bl	malloc

	//	store the malloc result into #-40
	mov	r3, r0
	str	r3, [fp, #-40]

	//	ready to do the convolution, initialize for loop index
	//	i have four for loops
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
	
//	Initializing for the second for loop
.L9:
	mov	r3, #0
	str	r3, [fp, #-20]

//	Initializing for third loop
.L8:
	mov	r3, #0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-24]
	b	.L4

//	Initialize for the fourth loop
.L7:
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-28]
	b	.L5

//	Do the multiply and add, and then store it back to 
//	output array
.L6:
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #2

	//	load input array
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #2
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	rsb	r2, r2, r1
	mov	r2, r2, asl #2
	ldr	r1, [fp, #-52]
	add	r2, r1, r2
	ldr	r1, [r2]
	ldr	r0, [fp, #-28]
	ldr	r2, [fp, #-20]
	rsb	r2, r2, r0
	mov	r2, r2, asl #2
	add	r2, r1, r2
	ldr	r2, [r2]

	//	do multiplication and add it up and store it back
	mul	r3, r2, r3
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-36]

	//	update the index of fourth loop
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]

//	fourth loop
.L5:
	ldr	r3, [fp, #-20]
	add	r2, r3, #3
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bgt	.L6

	//	update the index of third loop
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]

//	third loop
.L4:
	ldr	r3, [fp, #-16]
	add	r2, r3, #3
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L7

	//	load the cnt variable
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #2	//	shift left by 2 cuz it is integer

	//	load the input array
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r2, [fp, #-36]
	str	r2, [r3]
	ldr	r3, [fp, #-32]
	add	r2, r3, #1
	str	r2, [fp, #-32]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r0, .L11
	mov	r1, r3

	//	do printf
	bl	printf

	//	update the index of second loop
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]

//	the condition is like the same with the first for loop, so it would look
//	similar to the L1
.L3:
	ldr	r3, [fp, #-60]
	sub	r2, r3, #2
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L8

	//	update the index of first loop
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]

//	first loop, load row and minus it by 2, it is the base condition of for loop
.L2:
	ldr	r3, [fp, #-56]
	sub	r2, r3, #2
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bgt	.L9
	ldr	r3, [fp, #-40]

	//	In the end, return the output address
	mov	r0, r3
	sub	sp, fp, #12
	ldmia	sp, {fp, sp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LC0
	.size	conv, .-conv
	.ident	"GCC: (GNU) 4.9.4"
