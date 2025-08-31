    .text
    .global reverseList
    .type reverseList, %function

@ r0: puntatore alla testa della lista

reverseList:
    cmp r0, #0
    beq _end @ lista nulla

    mov r1, r0 @ curr = list
    mov r2, #0 @ prec = NULL

_loop:
    cmp r1, #0 @ while (current != NULL)
    beq _complete
    
    ldr r3, [r1, #4] @ next = current->next
    str r2, [r1, #4] @ current->next = prec
    mov r2, r1 @ prec = current
    mov r1, r3 @ current = prec

    b _loop

_end:
    bx lr 

_complete:
    mov r0, r2
    bx lr

