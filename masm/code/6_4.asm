assume cs:code,ds:data,ss:stack

data segment
    dw 0123h, 0456h, 0789h, 0abch, 0defh, 0fedh, 0cbah, 0987h ; dw: 定义字型数据
data ends

stack segment
    dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 用dw定义16个字型数据，在程序加载后，
                                                      ;将取得16个字的内存空间，存放这16个数据。在后面可以用作栈来使用
stack ends

code segment
    start:  mov ax, stack
            mov ss, ax
            mov sp, 20h

            mov ax, data
            mov ds, ax

            mov bx, 0

            mov cx, 8
    s:      push [bx], 8
            add bx, 2
            loop s

            mov bx, 0

            mov cx, 8
    s0:     pop [bx]
            add bx, 2
            loop s0

            mov ax, 4c00h
            int 21h
code ends

end start