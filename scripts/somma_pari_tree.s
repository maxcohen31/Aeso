    .text
    .global somma_pari
    .type somma_pari, %function

somma_pari:
    cmp r0, #0          @ Check null pointer
    beq _return_zero

    push {r4-r6, lr}    @ Save registers
    mov r4, r0 @ save address of root
    ldr r1, [r4] @ load root->data
    and r2, r1, #0 @ is val even?
    cmp r2, #0 @ root->data % 2 == 0
    moveq r5, r1
    movne r5, #0
    /* recursion */
    ldr r0, [r4, #4] @ load root->left
    push {r5, lr} @ save current sum
    bl somma_pari
    mov r6, r0 @ save left sum
    pop {r5, lr}
    ldr r0, [r4, #8] @ load root->right
    push {r5, r6, lr} @ save left sum and total sum
    bl somma_pari
    pop {r5, r6, lr}

    add r0, r0, r6
    add r0, r0, r5

    pop {r4-r6, lr}
    mov pc, lr

_return_zero:
    mov r0, #0
    mov pc, lr
     


    
