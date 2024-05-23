.data
A: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
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
    add $t2, $t2, $t3    # Add the current element to the sum
    addi $t0, $t0, 4     # Move to the next element of array A
    addi $t1, $t1, -1    # Decrement the size counter
    j loop

end:
    sw $t2, sum      # Store the sum in the sum variable
