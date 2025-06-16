main:
    li a0,7
    li a1,13
    jal ra, mod
    mv s1, a0
    li a0 7
    li a1,-1
    jal ra, mod
    beq a0, s1, equivalentes
    diferentes: 
    li a1,0
    j fin
    equivalentes: 
    li a1,1
    fin: j fin


mod:
    addi sp, sp, -16
    sw ra, (0)sp
    sw s1, (4)sp
    #end prologo
    mv a2, a1
    bgt a1, zero, inicioCiclo
    sub a2, zero, a1
    inicioCiclo: 
    blt a2, a0, finCiclo
    sub a2, a2, a0
    j inicioCiclo
    finCiclo: 
    mv s1, a0
    mv a0, a2
    bgt a1, zero, terminar
    beq a0, zero, terminar
    sub a0, s1, a0 # (-n) % m = m - (n %m)
    #epilogo
    terminar: 
    lw ra, (0)sp
    lw s1, (4)sp
    addi sp, sp, 16
    ret
