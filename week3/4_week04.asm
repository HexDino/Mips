#Laboratory Exercise 3, Home Assignment 1
start:
addi $s1, $zero, 5 # initialize i to 5
addi $s2, $zero, 3 # initialize j to 3
slt $t0, $s2, $s1 # i < j
bne $t0, $zero, else # branch to else if i < j
addi $t1, $t1,1 # then part: x=x+1
addi $t3, $zero,1 # z=1
j endif # skip “else” part
else: addi $t2, $t2, -1 # begin else part: y=y-1
add $t3, $t3, $t3 # z=2*z
endif:


#Laboratory Exercise 3, Home Assignment 1
start:
addi $s1, $zero, 6 # initialize i to 6
addi $s2, $zero, 6 # initialize j to 6
slt $t0, $s2, $s1 # j < i
bne $t0, $zero, else # branch to else if j < i
addi $t1, $t1,1 # then part: x=x+1
addi $t3, $zero,1 # z=1
j endif # skip “else” part
else: addi $t2, $t2, -1 # begin else part: y=y-1
add $t3, $t3, $t3 # z=2*z
endif:


#Laboratory Exercise 3, Home Assignment 1
start:
addi $s1, $zero, 5 # initialize i to 5
addi $s2, $zero, -6 # initialize j to -6
add $t4, $s1, $s2 # i + j
blez $t4, else # branch to else if i + j <= 0
addi $t1, $t1, 1 # then part: x = x + 1
addi $t3, $zero, 1 # z = 1
j endif # skip "else" part
else: 
addi $t2, $t2, -1 # begin else part: y = y - 1
add $t3, $t3, $t3 # z = 2 * z


#Laboratory Exercise 3, Home Assignment 1
start:
addi $s1, $zero, 3 # initialize i to 3
addi $s2, $zero, 5 # initialize j to 5
addi $s3, $zero, 1 # initialize m to 1
addi $s4, $zero, 2 # initialize n to 2

add $t4, $s1, $s2 # i + j
add $t5, $s3, $s4 # m + n

bgt $t5, $t4, else # branch to else if i + j > m + n
addi $t1, $t1, 1 # then part: x = x + 1
addi $t3, $zero, 1 # z = 1
j endif # skip "else" part
else: 
addi $t2, $t2, -1 # begin else part: y = y - 1
add $t3, $t3, $t3 # z = 2 * z
endif:
