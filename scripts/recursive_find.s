    .text 
    .global find
    .type find, %function

@ r0: base address of the array
@ r1: integer to find
@ r2: size


find:
    push {r4, r5, lr}
    cmp r2, #0 @ size == 0
    beq _end

    @ base case
    ldr r3, [r0, r2, lsl #2] @ load array[size]
    cmp r3, r1 @ array[size] == x 
    beq _done

    @ recursion
    sub r12, r2, #1 @ size - 1
    mov r4, r0 @ save r0 
    mov r3, r1 @ save value x
    mov r5, r2 @ save size
    @ calling find on array with size - 1
    mov r0, r4
    mov r1, r3 @ r1 = value
    mov r2, r12
    bl find
    pop {r4, r5, lr}
    mov pc, lr

_done:
    pop {r4, r5, lr}
    mov r0, #1
    mov pc, lr

_end:
    pop {r4, r5, lr}
    mov r0, #-1
    mov pc, lr

