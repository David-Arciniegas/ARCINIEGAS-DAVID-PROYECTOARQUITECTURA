.data
fib_output: .word 0      # Salida para la secuencia de Fibonacci
newline: .asciiz "\n"    # Cadena para el salto de línea

.text
.globl main

main:
    li $t0, 10            # Números de Fibonacci a calcular
    li $t1, 0             # Inicializa el primer número de Fibonacci
    li $t2, 1             # Inicializa el segundo número de Fibonacci

loop:
    # Imprime el número de Fibonacci actual
    move $a0, $t1         # Carga el número de Fibonacci a imprimir
    li $v0, 1             # syscall para imprimir entero
    syscall

    # Imprime un salto de línea
    li $v0, 4             # syscall para imprimir cadena
    la $a0, newline       # Carga la dirección de la cadena de salto de línea
    syscall

    # Calcula el siguiente número de Fibonacci
    addu $t3, $t1, $t2    # Suma los dos números anteriores
    move $t1, $t2         # Mueve el segundo número anterior al primer número
    move $t2, $t3         # Mueve el resultado de la suma al segundo número

    addi $t0, $t0, -1     # Decrementa el contador
    bnez $t0, loop        # Repite si no se han calculado todos los números

exit:
    li $v0, 10            # syscall de salida
    syscall
