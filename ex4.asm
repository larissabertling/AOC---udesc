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
	
	la $a0, text_endl
	li $v0, 4
	syscall
	
	li $v1, 0
	j main
	
end:
	ori $v0, $zero, 10
	syscall
	
func:
	addi $sp, $sp, -12
	
	
