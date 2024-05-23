.data   
A:  .word   -2, 6, -1, 3, -2

.text   
main:
    # Initialize data for the integer list
    la      $a0,    A
    li      $a1,    5

    # Call the mspfx procedure
    jal     mspfx
    nop     

    # Print the results
    li      $v0,    1               # Print integer
    move    $a0,    $v0             # Move the result to $a0
    syscall 

    # Exit the program
    li      $v0,    10              # Exit program
    syscall 

mspfx:
    # Procedure to explore each element of the integer list using indexing method
    addi    $v0,    $zero,  0       # Initialize length in $v0 to 0
    addi    $v1,    $zero,  0       # Initialize max sum in $v1 to 0
    addi    $t0,    $zero,  0       # Initialize index i in $t0 to 0
    addi    $t1,    $zero,  0       # Initialize running sum in $t1 to 0

loop:
    sll     $t2,    $t0,    2       # Multiply i by 4 to get 4i
    add     $t3,    $t2,    $a0     # Put 4i+A (address of A[i]) in $t3
    lw      $t4,    0($t3)          # Load A[i] from mem(t3) into $t4
    add     $t1,    $t1,    $t4     # Add A[i] to running sum in $t1
    slt     $t5,    $v1,    $t1     # Set $t5 to 1 if max sum < new sum
    bne     $t5,    $zero,  mdfy    # If max sum is less, modify results
    j       test                    # Done?

mdfy:
    addi    $v0,    $t0,    1       # New max-sum prefix has length i+1
    addi    $v1,    $t1,    0       # New max sum is the running sum

test:
    addi    $t0,    $t0,    1       # Advance the index i
    slt     $t5,    $t0,    $a1     # Set $t5 to 1 if i < n
    bne     $t5,    $zero,  loop    # Repeat if i < n
    j       done
    nop     

done:
    jr      $ra                     # Return to the main program
