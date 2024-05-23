.data   
prompt:     .asciiz "The sum of "
prompt2:    .asciiz " and "
prompt3:    .asciiz " is "

.text   
main:
    add    $s0,    $zero,      5
    add    $s1,    $zero,      7       
    # Prompt user for input
    li      $v0,    4
    la      $a0,    prompt
    syscall 

    # Print the value of $s0
    li      $v0,    1
    move    $a0,    $s0
    syscall 

    # Print the first part of the prompt
    li      $v0,    4
    la      $a0,    prompt2
    syscall 

    # Print the value of $s1
    li      $v0,    1
    move    $a0,    $s1
    syscall 

    # Print the second part of the prompt
    li      $v0,    4
    la      $a0,    prompt3
    syscall 

    # Calculate the sum of $s0 and $s1
    add     $t0,    $s0,        $s1

    # Print the result
    li      $v0,    1
    move    $a0,    $t0
    syscall 

    # Exit the program
    li      $v0,    10
    syscall 

