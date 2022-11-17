maior:
	move $v1, $a1
	bgt $a0, $a1, a0
	move $v1, $a0
	bgt $a2, $a1, a2	#a2>a1>a0
	move $v0, $a1
	blt $v1, $a2, ok
ok:
	move $v1, $a2
	jr $ra
	
a0:
	bgt $a2, $a0, a2
	move $v0, $a0
	blt $v1, $a2, ok
ok:
	move $v1, $a2
	jr $ra

a2:
	move $v0, $a2
	jr $ra
	
	