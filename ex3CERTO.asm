maior:
	bgt $a0, $a1, a0maior
	move $v0, $a1
	move $v1, $a0
	j compa3
	
a0maior:
	move $v0, $a0
	move $v1, $a1

compa3:
	bgt $v0, $a2, v0ok
	move $v0, $a2
	jr $ra		#j v1ok

v0ok:
	blt $v1, $a2, v1ok
	move $v1, $a2
	
v1ok: 
	jr $ra