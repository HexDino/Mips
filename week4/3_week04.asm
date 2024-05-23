.data
    result: .asciiz "The absolute value of $s1 is less than or equal to $s0."
    not_result: .asciiz "The absolute value of $s1 is greater than $s0."

.text
    main:
        move $s0, $s1   # Move the value of $s1 to $s0
        bltz $s0, negate   # Branch if $s0 < 0
        j is_less_equal

    negate:
        sub $s0, $zero, $s0   # Negate the value of $s0 #abs $s0

    is_less_equal:
        ble $s1, $s0, print_result   # Branch if $s1 <= $s0
        li $v0, 4
        la $a0, not_result   # Print "The absolute value of $s1 is greater than $s0."
        syscall
        j end

    print_result:
        li $v0, 4
        la $a0, result   # Print "The absolute value of $s1 is less than or equal to $s0."
        syscall

    end:
        li $v0, 10   # Exit the program
        syscall


.data
    result: .asciiz "The absolute value of $s1 is less than or equal to $s0."
    not_result: .asciiz "The absolute value of $s1 is greater than $s0."

.text
    main:
        abs $s0, $s1   # Calculate the absolute value of $s1
        ble $s1, $s0, is_less_equal   # Branch if $s1 <= $s0
        li $v0, 4
        la $a0, not_result   # Print "The absolute value of $s1 is greater than $s0."
        syscall
        j end

    is_less_equal:
        add $s0, $zero, $s1   # Set $s0 to the value of $s1	 #move $s0, $s1
        li $v0, 4
        la $a0, result   # Print "The absolute value of $s1 is less than or equal to $s0."
        syscall

    end:
        li $v0, 10   # Exit the program
        syscall


.data
    result: .asciiz "The absolute value of $s1 is less than or equal to $s0."
    not_result: .asciiz "The absolute value of $s1 is greater than $s0."
    invert_result: .asciiz "$s0 is less than or equal to bit invert ($s1)."

.text
    main:
        abs $s0, $s1   # Calculate the absolute value of $s1
        ble $s1, $s0, is_less_equal   # Branch if $s1 <= $s0
        sub $s1, $zero, $s1   # Negate $s1
        ble $s0, $s1, is_invert_less_equal   # Branch if $s0 <= $s1
        li $v0, 4
        la $a0, not_result   # Print "The absolute value of $s1 is greater than $s0."
        syscall
        j end

    is_less_equal:
        move $s0, $s1   # Move $s1 to $s0
        li $v0, 4
        la $a0, result   # Print "The absolute value of $s1 is less than or equal to $s0."
        syscall
        j end

    is_invert_less_equal:
        li $v0, 4
        la $a0, invert_result   # Print "$s0 is less than or equal to bit invert ($s1)."
        syscall

    end:
        li $v0, 10   # Exit the program
        syscall


.data
    result: .asciiz "The absolute value of $s1 is less than or equal to $s0."
    not_result: .asciiz "The absolute value of $s1 is greater than $s0."
    invert_result: .asciiz "$s0 is less than or equal to bit invert ($s1)."

.text
    main:
        abs $s0, $s1   # Calculate the absolute value of $s1
        slt $t0, $s1, $s0   # Set $t0 to 1 if $s1 < $s0, otherwise set it to 0
        beq $t0, $zero, is_greater   # Branch if $t0 is equal to 0
        not $s1, $s1   # Bit invert $s1
        slt $t1, $s0, $s1   # Set $t1 to 1 if $s0 < $s1, otherwise set it to 0
        beq $t1, $zero, is_invert_greater   # Branch if $t1 is equal to 0
        li $v0, 4
        la $a0, not_result   # Print "The absolute value of $s1 is greater than $s0."
        syscall
        j end

    is_greater:
        move $s0, $s1   # Move $s1 to $s0
        li $v0, 4
        la $a0, result   # Print "The absolute value of $s1 is less than or equal to $s0."
        syscall
        j end

    is_invert_greater:
        li $v0, 4
        la $a0, invert_result   # Print "$s0 is less than or equal to bit invert ($s1)."
        syscall

    end:
        li $v0, 10   # Exit the program
        syscall
