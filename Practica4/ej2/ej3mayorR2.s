
li a0 1
li a1 1
li a2 2
li a3 3
call mayorR2
li t0 -1
bne a0 t0 noFunciona

li a0 1
li a1 3
li a2 1
li a3 3
call mayorR2
li t0 0
bne a0 t0 noFunciona
#funciona
li a1 1
j fin
 

noFunciona:
li a1 0
fin: j fin




mayorR2:
    addi sp,sp -16
    sw ra 0(sp)
    #endepilogo
    
    bgt a0 a2 primeraMayor
    blt a0 a2 primeraMenor
    j cc
    primeraMayor:
        bgt a1 a3 segundaMayor
        j cc
    segundaMayor:
        addi a0, x0, 1
        j finMayor
    primeraMenor:
        blt a1 a3 segundaMenor
        j cc
    segundaMenor:
        addi a0, x0, -1
        j finMayor
    cc:
        addi a0, x0, 0

    finMayor:
    #prologo
    lw ra 0(sp)
    addi sp,sp 16
ret