assume cs:code

code segment

    mov ax, 200h
    mov ds, ax

; loop 代码
    mov bx, 0h 
    mov cx, 23H
s:  mov [bx], bx
    inc bx 
    loop s

    mov ax, 4c00H
    int 21H

code ends

end