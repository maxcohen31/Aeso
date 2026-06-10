.text
.global conta_vocali
.type conta_vocali, %function

// r0: puntatore alla string
// r1: puntatore alla funzione

conta_vocali:
    push {r4, lr}
    cmp r0, #0 // stringa nulla
    beq _exit
    mov r4, r0 // salvo il puntatore alla stringa
    mov r2, #0 // risultato
_loop:
    ldrb r12, [r4], #1 // carica str[i] e incrementa di 1 byte il puntatore
    cmp r12, #0 // str == 0
    beq _return 
    push {r1, r2} // r1 e r2 sono registri non preservati che dovrò riutilizzare. Salviamoli
    mov r0, r12 // passo il puntatore alla stringa alla funzione f
    blx r1 // chiamo f 
    pop {r1, r2}
    add r2, r2, r0 // accumulo il risultato
    b _loop
_return:
    mov r0, r2
    pop {r4, lr}
    mov pc, lr
_exit:
    mov r0, #0
    pop {r4, lr}
    mov pc, lr

