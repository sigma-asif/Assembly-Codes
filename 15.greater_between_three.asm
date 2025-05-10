.model small
.stack 100h
.data
 a db 1
 b db 7 
 c db 5
 
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov al, a
    mov ah, b 
    mov bl, c
    
    cmp al, ah
    ja al_high ; al>ah
    jb ah_high ; ah>al
    
    equal1:
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h
    jmp al_high 
    
    jmp exit
    
    al_high:
    cmp al, bl
    ja print_al
    jb print_bl  
    
    equal:
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h 
    jmp exit
    
    print_al:
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h 
    jmp exit
    
    print_bl:
    add bl, '0'
    mov dl, bl
    mov ah, 2
    int 21h 
    jmp exit
                
    ah_high:
    cmp ah, bl
    ja print_ah
    jb print_bl 
    
    equal_ah_bl:
    add ah, '0'
    mov dl, ah
    mov ah, 2
    int 21h 
    jmp exit
    
    
    print_ah:
    add ah, '0'
    mov dl, ah
    mov ah, 2
    int 21h 
    jmp exit
    
   
    
                
    
    
    
    
    
    
    exit:
    mov ah, 4ch
    int 21h

end main    
