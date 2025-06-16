.data
    A: .word 0x00000000,0x00000064,0x00000000, 0x00000032, 0x00000000, 0x00000019
    resA: .word 0,0
    B: .word 0x00000000, 0xFFFFFFFF, 0x00000000, 0x0000001
    resB: .word 0,0
    C: .word 0xFFFFFFFF, 0xFFFFFF9C, 0xFFFFFFFF, 0xFFFFFFCE
    resC: .word 0,0
    D: .word 0x00000000, 0x00001908
    resD: .word 0,0
    E:
    resE: .word 0,0
    
.text
main:
    #A
    li a0, 3
    la a1, A
    la a2, resA
    call sumarVector64
    #B
    li a0, 2
    la a1, B
    la a2, resB
    call sumarVector64
    #C
    li a0, 2
    la a1, C
    la a2, resC
    call sumarVector64
    #D
    li a0, 2
    la a1, D
    la a2, resD
    call sumarVector64
    #E
    li a0, 0
    la a1, E
    la a2, resE
    call sumarVector64
    
    
    fin: j fin
    

#Asumo que el array esta guardado como primero parte alta luego parte baja
sumarVector64:
    #prologo
    addi sp, sp, -16
    sw ra 0(sp)
    sw s0 4(sp)
    sw s1 8(sp)
    sw s2 12(sp)
    
    mv s0 a0 #len
    mv s1 a1 #array
    mv s2 a2 #rta
    li a0, 0 #Parte baja
    li a1, 0 #parte alta
    
    #caso vacio
    beq s0 zero endWhile
    #Al menos 1 elemento
    lw a0, 0(s1) #alta
    lw a1, 4(s1) #baja
    addi s0, s0, -1
    addi s1, s1, 8
    
    while:
    beq zero, s0, endWhile
    
     #Agarro el siguiente elemento
     lw a2, 0(s1) #alta
     lw a3, 4(s1) #baja
     addi s0, s0, -1
     addi s1, s1, 8
     
     #Llamamos a la suma que nos devuelve el res en A0 y A1
     call sumar64
     
     j while
    
    endWhile: 
        sw a0, 0(s2) #alta
        sw a1, 4(s2) #baja
        
    
    epilogo:
    lw ra 0(sp)
    lw s0 4(sp)
    lw s1 8(sp)
    lw s2 12(sp)
    addi sp,sp, 16
    ret


#Espera a0,a2 parte alta, a1,a2 parte alta
#Lo voy a devolver por registros
sumar64:
    #Prologo
    addi sp, sp, -16
    sw ra 0(sp)
        
    #Sumar las 2 partes bajas #a1, a3
    add t0, a1, a3
    
    #Ver si hay carry
    sltu t2, t0, a1
    
    #Suma parte alta
    noCarry:
    add t1, a0, a2
    add t1, t1, t2 #Add carry

    mv a0 t1 #alta
    mv a1 t0 #baja
        
    #Epilogo
    lw ra 0(sp)
    addi sp, sp, 16
    ret