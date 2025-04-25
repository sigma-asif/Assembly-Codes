.model small
.stack 100h
.data
.code

main proc
    ;intialize data segment
    mov ax, @data
    mov ds,ax
    
    ;intialize outer loop cnt
    mov cx, 5
    
outer_loop:
    push cx
    
    mov cx, 3; inner loop cnt
    mov dl, '0'
    
inner_loop:
    push dx; save dl 
    
    mov ah, 2
    int 21h ;stil dl value unchanged
    
    mov ah, 2
    mov dl, ' '
    int 21h
    
    pop dx
    inc dl
    
    loop inner_loop 
    
;new line
mov ah, 2
mov dl, 13
int 21h

mov ah, 2
mov dl, 10
int 21h
    
pop cx
loop outer_loop      
    
    
    exit:
    mov ah, 4ch
    int 21h
    
main endp
end main