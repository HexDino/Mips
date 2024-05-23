find_largest_smallest:
    # Save registers on the stack
    addi    $sp,    $sp,                -16
    sw      $s0,    0($sp)
    sw      $s1,    4($sp)
    sw      $s2,    8($sp)
    sw      $ra,    12($sp)

    # Initialize largest and smallest variables
    move    $s3,    $s0                         # Largest element
    move    $s4,    $zero                       # Position of largest element
    move    $s6,    $s0                         # Smallest element
    move    $s7,    $zero                       # Position of smallest element

    # Loop through the list
    li      $t0,    1                           # Counter
    li      $t1,    8                           # Number of elements in the list

loop:
    # Compare current element with largest element
    slt     $t2,    $s0,                $s3
    beqz    $t2,    check_smallest

    # Update largest element and position
    move    $s3,    $s0
    move    $s4,    $t0

check_smallest:
    # Compare current element with smallest element
    slt     $t2,    $s6,                $s0
    beqz    $t2,    increment_counter

    # Update smallest element and position
    move    $s6,    $s0
    move    $s7,    $t0

increment_counter:
    addi    $t0,    $t0,                1
    addi    $s0,    $s0,                4

    # Check if all elements have been processed
    bne     $t0,    $t1,                loop

    # Restore registers from the stack
    lw      $s0,    0($sp)
    lw      $s1,    4($sp)
    lw      $s2,    8($sp)
    lw      $ra,    12($sp)
    addi    $sp,    $sp,                16

    # Return from the procedure
    jr      $ra
