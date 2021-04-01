assume cs:codesg,ds:datasg

datasg segment
    db 'Basic'        ; 转大写
    db 'iNfOrMaTiOn'  ; 转小写
datasg ends

codesg segment
start:  mov ax, datasg
        mov ds, ax
        mov bx, 0 ; ds:[bx] 指向datasg中第一个字段‘B'

        mov cx, 05h
        mov bx, 0
s0:     mov al, [bx]
        and al, 11011111b
        mov [bx], al
        inc bx

        loop s0

        mov cx, 0Bh
        mov bx, 5 ; 指向 iNfOrMaTiOn 第一个字符‘i’
s1:     mov al, [bx] ; ds 可以省略
        or  al, 00100000b
        mov [bx], al
        inc bx

        loop s1

        mov ax, 4c00h
        int 21h

codesg ends

end start

    
