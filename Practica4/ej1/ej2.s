main:
    li a0, 4
    li a1, 6
    jal ra, suma
    li a2, 10
    bne a0, a2, noFunciona
    
funciona: 
    li a1, 1
    j fin
noFunciona:
    li a1, 0
    
fin: j fin


suma:
    addi sp, sp, -16
    sw ra, (0)sp
    #end prologo
    
    add a0, a0, a1
    
    #epilogo
    lw ra, (0)sp
    addi sp, sp, 16
    ret
    