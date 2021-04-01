assume cs:code

code segment
    mov bx, 0
    mov cx, 12

s:  mov ax, 0ffffh
    mov ds, ax
    mov dl, [bx]  ; [bx]内容存放在dl

    mov ax, 0020h
    mov ds, ax
    mov [bx], dl  ; dl内容存在dl偏移地址

    inc bx
    loop s

    
