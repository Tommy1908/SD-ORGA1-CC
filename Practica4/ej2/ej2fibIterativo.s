main:
    li a0 0
    call fib
    li a1 0
    bne a0 a1 noFunciona
    li a0 1
    call fib
    li a1 1
    bne a0 a1 noFunciona
    li a0 2
    call fib
    li a1 1
    bne a0 a1 noFunciona
    li a0 8
    call fib
    li a1 21
    bne a0 a1 noFunciona
    li a0 40
    call fib
    li a1 102334155
    bne a0 a1 noFunciona
    #funciona
    li a1 1
    j fin
    
    noFunciona:
        li a1 0
    
    fin: j fin

fib:
    addi sp, sp, -16
    sw ra 0(sp)
    #end epilogo
    beqz a0 cero
    li t0 1
    beq t0 a0 uno
    
    li t0 0 #acumulador
    li t1 0 #A
    li t2 1 #B
    li t3 1 #contador
    
    while:
        beq t3 a0 endwhile
        add t0, t1, t2
        mv t1 t2
        mv t2 t0
        addi t3, t3, 1
        j while
    
    cero: addi a0, zero, 0
    j prologo
    uno: addi a0, zero, 1
    j prologo
    
    endwhile:
        mv a0 t0
    prologo:
    lw ra 0(sp)
    addi sp, sp, 16
    ret