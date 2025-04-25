.model small
.stack size 100h 
.data
.code

main proc 
    mov ax, @data
    mov ds, ax
    
    ; read char
    mov ah, 1; dos funtion to read char
    int 21h
    mov bl, al;    
    
    ;display space
    mov ah, 2
    mov dl,' '
    int 21h
    
    ;display char
    mov ah, 2
    mov dl, bl
    int 21h
    
    
    
    
    ;exit
    mov ah, 4ch
    int 21h
    
end main    