.model small 
.stack size 100h
.data 
   star db '*'
.code 

main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 5 ;total rows (5)

    mov si, 1 ; current row number     
    
outer_loop:
    mov bx, 5
    sub bx, si ; bx-si = no of space to print, and si = stars
    
inner_loop:
   
    cmp bx, 0
    je print_star ; else print spaces here
    
    mov dl, ' '
    mov ah, 2
    int 21h 
    
    dec bx
    jmp inner_loop
print_star:
   mov bx, si    
    
print_star_loop:
    cmp bx, 0
    je loop_condition   
    
    mov ah, 2 
    mov dl, '*'
    dec bx
    int 21h 
    jmp print_star_loop
 
loop_condition:
    inc si
    
    ;new line
    mov ah,2
    mov dl, 13
    int 21h
    
    mov dl, 10
    int 21h
    
    loop outer_loop ; cx != 0      
    
    mov ah, 4ch
    int 21h
    
main endp
end main