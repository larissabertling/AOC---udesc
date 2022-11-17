    .data
txt_endl:
    .asciiz "\n"
    
    .text
    .globl main

main:    
    li $v0, 5
    syscall
    
    move $a0, $v0
    jal fibonacci

    move $a0, $v1    
    li $v0, 1 # imprimir inteiro
    syscall
    
    la $a0, txt_endl
    li $v0, 4 # imprimir "\n"
    syscall

end:
    ori $v0, $zero, 10
    syscall
    
fibonacci:
    beq $a0, 0, fibonacci_parada1
    beq $a0, 1, fibonacci_parada1
    beq $a0, 2, fibonacci_parada2

    # salvar contexto
    addi $sp, $sp, -12
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $ra, 8($sp)
    
    # codigo principal com recursão
    move $s0, $a0
    add $a0, $a0, -1
    jal fibonacci
    move $s1, $v1
    li $v1, 0
    
    
    add $s0, $s0, -2
    add $a0, $s0, 0
    jal fibonacci
    move $s0, $v1
    add $v1, $s1, $s0
    
    
    
    # restaurar contexto
    lw $s0, 0($sp)
    lw $s1, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    
    jr $ra
    
fibonacci_parada1:
    ori $v1, 1
    jr $ra
    
fibonacci_parada2:
    ori $v1, 2
    jr $ra
