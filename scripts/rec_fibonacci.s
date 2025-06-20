    .text
    .global fibonacciRec
    .type fibonacciRec, %function

fibonacciRec:
    cmp r0, #0
    ble _end
    cmp r0, #1
    ble _end_one
    push {r4-r6, lr}
    mov r4, r0 @ save r0
    sub r4, r4, #1 @ n-1 in r1
    mov r0, r4 @ r0 becoms n-1
    push {r0, lr}
    bl fibonacciRec
    mov r5, r0 @ save fib(n-1) 
    pop {r0, lr}
    sub r4, r4, #1 @ (n-1)-1 in r4
    mov r0, r4 @ r0 becomes n-2
    push {r5, lr}
    bl fibonacciRec
    mov r6, r0 @ save sum in r6
    pop {r5, lr}

    add r0, r5, r6 @ fib(n-2) + fib(n-1)
    pop {r4-r6, lr}
    mov pc, lr
_end:
    mov r0, #0
    mov pc, lr
_end_one:
    mov r0, #1
    mov pc, lr
