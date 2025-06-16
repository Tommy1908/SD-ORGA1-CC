main: 
    li a0, 4
    li a1, 87
    jal ra, mayor
    li a2, 87
    bne a0, a2, noFunciona
    funciona: li a1, 1
    j fin
    noFunciona: li a1, 0
fin: j fin


mayor:
    addi sp, sp, -16
    sw ra, (0)sp
    #end prologo
    bgt a0, a1, terminar
    mv a0, a1
    
    #epilogo
    terminar: 
    lw ra, (0)sp
    addi sp, sp, 16
    ret
