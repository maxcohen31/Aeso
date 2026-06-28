    .text
    .global recSum
    .type recSum, %function

/* r0 -> array address */
/* r1 -> dimension */
/* recSum(int *arr, int n) */
/* return recSum(arr, n-1) + arr[n-1] */

recSum:
    cmp r1, #0
    beq _end
    sub r1, r1, #1 // r1 = n - 1
    ldr r2, [r0, r1, lsl #2] // arr[n-1]
    push {r2, lr} // saving arr[n-1] on the stack
    bl recSum // r0 = recSum(arr[n-1])
    pop {r3, lr} // r3 = arr[n-1]
    add r0, r0, r3
    mov pc, lr
_end:
    mov r0, #0
    bx lr
