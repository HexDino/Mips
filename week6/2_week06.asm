.data   
A:      .word   7, -2, 5, 1, 5, 6, 7, 3, 6, 8, 8, 59, 5
Aend:   .word   
.text   
main:   
    # Initialize data
    la      $a0,        A                       #$a0 = Address(A[0])
    la      $a1,        Aend
    addi    $a1,        $a1,    -4                      #$a1 = Address(A[n-1])
    
    # Call the sort procedure
    j       sort

after_sort:    
    # Exit the program
    li      $v0,        10                   #exit
    syscall 

end_main:

sort:   
    # Check if the list has only one element
    beq     $a0,        $a1,    done            #single element list is sorted
    
    # Call the max procedure
    j       max

after_max:    
    # Swap the last element with the maximum value
    lw      $t0,        0($a1)                #load last element into $t0
    sw      $t0,        0($v0)                          #copy last element to max location
    sw      $v1,        0($a1)                          #copy max value to last element
    addi    $a1,        $a1,    -4                      #decrement pointer to last element
    
    # Repeat the sort for the smaller list
    j       sort

done:   
    # Sort is complete, jump to after_sort
    j       after_sort

max:    
    # Initialize max pointer and max value
    addi    $v0,        $a0,    0                       #init max pointer to first element
    lw      $v1,        0($v0)                          #init max value to first value
    addi    $t0,        $a0,    0                       #init next pointer to first

loop:   
    # Check if next=last, if yes, return
    beq     $t0,        $a1,    ret                     #if next=last, return
    
    # Advance to the next element
    addi    $t0,        $t0,    4                       #advance to next element
    lw      $t1,        0($t0)                          #load next element into $t1
    
    # Check if next < max
    slt     $t2,        $t1,    $v1                     #(next)<(max) ?
    bne     $t2,        $zero,  loop                    #if (next)<(max), repeat
    
    # Update max pointer and max value
    addi    $v0,        $t0,    0                       #next element is new max element
    addi    $v1,        $t1,    0                       #next value is new max value
    
    # Repeat the loop
    j       loop

ret:    
    # Return to after_max
    j       after_max
