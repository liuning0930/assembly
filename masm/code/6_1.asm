assume cs:code

code segment
    dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h ; dw: 定义字型数据

start:  mov bx, 0
        mov ax, 0

        mov cx, 8
s:      add ax, cs:[bx]
        add bx, 2
        loop s

        mov ax, 4c00h
        int 21h 
code ends

end start ; end除了高速编译器程序结束外，还可以通知编译器程序的入口在什么地方