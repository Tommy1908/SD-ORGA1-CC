main:
    li s1, 2024
    mv a0, s1
    jal ra, inverso
    add a0, s1, a0
    bnez a0, noFunciona

funciona: 
    li a1, 1
    j fin
noFunciona:
    li a1, 0
    
fin: j fin
    
    
#No hacia falta el uso de s1 pero si se usa se tiene que guardar
inverso:
    addi sp, sp, 16
    sw ra, (0)sp
    sw s1, (4)sp
    #enf prologo
    
    not s1, a0
    addi a0, s1, 1
    
    #epilogo
    lw ra, (0)sp
    lw s1, (4)sp
    addi sp, sp, 16
    ret