# AssemblyConversor

# Conversor de Número para Binário em Assembly

Este é um projeto simples escrito em Assembly, que recebe um número do usuário e o converte para sua representação binária.

## Como executar

1. Compile o código com o assembler de sua escolha (ex: `nasm`):
   ```bash
   nasm -f elf64 -o conversor.o conversor.asm
   ld -s -o conversor conversor.o
   ```

2. Execute o programa:
   ```bash
   ./conversor
   ```

## Como funciona

O programa solicita que o usuário insira um número, converte esse número para binário e imprime o resultado.
