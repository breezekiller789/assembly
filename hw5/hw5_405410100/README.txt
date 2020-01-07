1 . How i wrote my code?

In main function, first we have to do some initialization, and then i call conv()

to do convolution, when it's done, it will return output array, which will be

placed in register r0.

In conv(), i just simply copy my hw4 code, the difference between my hw5 and hw4

is, i call malloc() to allocate a chunck of memory to place my output

2 . How to compile?

I will make a MakeFile, to compile, just simply type in $make and it will generate

hw5.exe.

3 . How to run?

type in $arm-none-eabi-insight to run the code and start debugging, if just want

to see if the program runs correctly, set a breakpoint at line 425 and run it, 

r0 will be the address of output array.
