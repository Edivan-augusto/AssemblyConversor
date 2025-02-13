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
    ; Imprime a primeira mensagem no console
    mov rax , 1
    mov rdi , 1
    mov rsi , msg1
    mov rdx , len1
    syscall

    ; Imprime a Segunda mensagem no console
    mov rax , 1
    mov rdi , 1
    mov rsi , msg2
    mov rdx , len2
    syscall

    ; Faz a solicitação do input do usuario e o armazena , eu usei 50 bytes por pura convenção mas poderia ser usado 1 só ( por conseguirmos converter apenas 1 digito )
    mov rax , 0
    mov rdi , 0
    mov rsi , input
    mov rdx , 50
    syscall

    ; Move o digito para o al (menor parte do EAX , e o converte para numero real), e move 2 para o bl para a divisão
    mov al , [input]
    sub al , 48
    mov bl , 2

    ; Limpa o input para armazenar o valor de conversão
    mov byte [input] , 0

    ; Move 0 para o rsi que sera usado como controle no loop
    mov rsi , 0
    
    
to_convert:
    ; Aqui é realizado o Loop para conversão , movendo os valores para a variavel input , a cada iteração ele move o endereço para frente entao cada numero fica em 1 byte
    
    div bl
    add ah , 48
    mov byte [input + rsi] , ah
    
    inc rsi
    xor ah , ah
    cmp al , 0
    jne to_convert
    

exit:
    ; Realiza a saida no console da conversão
    mov rax , 1
    mov rdi , 1
    mov rsi , input
    mov rdx , 50
    syscall

    ; Finaliza o programa 
    mov rax , 60
    xor rdi , rdi
    syscall
    
    
