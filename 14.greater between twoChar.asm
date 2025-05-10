.model small
.stack 100h
.data
  a db 'enter a: $'
  b db 10,13, 'enter b: $'
  c db 10,13, 'greater is $'

.code
main proc
    ;intiallize data segement
    mov ax, @data
    mov ds,ax;  
    
    ;display first prompt
    mov ah, 9
    lea dx, a
    int 21h
    
    ;read first char
    mov ah, 1
    int 21h
    mov bl, al    ; bl = n1 
    
    ;display 2nd prompt
    mov ah, 9
    lea dx, b
    int 21h
    
    ; read 2nd char 
    mov ah,1
    int 21h      
    mov bh, al;  ; bh = n2
    
    
    ;display greater prompt
    mov ah, 9
    lea dx, c
    int 21h
    
    ; compare bl,bh i.e n1,n2
    cmp bl,bh
    ja L1 ; if bl>bh jmp to Label1
    jb L2 ; otherwise label2 
    
    ;if equal
    mov dl, '='
    mov ah, 2 ;funtion to display char
    int 21h
    jmp exit
    
    L1:
    mov dl,bl ;Display the first input (stored in BL) 
    mov ah,2 ; func to display dl char
    int 21h;
    jmp exit
    
    
    
    
    
    ;display result when bh greater
    L2: 
    mov ah, 2 ; func to display char
    mov dl, bh ; display bh
    int 21h
    jmp exit
    
     
    
    
    
    ;termination of program
    exit:
    mov ah, 4ch
    int 21h    
    
    
    
main endp
end main
