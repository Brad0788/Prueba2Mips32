.data
array: .space 20
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

while_pares:
    

while_impares:

    