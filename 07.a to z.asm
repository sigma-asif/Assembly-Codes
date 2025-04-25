.model small
.stack 100h
.data
  msg db 'print a to z: $'
  newline db 13,10,'$'
  
.code
main proc
    ;intialize data segment
    mov ax, @data
    mov ds, ax;
    
    
    ;display prompt msg
    mov ah, 9
    lea dx, msg
    int 21h 
    
    ;display newline
    mov ah, 9
    lea dx, newline
    int 21h  
    
    
    ;intialize cnt & starting char
    mov cx, 26 
    mov dl, 'a'
    
print_loop:
    ;display char
    mov ah, 2
    int 21h 
    
    xor dh,dh ; clear dh
    push dx 
    
    ;display newline
     ; display newline (13,10)
    mov ah, 2
    mov dl, 13
    int 21h
    mov ah, 2
    mov dl, 10
    int 21h 
    
    pop dx
            
    
    
    ;inc dl
    inc dl
    loop print_loop

    exit:
    mov ah, 4ch
    int 21h
    
main endp
end main
     
      
      
         