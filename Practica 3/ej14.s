###Pseudocodigo
# la t0, la t1
# lw t0, lw 4(t0)  // lw t1, lw 4(t1)
# sw t0 + t1 sw 4(t0) + 4(t1)
#t2 = pos t0 + t1

.data
num1: .word 0x0000ab04,0x89abcdef    # parte baja, parte alta (ls,ms)
num2: .word 0x12345678,0x30eba000    # parte baja, parte alta (ls,ms)
#num1: .word 0xf000000f,0x00000000    # parte baja, parte alta (ls,ms)
#num2: .word 0x10000001,0x00000000    # parte baja, parte alta (ls,ms)
pos: .word 0x10000010

.text
la t0, num1
la t1, num2
lw t2, pos

#Sumar la parte baja
lw t3, 0(t0)
lw t4, 0(t1)
add t5, t3, t4
#Guardar el resultado
sw t5, 0(t2)
#Ver si habia carry
#Para ello hacemos una mascara del ultimo bit, lo dezplazamos 1, y los sumamos
li t5, 0xF0000000
and t3, t3, t5
and t4, t4, t5
srli t3, t3, 4 
srli t4, t4, 4
#En el bit mas significativo esta el carry
add t3, t3, t4

beq t3, zero, nocarry

addi, t3, zero, 0x1

nocarry:
    #Carganos la parte alta del primero + el carry si aplica
    lw t5 4(t0)
    add t3, t3, t5
    #Cargamos la otra
    lw t4 4(t1)
    
    add t5, t3, t4
    sw t5, 4(t2)
