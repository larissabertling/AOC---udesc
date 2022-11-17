    .data
txt_endl:
    .asciiz "\n"
    
    .text
    .globl main

main:
    li $v0, 5
    syscall
    move $a0, $v0
    
    li $v0, 0
 
    jal sum
    
    move $a0, $v0    
    li $v0, 1 
    syscall
    
    la $a0, txt_endl
    li $v0, 4 
    syscall
    
end:
    ori $v0, $zero, 10
    syscall
    
sum:
    beq $a0, 0, sum_parada
    
    # salvar contexto
    addi $sp, $sp, -8
    sw $s0, 0($sp)
    sw $ra, 4($sp)
    
    move $s0, $a0
    addi $a0, $a0, -1
    jal sum
    add $v0, $v0, $s0
    
    # restaurar contexto
    lw $s0, 0($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    
    # retornar
    jr $ra 
    
sum_parada:
    ori $v0, 0
    jr $ra