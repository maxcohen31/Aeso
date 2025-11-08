    .text
    .global squareThree
    .type squareThree, %function

@ r0: base adress of arr
@ r1: size of arr


squareThree:
    push {r4, r5, lr}
    cmp r0, #0 @ array null
    beq _end
    cmp r1, #0 @ size è zero
    beq _end

    mov r2, #0 @ i = 0

_loop:
    cmp r2, r1 @ i == size
    beq _done
    ldr r3, [r0, r2, lsl #2] @ carica arr[i]
    and r12, r3, #1 @ array[i] % 2 == 0?
    cmp r12, #0
    bne _multiply_by_three
    mul r4, r3, r3 @ arrat[i] * array[i]
    str r4, [r0, r2, lsl #2] @ carica l'elemento al quadrato
    add r2, r2, #1
    b _loop

_multiply_by_three:
    mov r5, #3 @ salva 3 in r6 per mul
    mul r4, r3, r5
    str r4, [r0, r2, lsl #2]
    add r2, r2, #1
    b _loop

_done:
    pop {r4, r5, lr}
    mov pc, lr


_end:
    pop {r4, r5, lr}
    mov pc, lr


