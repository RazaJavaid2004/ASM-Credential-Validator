.model small
.stack 100h

.data
    password     db 'PASS'         
    passLen      dw 4              
    userInput    db 10 dup(?)
    
    msgPrompt    db 'Enter Password: $'
    msgAccess    db 0Dh, 0Ah, 'Access Granted! $' 
    msgDenied    db 0Dh, 0Ah, 'Access Denied! $'
    
    inputCount   dw 0               ; Variable to track how many chars user typed

.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax          

    lea dx, msgPrompt
    mov ah, 09h
    int 21h

    lea bx, userInput
    mov cx, 0                
    
input_loop:
    mov ah, 07h                
    int 21h
    
    cmp al, 0Dh                 ; Check if Enter key pressed
    je check_pass
    
    ; Buffer overflow check (don't allow more than 10 chars)
    cmp cx, 10
    je input_loop               

    mov [bx], al                
    inc bx
    inc cx                      
    
    ; Print Asterisk manually
    push ax                    
    push dx                    
    mov dl, '*'
    mov ah, 02h
    int 21h                 
    pop dx
    pop ax                     
    
    jmp input_loop      
    
check_pass:
    mov inputCount, cx          
    
    ; Compare Lengths
    mov ax, passLen
    cmp inputCount, ax          
    jne denied                  

    ; Compare Strings
    lea si, password
    lea di, userInput
    mov cx, passLen            
    repe cmpsb
    je granted
    
denied:
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
end main