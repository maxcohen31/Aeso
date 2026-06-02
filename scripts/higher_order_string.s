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
    mov r3, #0 // i = 0
_loop:
    ldrb r12, [r4], #1 // carica str[i]
    cmp r12, #0 // str == 0
    beq _return 
    push {r1, r2} // registri non preservati - salviamoli
    mov r0, r12 // passo il puntatore alla stringa alla funzione f
    blx r1 // chiamo f 
    pop {r1, r2}
    add r2, r2, r0
    b _loop
_return:
    mov r0, r2
    pop {r4, lr}
    mov pc, lr
_exit:
    mov r0, #0
    pop {r4, lr}
    mov pc, lr

