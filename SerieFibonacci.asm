
.data
fib_output: .word 0      # Salida para la secuencia de Fibonacci
newline: .asciiz "\n"    # Cadena para el salto de línea

.text
.globl main

main:
    li $t0, 0             # Inicializa el contador
    li $t1, 10            # Número de Fibonacci a calcular
    li $t2, 0             # Inicializa el primer número de Fibonacci
    li $t3, 1             # Inicializa el segundo número de Fibonacci

loop:
    # Imprime el número de Fibonacci actual
    move $a0, $t2         # Carga el número de Fibonacci a imprimir
    li $v0, 1             # syscall para imprimir entero
    syscall

    # Imprime un salto de línea
    li $v0, 4             # syscall para imprimir cadena
    la $a0, newline       # Carga la dirección de la cadena de salto de línea
    syscall

    # Calcula el siguiente número de Fibonacci
    add $t4, $t2, $t3     # Suma los dos números anteriores
    move $t2, $t3         # Actualiza el primer número anterior
    move $t3, $t4         # Actualiza el segundo número anterior

    addi $t0, $t0, 1      # Incrementa el contador
    bne $t0, $t1, loop    # Repite si no se han calculado todos los números

exit:
    li $v0, 10            # syscall de salida
    syscall
