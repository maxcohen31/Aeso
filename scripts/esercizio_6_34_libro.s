    .text
    .global f
    .type f, %function

@ int f(int n, int k)
@ r0: n
@ r1: k

f:
    push {r4, r5, lr}
    add r4, r1, #2 @ r4 = b = k+2 (the text says b has to be r4)

    cmp r0 , #0
    beq _change_b
    mov r5, r1 @ save k
    mul r2, r0, r0 @ n * n
    add r4, r4, r2 @ b = b + (n * n)
    

    @ recursive call f(n-1, k+1)
    sub r0, r0, #1 @ n - 1
    add r1, r1, #1 @ k + 1
    @ we don't need the old values of n and k - no push
    bl f
    add r4, r4, r0 @ b = b + (n * n) + f(n - 1, k + 1)
    b _return
   
_change_b:
    mov r4, #10 @ b = 10

_return:
    mul r0, r4, r5 @ b * k
    pop {r4, r5, lr}
    mov pc, lr

