.data
a:.word 0x901A0002
.text
lw t0, a
addi t1, zero, 0

#Primer Byte
srli t2, t0, 24
add t1, t1, t2

#Segundo Byte
slli t2, t0, 8
srli t2, t2, 24
add t1, t1, t2

#Tercer Byte
slli t2, t0, 16
srli t2, t2, 24
add t1, t1, t2

#Cuarto Byte
slli t2, t0, 24
srli t2, t2, 24
add t1, t1, t2

