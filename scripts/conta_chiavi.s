.text
.global contaDispari
.type contaDispari, %function


contaDispari:
    push {r4, r5, lr}
    cmp r0, #0 @ vettore nullo 
    moveq pc, lr
    mov r4, r0 @ salvo indirizzo del vettore
    mov r2, #0 @ i = 0
    mov r3, #0 @ risultato
_loop:
    cmp r2, r1 @ i == n
    beq _end
    add r12, r4, r2, lsl #3 @ calcola r12 = &v[i]
    ldr r5, [r12] @ carica v[i]->k
    ands r5, r5, #1 @ è pari?
    bne _skip @ skippa se pari
    add r3, r3, #1
    add r2, r2, #1
    b _loop
_skip:
    add r2, r2, #1
    b _loop
_end:
    mov r0, r3
    pop {r4, r5, lr}
    mov pc, lr
