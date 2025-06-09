.text
.global subst
.type subst, %function

subst:
    push {r4, r5, lr} @ salva il puntatore alla lista
    cmp r0, #0 @ lista null?
    beq end
    mov r4, r0 @ salva la testa
    mov r5, r0 @ salva la testa
_loop:
    cmp r4, #0
    beq _end
    ldr r2, [r4] @ carico primo elemento lista 
    ldr r3, [r4, #4] @ carica puntatore a next
    cmp r3, #0 @ controlla che next sia NULL
    beq _end
    ldr r12, [r3] @ info del secondo nodo
    cmp r2,  r12 @ confronto i due elementi
    bgt _swap
    mov r4, r3 @ aggiorna il puntatore next
    b _loop
_swap:
    str r12, [r4] @ il puntatore del secondo nodo 
    str r2, [r3]
    mov r4, r3
    b _loop
_end:
    mov r0, r5
    pop {r4, r5, lr}
    mov pc, lr

