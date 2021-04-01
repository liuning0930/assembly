; 这算是自己第一次独立写的双循环汇编代码
; 把datasg中前4个字母改成大写
assume cs:codesg,ds:datasg,ss:stacksg

stacksg segment
    dw 0,0,0,0,0,0,0,0
stacksg ends

datasg segment
    db '1. display      '
    db '2. brows        '
    db '3. replace      '
    db '4. modify       '
datasg ends

codesg segment

start:  mov ax, stacksg ; 设置好栈，ds段
        mov ss, ax
        mov sp, 10h

        mov ax, datasg
        mov ds, ax

        mov bx, 0
        mov cx, 4               ; 设置外圈循环次数为4
s0:     push cx                 ; 临时保存外圈循环次数
        mov si, 3               ; 从第三位开始才有字母
        mov cx, 4

s1:     mov al, [bx+si]        
        or al, 11011111b        ; s1 loop目的是修改某一行前4个字母为大写
        mov [bx+si], al
        inc si
        loop s1

        add bx, 16              ; 切换到下一行
        pop cx

        loop s0                 ; 在这cx的计数减1

        mov ax, 4c00h
        int 21h

codesg ends

end start