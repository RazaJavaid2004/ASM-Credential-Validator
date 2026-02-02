.model small
.stack 100h

.data
    password   db 'PASS', 0
    userInput  db 10 dup(?)
    
    msgPrompt  db 'Enter Password: $'
    msgAccess  db 'Access Granted! $'
    msgDenied  db 'Access Denied! $'

.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax          

    lea dx, msgPrompt
    mov ah, 09h
    int 21h

    lea bx, userInput
    
input_loop:
    mov ah, 01h
    int 21h
    
    cmp al, 0Dh
    je check_pass
    
    mov [bx], al
    inc bx
    jmp input_loop    
    
check_pass:
    call newLine
    
    lea si, password
    lea di, userInput
    mov cx, 4

    repe cmpsb
    
    je granted
    
    lea dx, msgDenied
    mov ah, 09h
    int 21h
    jmp exit

granted:
    lea dx, msgAccess
    mov ah, 09h
    int 21h

exit:
    mov ah, 4Ch
    int 21h
    
main endp

newLine proc
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    int 21h
    ret
    
newLine endp

end main