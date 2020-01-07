1、 我如何撰寫程式？

    我的程式全部使用 _mm_add_ps()來做加法，在main()裡頭，我先做ParseInput，把

    data.txt的資料吃進來，擺進Matrix，這是一個二維的float陣列，做完之後就宣告

    做SIMD加法所需要用上的變數，(__m128)，宣告完之後就可以開始做一連串的加法了，

    方法就是，三層迴圈，最外層指的是回合數，因為要從第一個開始，個別和別人做相加，

    第二層，是控制row的迴圈，第三層就是一個一個做加法了，然後因為SIMD指令是一次

    抓四個數去做加法，做完再丟回來，所以丟回來的我用c去接起來，第三層回圈的

    upper bound是col/4，最後再把這個c當中的每一個element加起來，擺進output.txt

    這樣就完成了，然而，hw7.c只是簡化版的hw7simd.c，做法差不多都一樣，差就差在

    做加法的第三層回圈，upper bound就變成col了，因為要一個一個去加。

2、 如何編譯？

    我會放MakeFile，所以只要打入$make就會產生hw7.exe跟hw7simd.exe，兩者執行完之後

    會各自產生output file，檔名不一樣，可以不用擔心，若要測試不同的測資大小，
    
    就更改一下gen_file.c當中所定義的ROW, COL，更改完執行它，確認data.txt是想要

    測試的大小之後，就可以開始測試hw7.exe, hw7simd.exe，直接執行就好，不用做修改。

3、 如何執行？

    打入$./hw7.exe來執行沒有simd指令的程式。

    打入$./hw7simd.exe來執行有simd指令的程式。

4、 在哪個機器上執行成功？

    Host :

        Device -> MacBook Pro (13-inch, 2017, Two Thunderbolt 3 ports)

        韌體   -> 10.14.1 (macOS Mojave)

        處理器 -> 2.3 GHz Intel Core i5

    虛擬機：

        VMware Fusion

        版本 : Professional Version 8.5.10 (7527438)

        作業系統：Ubuntu 16.04

5、 xmmintrin.h的來源
    
    https://github.com/gcc-mirror/gcc/blob/master/gcc/config/i386/xmmintrin.h
