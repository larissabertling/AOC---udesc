	.data
.text
 .globl main
 
 	li $s0, $s1, $s2, $s3, $s4, $s5
 	li $t0, f
 	
 	addi $s0, $s1
 	addi $s2, $s3
 	addi $s4, $s5
 	mul ($s2 + $s3) + 2 * ($s4 + $s5)
 	
