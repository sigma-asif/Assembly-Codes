.model small
.stack 100h
.data 

  n dw 12345
  rn dw 0
  multiplier dw 1
  
.code
main proc
      
    mov ax, @data
    mov ds, ax
    
    mov cx, 0
    
    mov ax, n
    call print_num
    
    mov ah,2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    ;revrsing logic
    mov ax, n
    mov bx, 10
    
    digit_extraction:
    xor dx, dx
    
    div bx
    
    push dx
    inc cx
    
    cmp ax, 0
    jne digit_extraction 
    
   
    construct_rn:
    mov bx,multiplier
    pop dx 
    mov ax, dx
    mul bx
    add rn, ax 
    
    ;update multiplier   
    mov ax, multiplier
    mov bx, 10
    mul bx 
    
    mov multiplier, ax
    
    
    loop construct_rn
    
    ;print reverse number
    mov ax, rn
    call print_num
    
    
    
    mov ah, 4ch
    int 21h 
    
print_num proc
    mov bx, 10 ;base = 10
    
    extract_digits:
    
    xor dx, dx
    div bx     ; remainder = dx, ax = ax/bx
    
    push dx
    inc cx
    
    cmp ax,0
    jne extract_digits
    
    
    print_digits: 
    
    
    pop dx
    add dl, '0'
    
    mov ah, 2
    int 21h 
    
    
    loop print_digits  
    
    ret 
    print_num endp
    
       
    
end main        