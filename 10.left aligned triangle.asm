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
    mov bx, si ; bx = how many stars in this row
    
inner_loop:
    mov ah, 2
    mov dl, '*'
    int 21h
    
    dec bx
    cmp bx, 0
    jne inner_loop ; if bx != 0, keep printing
    
    ;print newline
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    inc si ; next row
    loop outer_loop ; decrease cx until cx = 0    
    
    
    mov ah, 4ch
    int 21h
    
main endp
end main