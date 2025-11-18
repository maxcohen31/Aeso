    .text
    .global find
    .type find, %function

find:
    push {r4, lr}
    cmp r0, #0 @ null pointer
    beq _null_arr
    cmp r2, #0 @ size is 0
    beq _size_zero

    @ base case
    sub r12, r2, #1 @ size - 1
    ldr r3, [r0, r12, lsl #2]
    cmp r3, r1 @ size == x
    beq _found

    @ recursion
    push {r2}
    sub r12, r2, #1 @ size - 1
    mov r2, r12
    bl find @ find (arr, x, size - 1)
    mov r4, r0 @ result in r4
    pop {r2}
    mov r0, r4
    pop {r4, lr}
    mov pc, lr

_found:
    mov r0, #1
    pop {r4, lr}
    mov pc, lr

_size_zero:
    mov r0, #0
    pop {r4, lr}
    mov pc, lr

_null_arr:
    mov r0, #0
    pop {r4, lr}
    mov pc, lr
