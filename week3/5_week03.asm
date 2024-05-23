.data
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
size: .word 10
sum: .word 0

.text
main:
    li $t2, 0         # Initialize the sum to 0
    li $t1, 0         # Initialize the counter i to 0

loop:
    lw $t0, size      # Load the size of array A into $t0
    slt $t4, $t1, $t0   # Check if i < size
    beq $t4, $zero, end   # If i >= size, exit the loop
    lw $t3, A($t1)        # Load the current element of array A into $t3
    add $t2, $t2, $t3    # Add the current element to the sum
    addi $t1, $t1, 4     # Increment the counter i by 1
    j loop

end:
    sw $t2, sum      # Store the sum in the sum variable



#Laboratory 3, Home Assigment 2
.data
    n: .word 3
    step: .word 1
    A: .word 1,9,5  #Load array
.text
    #Load n, step, starting address A[i]
    la $t7, n
    la $t8, step
    lw $s3, 0($t7)
    lw $s4, 0($t8)
    la $s2, A
 
    addi $s5, $zero, 0  # sum = 0
    addi $s1, $zero, 0  # i = 0

    loop:
    slt $t2, $s3, $s1   # $t2 = n < i ? 1 : 0
    beq $t2, 1, endloop # i <= n
    add $t1, $s1, $s1   # $t1 = 2 * $s1
    add $t1, $t1, $t1   # $t1 = 4 * $s1 - 4 byte word
    add $t1, $t1, $s2   # $t1 store the address of A[i]
    lw $t0, 0($t1)      # load value of A[i] in $t0 
    add $s5, $s5, $t0   # sum = sum + A[i]
    add $s1, $s1, $s4   # i = i + step
    j loop          # goto loop
    
    endloop:


.data
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, -1000
size: .word 10
sum: .word 0

.text
main:
    la $t0, A         # Load the address of array A into $t0
    lw $t1, size      # Load the size of array A into $t1
    li $t2, 0         # Initialize the sum to 0

loop:
    lw $t3, 0($t0)        # Load the current element of array A into $t3
    add $t2, $t2, $t3    # Add the current element to the sum
    addi $t0, $t0, 4     # Move to the next element of array A
    bltz $t3, end        # If the current element is negative, exit the loop
    j loop

end:
    sw $t2, sum      # Store the sum in memory


.data
A: .word 1, 2, 3, 4, 5, 0, 7, 8, 9, 10
size: .word 10
sum: .word 0

.text
main:
    la $t0, A         # Load the address of array A into $t0
    lw $t1, size      # Load the size of array A into $t1
    li $t2, 0         # Initialize the sum to 0

loop:
    beq $t1, $zero, end   # If size is 0, exit the loop
    lw $t3, 0($t0)        # Load the current element of array A into $t3
    beq $t3, $zero, end   # If A[i] == 0, exit the loop
    add $t2, $t2, $t3    # Add the current element to the sum
    addi $t0, $t0, 4     # Move to the next element of array A
    addi $t1, $t1, -1    # Decrement the size counter
    j loop

end:
    sw $t2, sum      # Store the sum in the sum variable
