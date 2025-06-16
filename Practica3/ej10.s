.data
a:.word 0x082B0023
b:.word 0x4
.text
lw t0, a
lw t1, b

#Multiplicar por 2 es sumarse a si mismo
#Por lo tanto mover un bit es hacer t0 + t0 mueve 1 bit. Mover 1byte es hacerlo 8 veces


while: 
    beq t1, zero, fin
    add t0, t0, t0
    addi t1, t1, -1
    j while
fin:
    nop
