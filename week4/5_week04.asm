.text
start:
li $t0, 3   
li $t1, 16
li $s2, 1 
loop:
beq $t1, $s2 , EXIT  
sll $t0, $t0, 1  
srl $t1, $t1, 1  
j loop  

EXIT:
sw $t0, result  

.data
result: .word 0  

.end

