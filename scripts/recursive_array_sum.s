    .text
    .global recSum
    .type recSum, %function

/* r0 -> array address */
/* r1 -> dimension */
/* recSum(int *arr, int n) */
/* return recSum(arr, n-1) + arr[n-1] */

recSum:
    cmp r1, #0
    ble _end
    push {r4, r5, lr}
    mov r4, r0 @ save array address 
    mov r5, r1 @ save n
    sub r5, r5, #1 @ n - 1
    ldr r12, [r4, r5, lsl #2] @ load arr[n-1]
    push {r12} @ save r12 since can be overwritten
    mov r0, r4 @ array base address
    mov r1, r5 @ r1 becomes n-1
    bl recSum @ recSum(arr, n-1)
    mov r3, r0 @ save result
    pop {r12}

    add r0, r3, r12; @ r0 = recSum(arr, n-1) + arr[n-1]
    pop {r4, r5, lr}
    mov pc, lr

_end:
    mov r0, #0
    bx lr
