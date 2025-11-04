.text
    .global cambia
    .type cambia, %function
@ char cambia(char c, char *from, char *to, int N)
@ r0: char
@ r1: from
@ r2: to
@ r3: size


cambia:
    push {r4, r5, lr}
    cmp r1, #0              @ from is NULL
    beq _return_char
    cmp r2, #0              @ to is NULL
    beq _return_char
    cmp r3, #0              @ N <= 0
    ble _return_char
    
    mov r4, #0              @ j = 0
_loop:
    cmp r4, r3              @ j < N
    bge _return_char        @ CORRETTO: esce quando j >= N
    ldrb r5, [r1, r4]       @ load from[j]
    cmp r5, r0              @ from[j] == c
    beq _found 
    add r4, r4, #1          @ j++
    b _loop
_found:
    ldrb r0, [r2, r4]       @ r0 = to[j]
    pop {r4, r5, lr}
    mov pc, lr
_return_char:
    pop {r4, r5, lr}
    mov pc, lr    


