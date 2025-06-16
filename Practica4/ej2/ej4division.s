# a = b * q + r aunque como es entrera descartamos r

main:
    li a0 0
    li a1 7
    call division
    li a2 0
    bne a0 a2 noFunciona
    li a0 4
    li a1 5
    call division
    li a2 0
    bne a0 a2 noFunciona
    li a0 5
    li a1 5
    call division
    li a2 1
    bne a0 a2 noFunciona
    li a0 6
    li a1 5
    call division
    li a2 1
    bne a0 a2 noFunciona
    li a0 -26
    li a1 4
    call division
    li a2 -6
    bne a0 a2 noFunciona
    li a0 26
    li a1 -4
    call division
    li a2 -6
    bne a0 a2 noFunciona
    li a0 -26
    li a1 -4
    call division
    li a2 6
    bne a0 a2 noFunciona
    li a0 195687
    li a1 -2871
    call division
    li a2 -68
    bne a0 a2 noFunciona

    
    #funciona
    li a1 1
    j fin
    noFunciona:
        li a1 0

        
    fin: j fin


#a = a0, b = a1, asumo que b no es 0
division:
    
    addi sp, sp, -16
    sw ra, 0(sp)
    #end epilogo
    
    #VerNegativos
    blt a0 zero primeraNeg
    blt a1 zero segundaNeg
    j sigue
    primeraNeg:
        sub a0 zero a0
        li t3 1
        blt a1 zero DobleNeg
        j sigue
    DobleNeg:
        sub a1 zero a1
        li t3 0
        j sigue
    segundaNeg:
        sub a1 zero a1
        li t3 1
    
    sigue:
    li t0 0 # q
    mv t2 a1 # acum adelantado (b*(q+1))
    while:
        blt a0 t2 endwhile
        addi t0, t0, 1
        add t2 t2, a1
        j while
     
     endwhile:
         mv a0 t0
         bnez t3 neg
         j prologo
     neg:
         sub a0, zero, a0
         
     prologo:
     lw ra, 0(sp)
     addi sp, sp, 16
     ret
         