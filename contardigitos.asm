  .data
txt_endl:
    .asciiz "\n"
    
    .text
    .globl main

main:    
    li $v0, 5
    syscall
    move $a0, $v0
    
    beq $v0, 0, end
    
    li $v0, 5
    syscall
    move $a1, $v0
    
    jal func
    
    move $a0, $v1    
    li $v0, 1 
    syscall
  
    la $a0, txt_endl        #pular linha \n
    li $v0, 4 
    syscall
    
    li $v1, 0
    j main

end:
    ori $v0, $zero, 10
    syscall
    
func:
    # salvar contexto
    addi $sp, $sp, -12
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $ra, 8($sp)
    
    #funcao principal com recursao
    li $s0, 0
    add $s0, $s0, 10
    div $a0, $s0
    mfhi $s1
    mflo $a0
    seq $s0, $a1, $s1
    add $v1, $v1, $s0
    ble $a0, 0, func_parada1
    jal func
        
    # restaurar contexto
    lw $s0, 0($sp)
    lw $s1, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    
    # retornar
    jr $ra 
    
func_parada1:
    ori $v1, 0
    jr $ra