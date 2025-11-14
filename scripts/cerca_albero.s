    .text
    .global cerca_albero
    .type cerca_albero, %function


cerca_albero:
    @ r0 -> puntatore a radice_
    @ r1 -> elemento da comparare

_loop:
    cmp r0, #0 @ r0 == NULL 
    beq _end
    ldr r2, [r0] @ carica radice
    cmp r2, r1 @ confronta root e elemento x
    beq _trovato
    push {r0, lr}
    ldr r0, [r0, #4] @ carica sottoalbero sx
    bl cerca_albero
    mov r2, r0 @ salva risultato
    pop {r0, lr}
    push {r2, lr}
    ldr r0, [r0, #8] @ carica sottoalbero dx
    pop {r2, lr} 

    or r0, r0, r2 @ or dei risultati a sottochiamate
    bx lr

_trovato:
    mov r0, #1
    bx lr
    

_end:
    mov r0, #0
    bx lr

