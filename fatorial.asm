    .data
texto:
    .asciiz "\n"


    .text
    .globl main
    
main:
    li $v0, 5 # code ler int
    syscall
    move $s1, $v0 # move o conteúdo de v0 para s1
    move $s2, $s1
    li $s0, 1 # s0 = 1
    
while:
    #mul $s0, $s0, $s1 # s0 = s0 * s1
    mult $s0, $s1
    mflo $s0
    subi $s1, $s1, 1
    bnez $s1, while # while s1 != 0
    
    move $a0, $s0
    li $v0, 1
    syscall
    
    la $a0, texto
    li $v0, 4
    syscall
    
end:    
    li $v0, 10
    syscall