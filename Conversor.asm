section .bss
    
    input resb 50 ; Reservando 50 bytes para entrada do usuario
    
section .data

    msg1 db "--------Conversor Assembly--------", 10, 0 ; Definindo a variavel que guardara o Titulo do programa e quebra de linha
    len1 equ $ - msg1 ; Usando o mecanismo do assembly para mensurar automaticamente o valor da variavel
    
    msg2 db "Digite seu numero: ", 10, 0 ; Definindo a variavel e quebra de linha
    len2 equ $ - msg2 ; Usando o mecanismo do assembly para mensurar automaticamente o valor da variavel

    
section .text
    global _start

_start:

    mov rax , 1
    mov rdi , 1
    mov rsi , msg1
    mov rdx , len1
    syscall

    mov rax , 1
    mov rdi , 1
    mov rsi , msg2
    mov rdx , len2
    syscall

    mov rax , 0
    mov rdi , 0
    mov rsi , input
    mov rdx , 50
    syscall

    mov al , [input]
    sub al , 48
    
    mov bl , 2
    
    mov byte [input] , 0

    mov rsi , 0
    mov byte [input + rsi] , ah
    
    
to_convert:

    
    div bl
    
    add ah , 48
    mov byte [input + rsi] , ah
    
    inc rsi
    xor ah , ah
    cmp al , 0
    jne to_convert
    

exit:

    mov rax , 1
    mov rdi , 1
    mov rsi , input
    mov rdx , 50
    syscall

    
    mov rax , 60
    xor rdi , rdi
    syscall
    
    
