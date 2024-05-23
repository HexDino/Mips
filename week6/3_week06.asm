# Bubble Sort Procedure
.data
array:  .word       5, 3, 8, 4, 2, 1, 9, 7, 6, 0
size:   .word       10
.text
.globl main
main:
    la      $a0,        array               # Load array address
    lw      $a1,        size                # Load array size
    jal     bubble_sort                     # Call bubble_sort procedure

    li      $v0,        10                  # Exit program
    syscall
    
bubble_sort:
    addi    $sp,        $sp,        -12     # Allocate space for temporary variables
    sw      $ra,        0($sp)              # Save return address
    sw      $s0,        4($sp)              # Save $s0
    sw      $s1,        8($sp)              # Save $s1

    move    $s0,        $a0                 # Move array address to $s0
    move    $s1,        $a1                 # Move array size to $s1

    li      $t0,        1                   # Set flag to 1 (true)
    li      $t1,        0                   # Initialize counter to 0

loop:
    beqz    $t0,        end                 # If flag is 0, exit loop
    li      $t0,        0                   # Reset flag to 0 (false)
    li      $t1,        1                   # Reset counter to 1

inner_loop:
    blt     $t1,        $s1,        compare # If counter < size, go to compare
    j       loop                            # Otherwise, go back to outer loop

compare:
    sll     $t2,        $t1,        2       # Multiply counter by 4 to get offset
    add     $t2,        $s0,        $t2     # Calculate address of current element
    lw      $t3,        0($t2)              # Load current element
    lw      $t4,        -4($t2)             # Load previous element

    ble     $t3,        $t4,        no_swap # If current <= previous, go to no_swap

    sw      $t4,        0($t2)              # Swap current and previous elements
    sw      $t3,        -4($t2)

    li      $t0,        1                   # Set flag to 1 (true)

no_swap:
    addi    $t1,        $t1,        1       # Increment counter
    j       inner_loop                      # Go back to inner loop

end:
    lw      $ra,        0($sp)              # Restore return address
    lw      $s0,        4($sp)              # Restore $s0
    lw      $s1,        8($sp)              # Restore $s1
    addi    $sp,        $sp,        12      # Deallocate space for temporary variables
    jr      $ra                             # Return
