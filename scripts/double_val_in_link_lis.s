.text
.global findAndDouble
.type findAndDouble, %function

findAndDouble:
    push {r4, lr}
    mov r4, r0 @ salvo il base address della lista
_loop:
    cmp r0, #0 @ lista null
    beq _done
    ldr r1, [r0] @ carico k
    and r2, r1, #1 @ k mod 2 == 0
    cmp r2, #0
    beq _double
    ldr r0, [r0, #8]
    b _loop
_double:
    ldr r12, [r0, #4] @ carico val
    add r12, r12, r12 @ val = val + val
    str r12, [r0, #4] @ scrivo il nuovo valore
    ldr r0, [r0, #8] @ avanza al prossimo nodo
    b _loop
_done:
    mov r0, r4
    pop {r4, lr}
    mov pc, lr
 
// @ scritto per esercitazione
// _crea_nodo:
//     mov r0, #12 
//     bl malloc
//     mov r4, r0 @ salva indirizzo del nuovo nodo
//     mov r3, #1 @ valore di k
//     mov r12, #0 @ valore di val
//     str r3, [r4] @ scrivo k 
//     str r12, [r4, #4] @ scrivo val
//     mov r1, #0
//     str r1, [r4, #8] @ collega il nuovo nodo: next->NULL
//     mov r0, r4 @ restituisce il nuovo nodo
//     pop {r4, lr}
//     mov pc, lr
// 
