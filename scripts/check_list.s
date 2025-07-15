    .text
    .global addDistinct
    .type addDistinct, %function

/* r0 -> pointer l1 */
/* r1 -> pointer l2 */

addDistinct:
    cmp r0, #0;
    beq _end    
    cmp r1, #0
    beq _end
    
    push {r4-r7, lr}
    mov r4, r0 @ r4 = l1
    mov r5, r1 @ r5 = l2

_loop:
    cmp r5, #0 @ l2 == NULL
    beq _end_loop
    ldr r6, [r5] @ load l2->value
    push {r0-r3}
    mov r0, r4 @ first parameter 
    mov r1, r6 @ second parameter
    bl check
    mov r12, r0
    pop {r0-r3}
    cmp r12, #0
    beq _add
    ldr r5, [r5, #4] @ l2 = l2->next
    b _loop
_add: 
    mov r7, r5 @ save current node
    ldr r5, [r5, #4] @ l2 = l2->next
    str r4, [r7, #4] @ node->next = l1
    mov r4, r7 @ l1 = node
    b _loop
_end:
    mov pc, lr
_end_loop:
    mov r0, r4
    pop {r4-r7, lr}
    mov pc, lr



