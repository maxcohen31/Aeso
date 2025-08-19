    .text
    .global creaLista
    .type creaLista, %function
    
@ r0: puntatore al primo elemento del vettore
@ r1: dimensione del vettore

creaLista:
    push {r4-r7, lr}

    mov r4, r0 @ salvo indirizzo vettore
    mov r5, r1 @ salvo dimensione del vettore
    cmp r0, #0
    beq _array_nullo
    cmp r1, #0
    beq _dim_zero
    mov r0, #8 @ int + sizeof(*pointer)
    bl malloc  @ malloc(sizeof(nodo))
    mov r6, r0 @ salva risultato malloc - puntatore al primo nodo
    ldr r0, [r4] @ r0 = v[0]
    str r0, [r6] @ lista->valore = v[0]
    mov r0, #0 @ NULL
    str r0, [r6, #4] @ lista->next = NULL
    mov r3, #1 @ i = 1
    mov r12, r6 @ r12 = precedente = primo nodo
_loop:
    cmp r3, r5 @ i == n
    beq _end
    mov r0, #8 @ sizeof(nodo)
    bl malloc @ malloc(sizeof(nodo))
    ldr r1, [r4, r3, lsl #2] @ r1 = v[i]
    str r1, [r0] @ nuovo_nodo->valore = v[i]
    mov r2, #0 @ NULL
    str r2, [r0, #4] @ nuovo_nodo->next = NULL
    str r0, [r12, #4] @ precedente->next = nuovo_nodo
    mov r12, r0 @ precedente = nuovo_nodo
    add r3, r3, #1 @ i++
    b _loop

_array_nullo:
    bx lr
_dim_zero:
    bx lr
_end:
    mov r0, r6
    pop {r4-r7, lr}
    bx lr

