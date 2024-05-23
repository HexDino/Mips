            .eqv    KEY_CODE, 0xFFFF0004        # ASCII code from keyboard, 1 byte
            .eqv    KEY_READY, 0xFFFF0000       # =1 if has a new keycode ?
            .eqv    DISPLAY_CODE, 0xFFFF000C    # ASCII code to show, 1 byte
            .eqv    DISPLAY_READY, 0xFFFF0008   # =1 if the display has already to do
.data   
exit_seq:   .byte   'e', 'x', 'i', 't'          # Sequence to check for
seq_index:  .word   0                           # Index for sequence checking
.text   
    li      $k0,    KEY_CODE
    li      $k1,    KEY_READY

    li      $s0,    DISPLAY_CODE
    li      $s1,    DISPLAY_READY
    la      $a3,    exit_seq                    # Load address of exit sequence
    lw      $a2,    seq_index                   # Load current index of sequence

loop:           nop     

WaitForKey:     lw      $t1,    0($k1)          # $t1 = [$k1] = KEY_READY
    nop     
    beq     $t1,    $zero,          WaitForKey  # if $t1 == 0 then Polling
    nop     

ReadKey:        lw      $t0,    0($k0)          # $t0 = [$k0] = KEY_CODE
    nop     

    sw      $t0,    0($s0)                      # Show key regardless of match

    lb      $t3,    0($a3)                      # Load expected char from exit_seq
    bne     $t0,    $t3,            reset_seq   # If not matching, reset sequence
    addi    $a3,    $a3,            1           # Move to next character in sequence
    addi    $a2,    $a2,            1           # Increment sequence index
    li      $t4,    4
    beq     $a2,    $t4,            exit        # If index is 4, exit

    j       loop
    nop     

reset_seq:  
    la      $a3,    exit_seq                    # Reset to start of sequence
    sw      $zero,  seq_index                   # Reset index to 0
    j       loop
    nop     

exit:       
    li      $v0,    10                          # Exit syscall
    syscall 