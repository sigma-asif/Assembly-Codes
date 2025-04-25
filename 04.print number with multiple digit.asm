.model small
.stack 100h
.data  
  msg db 'result: $'
  result dw  23   ;Change this to any number you want to
  
.code
main proc 
    ;intialize data segemnt
    mov ax, @data
    mov ds, ax
    
    ;display prompt msg
    mov ah, 9
    lea dx, msg 
    int 21h
    
    ;load number into ax;
    mov ax, result
    call print_number ; Call our subroutine to display the number

    
    
    ;exit
    mov ah, 4ch
    int 21h 

print_number proc
    ; save disits on stack
    mov cx, 0 ; count of digits
    mov bx, 10; source = bx = 10, when call div ax/source
    
    divide_loop:
       xor dx, dx ; clear dx
       div bx ; for word, ax = quotient, dx = remainder
       push dx 
       inc cx
       test ax, ax        ; Check if AX == 0, zf = 1
       jnz divide_loop
       
   
    print_loop:
       pop dx ; get digit
       add dl, '0' ; convert ascii/ char
       mov ah, 2   ; will print char in dl
       int 21h; 
       loop print_loop
           
ret
print_number endp        
        

end main
