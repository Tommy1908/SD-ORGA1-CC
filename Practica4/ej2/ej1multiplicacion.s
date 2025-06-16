main:
    li a0 0
    li a1 4
    call multiplicacion
    li a2 0
    bne a0 a2 noFunciona
    li a0 5
    li a1 4
    call multiplicacion
    li a2 20
    bne a0 a2 noFunciona
    li a0 -5
    li a1 4
    call multiplicacion
    li a2 -20
    bne a0 a2 noFunciona
    li a0 5
    li a1 -4
    call multiplicacion
    li a2 -20
    bne a0 a2 noFunciona
    li a0 -5
    li a1 -4
    call multiplicacion
    li a2 20
    bne a0 a2 noFunciona
    j funciona
    
noFunciona:
    li a1 0
    j fin
funciona:
    li a1 1
        
fin: j fin


multiplicacion:
    addi sp, sp, -16
    sw ra, 0(sp)
    #end epilogo
    
    #CASO 0
    beqz a0 cero
    beqz a1 cero
    j VerNegativos
    cero:
    li a0 0
    j prologo    
    
    VerNegativos:
    blt a0 zero primeraNeg
    blt a1 zero segundaNeg
	# j sigue ?? no lo puse me recuerdo que me dio pero no tiene sentido ahora que lo veo jaja
    primeraNeg:
        sub a0 zero a0
        li t2 1
        blt a1 zero DobleNeg
        j sigue
    DobleNeg:
        sub a1 zero a1
        li t2 0
        j sigue
    segundaNeg:
        sub a1 zero a1
        li t2 1
        
    sigue:
    mv t0, a0 #copia original del numero
    addi a1, a1, -1
    while:
        beqz a1 Endwhile
        add a0, a0, t0
        addi a1, a1, -1
        j while
    
    Endwhile:
    #Poner negativo si t2 = 1
    beqz t2 prologo
    sub a0 zero a0    
    
    prologo:
    lw ra, 0(sp)
    addi sp, sp, 16
    ret
    