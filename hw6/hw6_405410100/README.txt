1 . How i wrote my code?

I learned how to use loop in this project, although i didn't use loop to do

convolution, but in this project, i have to use different size of input, so i

can no longer use my old method, in my main function, i can set my input matrix

size by modifying row and col, and then set up kernel matrix, in the end, i will

call conv(), and it will return an (int *) which is output matrix.

In conv(), i catch the four parameters, put it into r0~r3 registers, and malloc

the size of (row*col) for output matrix, and start to do the loops, i have four

loops to do the convolution, first denotes row of input, second denotes column

of input matrix, third denotes the row of kernel, fourth denotes the column of

kernel, I have eight branches in the conv() function because each time we enter

a loop we have to do the compare instruction, the details will be in the 

program comments.

2 . How to change input matrix size?

We can change our input matrix size by modifying the row and col

variable in main function.

3 . How to compile?

I will put MakeFile in this folder, so just simply run $make, and it will

generate hw6.exe

4 . How to run?

$arm-none-eabi-insight to debug the program, if don't want to run through the

initializing process, just set a breakpoint at line 28 and step in to see how

conv() works.
