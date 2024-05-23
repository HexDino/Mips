.data   
result: .word   0
.text   
main:   
    # Extract MSB of $s0
    andi    $t0,    $s0,    0x80000000
    srl     $t0,    $t0,    24
    # Clear LSB of $s0
    andi    $t1,    $s0,    0xFFFFFFFE
    move    $s0,    $t1
    # Set LSB of $s0 (bits 7 to 0 are set to 1)
    ori     $t2,    $s0,    0x00000001
    move    $s0,    $t2
    # Clear $s0 ($s0=0, must use logical instructions)
    xor     $s0,    $s0,    $s0

    # Store the result in memory
    sw      $s0,    result

    # Exit the program
    li      $v0,    10
    syscall 
