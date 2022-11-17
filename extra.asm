beq $s3,$s4,L1 # vá para L1 se i = j
add $s0,$s1,$s2 # f = g + h, executado se i != j
L1: sub $s0,$s0,$s3 # f = f – i, executado se i = j


slt $t0,$so,$s1 # $t0 é setado se $s0 < $s1
bne $t0,$zero,Less # vá para Less, se $t0 != 0 , ou seja a<b