.data   
input:  .space  21                          # Buffer to store the input string (maximum 20 characters + null terminator)
.text   
        .globl  main
main:   
    # Read input string
    li      $v0,            8
    la      $a0,            input
    li      $a1,            21
    syscall 

    # Find the length of the input string
    la      $t0,            input           # Load the address of the input string into $t0
    li      $t1,            0               # Initialize counter $t1 to 0

find_length:
    lb      $t2,            0($t0)          # Load a byte from the address in $t0 into $t2
    beqz    $t2,            reverse         # If $t2 is 0 (null terminator), go to reverse
    addiu   $t0,            $t0,        1   # Increment the address in $t0
    addiu   $t1,            $t1,        1   # Increment the counter $t1
    j       find_length                     # Jump back to the start of the loop

reverse:
    # Adjust $t0 to point to the last character of the string
    addi    $t0,            $t0,        -1

print_reverse:
    # Check if we have printed all characters
    li      $t3,            0
    blez    $t1,            exit            # If $t1 is less than or equal to 0, exit

    # Load and print the character
    lb      $a0,            0($t0)          # Load the character into $a0
    li      $v0,            11              # Prepare to print the character
    syscall 

    # Move to the previous character and decrement the counter
    addi    $t0,            $t0,        -1  # Move to the previous character
    addi    $t1,            $t1,        -1  # Decrement the counter
    j       print_reverse                   # Jump back to print the next character

exit:   
    li      $v0,            10              # Exit program
    syscall 
