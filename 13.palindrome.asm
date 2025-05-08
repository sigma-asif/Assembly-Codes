.model small
.stack 100h
.data 
    n dw 12321          ; Change this number to test different cases
    rn dw 0
    multiplier dw 1
    msg_pal db 13,10,'Palindrome!$'
    msg_not_pal db 13,10,'Not a palindrome!$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Print original number
    mov ax, n
    call print_num
    
    ; Print newline
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    
    ; Reversing logic
    mov ax, n
    mov bx, 10
    mov cx, 0           ; Initialize digit counter
    
digit_extraction:
    xor dx, dx          ; Clear DX for division
    div bx              ; AX = quotient, DX = remainder (digit)
    push dx             ; Push digit onto stack
    inc cx              ; Increment digit count
    cmp ax, 0
    jne digit_extraction 
    
    ; Construct reversed number
construct_rn:
    pop dx              ; Get digit from stack
    mov ax, dx          ; Move digit to AX
    mul multiplier      ; AX = digit * multiplier
    add rn, ax          ; Add to reversed number
    
    ; Update multiplier (1, 10, 100, etc.)
    mov ax, multiplier
    mov bx, 10
    mul bx              ; AX = multiplier * 10
    mov multiplier, ax
    
    loop construct_rn
    
    ; Print reversed number
    mov ax, rn
    call print_num
    
    ; Check if palindrome
    mov ax, n
    cmp ax, rn
    je is_palindrome
    
    ; Not a palindrome
    mov ah, 9
    lea dx, msg_not_pal
    int 21h
    jmp exit_program
    
is_palindrome:
    mov ah, 9
    lea dx, msg_pal
    int 21h
    
exit_program:
    mov ah, 4ch
    int 21h 
    
; Procedure to print a number (in AX)
print_num proc
    push bx
    push cx
    mov bx, 10          ; Base = 10
    xor cx, cx          ; Clear digit counter
    
extract_digits:
    xor dx, dx
    div bx              ; DX = digit, AX = quotient
    push dx             ; Push digit
    inc cx              ; Increment digit count
    cmp ax, 0
    jne extract_digits
    
print_digits: 
    pop dx
    add dl, '0'         ; Convert to ASCII
    mov ah, 2           ; Print character
    int 21h 
    loop print_digits
    
    pop cx
    pop bx
    ret 
print_num endp
    
end main