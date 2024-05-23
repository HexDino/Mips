# Insertion Sort
.data   
A:      .word   5, 2, 3, 1, 4
Aend:   .word   

.text   
    la      $a0,    A
    addi    $t0,    $0,         13                      # N
    addi    $t1,    $0,         0                       # i = 0

Loop1:  
    slt     $t2,    $t1,        $t0                     #Check i < N
    bne     $t2,    1,          End_loop1
    nop     
    addi    $t3,    $t0,        -1                      # j = N - 1

Loop2:  
    slt     $t4,    $t1,        $t3                     #Check j > i
    bne     $t4,    1,          end_loop2
    nop     
    sll     $t3,    $t3,        2
    add     $a1,    $a0,        $t3                  
    lw      $s0,    0($a1)                              # = arr[j]
    lw      $s1,    -4($a1)                             # = arr[j-1]

    slt     $t5,    $s0,        $s1                
    bne     $t5,    1,          if_loop2
    nop     
    sw      $s0,    -4($a1)
    sw      $s1,    0($a1)
    srl     $t3,    $t3,        2
    addi    $t3,    $t3,        -1                      # j--
    j       Loop2
    nop     

end_loop2:

    addi    $t1,    $t1,        1                       # i++
    j       Loop1
    nop     

if_loop2:
    srl     $t3,    $t3,        2
    addi    $t3,    $t3,        -1                      # j--
    j       Loop2
    nop     

End_loop1:

    lw      $ra,        0($sp)              # Restore the return address from the stack
    addi    $sp,        $sp,        4       # Deallocate the space on the stack
    jr      $ra                             # Return from the procedure

