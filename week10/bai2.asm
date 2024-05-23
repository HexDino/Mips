.eqv MONITOR_SCREEN 0x10010000 #Dia chi bat dau cua bo nho man hinh
.eqv RED 0x00FF0000 #Cac gia tri mau thuong su dung
.text
li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
li $t1, 1       
li $t2, 16     
loop11:
    li $t0, RED         
    sw $t0, 0($k0)      

    addi $k0, $k0, 64   

    addi $t1, $t1, 1    
    ble $t1, $t2, loop11  
 nop

li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
li $t1, 1       
li $t2, 16     

loop12:
    li $t0, RED         
    sw $t0, 4($k0)      

    addi $k0, $k0, 64   

    addi $t1, $t1, 1    
    ble $t1, $t2, loop12  
 nop

li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
li $t1, 1       
li $t2, 16     

loop13:
    li $t0, RED         
    sw $t0, 8($k0)      

    addi $k0, $k0, 64   

    addi $t1, $t1, 1    
    ble $t1, $t2, loop13 
 nop

li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
li $t1, 1       
li $t2, 16     

loop21:
    li $t0, RED         
    sw $t0, 60($k0)      

    addi $k0, $k0, 64   

    addi $t1, $t1, 1    
    ble $t1, $t2, loop21  
 nop

li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
li $t1, 1       
li $t2, 16     

loop22:
    li $t0, RED         
    sw $t0, 56($k0)      

    addi $k0, $k0, 64   

    addi $t1, $t1, 1    
    ble $t1, $t2, loop22 
 nop

li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
li $t1, 1       
li $t2, 16     

loop23:
    li $t0, RED         
    sw $t0, 52($k0)      

    addi $k0, $k0, 64   

    addi $t1, $t1, 1    
    ble $t1, $t2, loop23  
 nop

li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
li $t1, 1       
li $t2, 16     

loop31:
    li $t0, RED         
    sw $t0, 512($k0)      

    addi $k0, $k0, 4   

    addi $t1, $t1, 1    
    ble $t1, $t2, loop31 
 nop

li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
li $t1, 1       
li $t2, 16     

loop32:
    li $t0, RED         
    sw $t0, 576($k0)      

    addi $k0, $k0, 4   

    addi $t1, $t1, 1    
    ble $t1, $t2, loop32 
 nop

li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
li $t1, 1       
li $t2, 16     

loop33:
    li $t0, RED         
    sw $t0, 448($k0)      

    addi $k0, $k0, 4   

    addi $t1, $t1, 1    
    ble $t1, $t2, loop33 
 nop
