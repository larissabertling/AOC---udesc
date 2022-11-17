    .data
txt1:
    .asciiz "\n"
txt2:
    .asciiz "ERRO"


    .text
    .globl main
    
main:

    li $t0, 1 #somas
    li $t2, -1 #contador
    
while:
    li $v0, 5
    syscall
    move $t1, $v0
    
    add $t0, $t0, $t1
    add $t2, $t2, 1
    bne $t1, -1, while
    
    move $a0, $t0
    li $v0, 1
    syscall
    
    la $a0, txt1
    li $v0, 4
    syscall
    
    bne $t2, 0, noError
    
    la $a0, txt2
    li $v0, 4
    syscall
    j end
    
noError:
    div $t2, $t0, $t2
    move $a0, $t2
    li $v0, 1
    syscall
    
    la $a0, txt1
    li $v0, 4
    syscall
    
end:    
    li $v0, 10
    syscall
