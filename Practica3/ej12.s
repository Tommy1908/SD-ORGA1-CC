.data
q:.word 1,2,3,4,5,6,7,8,9,10
s:.word 46,674,6,7,3,23,6,78,6,200
long:.word 10
.text
la t0, q
la t1, s
lw t2, long

while:
    beq zero, t2, fin
    lw t3 0(t0)
    sw t3 0(t1)        
        
    addi t0, t0, 0x4 #pasamos a la siguiente palabra
    addi t1, t1, 0x4 #pasamos a la siguiente palabra
    addi t2, t2, -1 #restamos long
    
    j while
    
fin:
    nop