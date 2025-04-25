.model small
.stack 100h
.data 
   n db 9 ; n = 6
   i db 1 ;
   res dw ? ; since ax = al*bl or whatever
   star db ' * $'
   eq db ' = $'
   newline db 13,10,'$'
   
.code

main proc
    ;intialize data segement
    mov ax, @data
    mov ds, ax; 
    
mul_table:
    ;print n;
    mov al, n   ;here al cz n 8 bytes
    xor ah, ah ; clear ah
    call print_number 
    
    ;print "*"
    mov ah, 9
    lea dx, star
    int 21h 
    
    ;print i
    mov al, i
    xor ah, ah ; clear ah
    call print_number
    
    ;print "="
    mov ah, 9
    lea dx, eq
    int 21h
    
    ;multiply n*i
    mov al, n
    mov bl, i
    xor ah, ah ; claer ah
    mul bl
    mov res, ax
    
    ;print result
    mov ax, res ; here ax cz res 16 bytes
    call print_number  
    
    ;newline
    mov ah, 9
    lea dx, newline
    int 21h
    
    ;increment i
    inc i
    cmp i, 10
    jbe mul_table
    
    
    
    
    
    exit:
    mov ax, 4ch
    int 21h
    
main endp

print_number proc near
    push ax
    push bx
    push cx
    push dx
    
    mov cx, 0 ; count digits
    mov bx, 10 ; base 10
   
divide_loop:
    xor dx, dx;
    div bx    ; ax = quotient, dx = remainder
    push dx 
    inc cx 
    test ax, ax ; check ax = 0, zf = 1
    jne divide_loop
    
print_loop:
    pop dx
    add dl, '0' ; convert dl into char
    mov ah, 2
    int 21h
    loop print_loop; until cx = 0  

done:
    pop dx
    pop cx
    pop bx
    pop ax
  
       
ret
print_number endp    
     
    

end main