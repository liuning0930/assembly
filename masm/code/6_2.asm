assume cs:code

code segment
    dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h ; dw: 定义字型数据
    dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 用dw定义16个字型数据，在程序加载后，
                                                      ;将取得16个字的内存空间，存放这16个数据。在后面可以用作栈来使用

start:  mov ax, cs
        mov ss, ax
        mov sp, 30h   ; 设置栈顶为ss:sp执行cs：30h (cs:10 到cs:2f当做栈空间使用, 空栈栈顶加1)

        mov bx, 0
        mov cx, 8
s:      push cs:[bx]
        add bx, 2
        loop s        ; 将0-15单元中的8个字型数据依次入栈

        mov bx, 0
        mov cs, 8
s0:     pop cs:[bx]
        add bx, 2
        loop s0       ; 依次出栈8个字型数据放在0-15单元中

        mov ax, 4c00h
        int 21h 
code ends

end start ; end除了高速编译器程序结束外，还可以通知编译器程序的入口在什么地方