.model small
.stack 100h
.data 
  a db 'enter a: $'
  b db 10, 13, 'enter b: $'
  c db 10,13, 'sum: $'  
  num1   db ?
  num2   db ?
  result db ?
.code


main proc 
    ;intialize data segment
    mov ax, @data
    mov ds, ax
    
    ;display first prompt
    mov ah, 9
    lea dx, a;
    int 21h 
    
    ;input num
    mov ah, 1;  
    int 21h;
    sub al, '0';
    mov num1, al; 
    
    ;display second prompt
    mov ah, 9
    lea dx, b;
    int 21h 
    
    ;input num
    mov ah, 1;  
    int 21h;
    sub al, '0';
    mov num2, al; 
    
    ; addition
    mov al, num1
    add al, num2
    mov result, al
    
    
    ;display sum prompt
    mov ah, 9
    lea dx, c;
    int 21h 
           
    ; display result char
    add result, '0' ; convert back to ascii or char
    mov ah, 2
    mov dl, result;
    int 21h       
   
    
    
main endp
end main