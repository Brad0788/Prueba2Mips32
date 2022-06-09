.data
array: .space 20
array2: .space 20
msg: .asciiz "\n Numero: "
.text
.globl main

main:

    li $t0, 0 #i = 0
    la $t1, array #pos = 0

while:
     #imprimir mensaje
    la $a0, msg
    li $v0, 4
    syscall

    #leer entero de consola
    li $v0, 5
    syscall
    move $t2, $v0 #t2 = numero que lei de consola

    #guardar en array
    sw $t2, 0($t1) #arr[pos] = numero que lei de consola

    #incrementar posicion en array
    addi $t1, $t1, 4 # pos+=4
    #incrementar contador
    addi $t0, $t0, 1 # i++
    blt $t0, 5, while

    li $t0, 0
    la $t1, array
    la $t8, array2

while_pares:
    lw $t2, 0($t1)
    
    addi $t1, $t1, 4
    andi $t9, $t2, 1
    addi $t0, $t0, 1
    beq $t9, $zero, insert_par
    blt $t0, 5, while_pares
    li $t0, 0
    la $t1, array
    j while_impares

insert_par:
    sw $t2, 0($t8)
    addi $t8, $t8, 4
    j while_pares 

while_impares:
    lw $t2, 0($t1)
    
    addi $t1, $t1, 4
    andi $t9, $t2, 1
    addi $t0, $t0, 1
    bne $t9, $zero, insert_impar
    blt $t0, 5, while_impares
    li $t0, 0 #i = 0
    la $t1, array2 #pos = 0
    j print_array
    
insert_impar:
    sw $t2, 0($t8)
    addi $t8, $t8, 4
    j while_impares

print_array:


    lw $t2, 0($t1)
    addi $t1, $t1, 4
    addi $t0, $t0, 1
    move $a0, $t2
    li $v0, 1
    syscall
    blt $t0, 5, print_array

    li $v0, 10
    syscall