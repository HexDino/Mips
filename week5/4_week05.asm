#Laboratory Exercise 5, Home Assignment 3
.data   
string:     .space  100
Message1:   .asciiz "Nhap xau: "
Message2:   .asciiz "Do dai xau la: "
.text   
main:       
get_string: 
    li      $v0,        4
    la      $a0,        Message1
    syscall 

    li      $v0,        54
    la      $a0,        Message1
    la      $a1,        string
    la      $a2,        100
    syscall 
    j       get_length                          # Jump to the get_length label

get_length: 
    la      $a0,        string                  # Load the address of string into register $a0 (starting address of the string)
    add     $t0,        $zero,      $zero       # Initialize $t0 to 0 (counter variable)

check_char: 
    add     $t1,        $a0,        $t0         # Calculate the address of the current character in the string
    lb      $t2,        0($t1)                  # Load the value of the current character into register $t2

    beq     $t2,        $zero,      end_of_str  # If the current character is null, jump to the end_of_str label

    addi    $t0,        $t0,        1           # Increment the counter variable

    j       check_char                          # Jump back to the check_char label

end_of_str: 

end_of_get_length:

print_length:
    li      $v0,        56                      # Load the value 1 into register $v0 (syscall code for printing an integer)
    sub     $t0,        $t0,        1
    # move    $a1,        $t0                     # Move the value of $t0 (length of the string) into register $a0
    la      $a0,        Message2
    add     $a1,        $zero,      $t0
    syscall                                     # Print the length of the string

    li      $v0,        10                      # Load the value 10 into register $v0 (syscall code for program termination)
    syscall 
