    .text
    .global myatoi
    .type myatoi, %function

@ r0: pointer to the first element of s

myatoi:
    push {r4, lr}
    cmp r0, #0 @ NULL string
    beq _end_null
    mov r2, #0 @ result
    mov r4, #10 @ register to perform mul
_loop:
    ldrb r1, [r0], #1 @ load s[i];
    cmp r1, #0 @ s[i] < '0'
    beq _return
    cmp r1, #'0'
    blt _invalid
    cmp r1, #'9' @ s[i] must be lesser than '9'
    bgt _invalid
    cmp r1, #0 @ finished
    beq _return
    sub r3, r1, #'0' @ s[i] - '0' @ r3 = ch - '0'
    mul r2, r2, r4 @ r2 = r2 * 10
    add r2, r2, r3 @ r2 = r2 - (ch - '0')
    b _loop
_return:
    mov r0, r2
    pop {r4, lr}
    mov pc, lr
_invalid:
    mov r0, #-1
    pop {r4, lr}
    mov pc, lr
_end_null:
    mov r0, #-1
    pop {r4, lr}
    mov pc, lr

    
