    .eqv HEADING, 0xffff8010                 # Integer: An angle between 0 and 359
    .eqv MOVING, 0xffff8050                  # Boolean: whether or not to move
    .eqv LEAVETRACK, 0xffff8020              # Boolean (0 or non-0):
    .eqv WHEREX, 0xffff8030                  # Integer: Current x-location of MarsBot
    .eqv WHEREY, 0xffff8040                  # Integer: Current y-location of MarsBot
.text
main:
    addi    $a0,        $zero,      90
    jal     ROTATE
    jal     GO
sleep1:
    addi    $v0,        $zero,      32      # Keep running by sleeping in 1000 ms
    li      $a0,        3000
    syscall 
Turn1:
    addi    $a0,        $zero,      180
    jal     ROTATE
    jal     GO
Sleep2:
    addi    $v0,        $zero,      32      # Keep running by sleeping in 1000 ms
    li      $a0,        3000
    syscall 
Draw1:
    jal     TRACK
    addi    $v0,        $zero,      32      # Keep running by sleeping in 1000 ms
    li      $a0,        3000
    syscall 
    jal     UNTRACK
Turn2:
    addi    $a0,        $zero,      90
    jal     ROTATE
    jal     GO
Sleep3:
    addi    $v0,        $zero,      32      # Keep running by sleeping in 1000 ms
    li      $a0,        3000
    syscall 
Turn3:
    addi    $a0,        $zero,      360
    jal     ROTATE
    jal     GO
Draw2:
    jal     TRACK
    addi    $v0,        $zero,      32      # Keep running by sleeping in 1000 ms
    li      $a0,        3000
    syscall 
    jal     UNTRACK
Turn4:
    addi    $a0,        $zero,      270
    jal     ROTATE
    jal     GO
Sleep4:
    addi    $v0,        $zero,      32      # Keep running by sleeping in 1000 ms
    li      $a0,        3000
    syscall 
Turn5:
    addi    $a0,        $zero,      180
    jal     ROTATE
    jal     GO
Sleep5:
    addi    $v0,        $zero,      32      # Keep running by sleeping in 1000 ms
    li      $a0,        1500
    syscall 
Turn6:
    addi    $a0,        $zero,      90
    jal     ROTATE
    jal     GO
Draw3:
    jal     TRACK
    addi    $v0,        $zero,      32      # Keep running by sleeping in 1000 ms
    li      $a0,        3000
    syscall 
    jal     UNTRACK
    nop
    jal     STOP
    nop
end_main:

    #-----------------------------------------------------------
    # GO procedure, to start running
    # param[in] none
    #-----------------------------------------------------------
GO:     li      $at,        MOVING          # change MOVING port
    addi    $k0,        $zero,      1       # to logic 1,
    sb      $k0,        0($at)              # to start running
    nop     
    jr      $ra
    nop     
    #-----------------------------------------------------------
    # STOP procedure, to stop running
    # param[in] none
    #-----------------------------------------------------------
STOP:    li      $at,        MOVING         # change MOVING port to 0
    sb      $zero,      0($at)              # to stop
    nop     
    jr      $ra
    nop     
    #-----------------------------------------------------------
    # TRACK procedure, to start drawing line
    # param[in] none
    #-----------------------------------------------------------
TRACK:    li      $at,        LEAVETRACK    # change LEAVETRACK port
    addi    $k0,        $zero,      1       # to logic 1,
    sb      $k0,        0($at)              # to start tracking
    nop     
    jr      $ra
    nop     
    #-----------------------------------------------------------
    # UNTRACK procedure, to stop drawing line
    # param[in] none
    #-----------------------------------------------------------
UNTRACK:    li      $at,        LEAVETRACK  # change LEAVETRACK port to 0
    sb      $zero,      0($at)              # to stop drawing tail
    nop     
    jr      $ra
    nop     
    #-----------------------------------------------------------
    # ROTATE procedure, to rotate the robot
    # param[in] $a0, An angle between 0 and 359
    # 0 : North (up)
    # 90: East (right)
    # 180: South (down)
    # 270: West (left)
    #-----------------------------------------------------------
ROTATE:    li      $at,        HEADING      # change HEADING port
    sw      $a0,        0($at)              # to rotate robot
    nop     
    jr      $ra
    nop     
