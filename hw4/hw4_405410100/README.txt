1 . How i wrote my code?

I followed the convolution rule to compute each value one-by-one, i didn't use

any loop or if-else statement, total we have 6 rounds, each round we have to 

move the kernel and the input so that input lines up with kernel perfectly,

by doing the same thing, we can get the result and store it back to r1 register.

2 . How to compile?

Because i made a MakeFile, so just simply type in $make and it will generate

hw4.exe, or type in $arm-none-eabi-gcc -g hw4.s -O0 -o hw4.exe, it will do the

same thing

3 . How to run?

type in $arm-none-eabi-insight to run the code and start to debug, until the

end, check out the r1 register, my result will be stored into r1 register sequentialy.
