.text
.global subst
.type subst, %function

subst:
    cmp r0, #0 @ lista NULL
    moveq pc, lr
    ldr r1, [r0, #4] @ carica nodo.next
    cmp r1, #0 @ next è NULL
    moveq pc, lr
    ldr r2, [r1] @ info del secondo nodo
    ldr r3, [r0] @ info primo nodo
    cmp r3, r2
    strgt r2, [r0] @ scambia gli elmenti
    strgt r3, [r1]
    mov r0, r1 @ next
    b subst
