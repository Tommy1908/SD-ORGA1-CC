main:
    li a0, 1
    li a1, 2
    jal ra, elPrimeroPor4MenosElSegundoDivididoPor2
    li a3, 3
    bne a0, a3, noFunciona #(4*1-2/2) != 3
    li a0, 3
    li a1, 2
    jal ra, elPrimeroPor4MenosElSegundoDivididoPor2
    li a3, 11
    bne a0, a3, noFunciona #(4*3 - 2/2) !=11
    li a0, 3
    li a1, 12
    jal ra, elPrimeroPor4MenosElSegundoDivididoPor2
    li a3, 6
    bne a0, a3, noFunciona #(4*3 - 12/2) != 6

funciona:
    li a1, 1
    j fin
noFunciona:
    li a1, 0

fin: j fin    

elPrimeroPor4MenosElSegundoDivididoPor2:
    addi sp, sp, -16
    sw ra, (0)sp
    slli a2, a0, 2
    srai a1, a1, 1
    sub a0, a2, a1
    lw ra, (0)sp
    addi sp, sp, 16
    ret
