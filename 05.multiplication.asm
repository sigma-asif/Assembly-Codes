.model small
.stack 100h
.data 
  n1 db 6 
  n2 db 8
  res dw ? ; since ax = result = 16bit
 
 
.code
main proc 
    ;intialize data segment
    mov ax, @data
    mov ds, ax
    
    mov al, n1;
    mov bl, n2;
    xor ah, ah; clear ah = 0 before multiplication
    mul bl ; ax = al* bl 
    mov res, ax;  store result safely

    
    ;display number
    mov ax, res ;reload result to ax since division need ax
    call print_number 
    
    ; Exit program
    mov ah, 4ch
    int 21h
    
main endp

;print_number proc
print_number proc near
    mov cx, 0
    mov bx, 10 ; 10 base
    
divide_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax,ax ;check if ax = 0
    jnz divide_loop
    

print_loop:
    pop dx
    add dl, '0' ; convert it into char
    mov ah, 2   ; print the value in dl
    int 21h
    loop print_loop ; until cx = 0 
    
ret
print_number endp       
        
    
    
end main    