    .text
    .global check
    .type check, %function

/* r0 -> address of l1 */
/* r1 -> value */

check:
    cmp r0, #0
    beq _end @ list == NULL
    mov r2, r0 @ save l1's address
_loop:
    cmp r2, #0
    beq _end_loop
    ldr r3, [r2] @ load l1->value 
    cmp r3, r1 @ li->value == x
    beq _return
    ldr r2, [r2, #4]
    b _loop
_end:
    mov r0, #0
    mov pc, lr
_end_loop:
    mov r0, #0
    mov pc, lr
_return:
    mov r0, #1
    mov pc, lr
