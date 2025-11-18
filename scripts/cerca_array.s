    .text
    .global cerca
    .type cerca, %function


cerca:
    cmp r0, #0 @ null array
    moveq pc, lr

    mov r2, #0 @ i = 0

_loop:
    cmp  r2, r1 @ i == size
    bgt _not_found @ while i < size
    ldr r3, [r0, r2, lsl #2] @ load array[i]
    cmp r3, r2 @ a[i] < i
    bgt _not_found
    cmp r3, r2 @ a[i] == i
    beq _found
    bgt _not_found
    add r2, r2, #1
    b _loop

_found:
    mov r0, #1
    mov pc, lr


_not_found:
    mov r0, #0 @ return false
    mov pc, lr

