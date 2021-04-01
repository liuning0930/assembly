assume cs:code

code segment
    mov ax, 0ffffh
    mov ds, ax
    mov bx, 6

    mov al, [bx]
    mov ah, 0      ; 此时ax的值为0000+ 位于bx地址的内容
    mov dx, 0  
    
    mov cx, 123
s:  add dx, ax
    loop s

    mov ax, 4c00H
    int 21H
code ends

end