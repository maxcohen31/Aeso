    .text
    .global isPrime
    .type isPrime, %function

@ r0 -> n

isPrime:
    push {r4, r5, lr}
    cmp r0, #0 
    moveq pc, lr
    cmp r0, #1
    moveq pc, lr

    mov r4, r0 @ save r0
    mov r5, #2 @ first_prime = 2
   
    lsr r0, r0, #1 @ n / 2

_loop:
    cmp r5, r0 @ 2 <= n/2
    bgt _done @ if 2 >= n/2 then exit else continue
    and r2, r4, #1 @ n mod 2 == 0?
    cmp r2, #0
    beq _exit
    add r5, r5, #1 @ first_prime++
    b _loop

_done:
    mov r0, #1
    pop {r4, r5, lr}
    mov pc, lr

_exit:
    mov r0, #0
    pop {r4, r5, lr}
    mov pc, lr
      


