1、依照Spec 裡面給的template，把模板用vim打上去，然後再利用mov指令把所要求的值
   放進register，r1~r4，然後再用mul把r1和r2乘起來然後放進r5，再來就是一樣用mul
   把r3和r4乘起來放進r6，然後用add指令把r5和r6加起來放進r0，然後就結束。

2、編譯程式方法：
   $arm-none-eabi-gcc hw2.s -g -o hw2.exe

3、執行方法：
   $arm-none-eabi-insight
   接下來會跳出insight的GUI，把hw2.exe選取，然後把register的監控視窗打開，把程
   式跑起來之後一行一行執行，同時監控register的值是否是正確。

4、執行環境：
   host：MacBook Pro (13-inch, 2017, Two Thunderbolt 3 ports), Firmware: Mojave 10.14.1
   VMware：Version 8.5.10
   OS：Ubuntu 16.04

