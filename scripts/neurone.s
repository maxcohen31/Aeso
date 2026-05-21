.text
.global neurone
.type neurone, %function

@r0: indirizzo dell'array degli ingressi
@r1: indirizzo dell'array dei pesi
@r2: numero degli ingressi e dei pesi
@r3: indirizzo della prima istruzione della funzione

neurone:
    cmp r2, #0
    beq _exit

    push {r4-r7, lr}
    mov r12, #0 @ i = 0
    mov r4, #0 @ risultato della sommatoria
    mov r7, #1 @ accumulatore
_loop:
    cmp r12, r2 @ i == n
    beq _chiama_funzione
    ldr r5, [r0], #4 @ carica x[i]
    ldr r6, [r1], #4 @ carica w[i]
    mul r7, r5, r6   @ x[i] x w[i]
    add r4, r4, r7   @ somma il risultato della moltiplicazione
    add r12, r12, #1 @ i++
    b _loop
_chiama_funzione:
    mov r0, r4 @ metto in r0 il risultato della sommatoria e lo passo alla funzione
    blx r3  @ chiama f
    pop {r4-r7, lr}
    mov pc, lr
_exit:
    mov r0, #0
    mov pc, lr


