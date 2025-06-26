    .text
    .global palindrome
    .type palindrome, %function

palindrome:
    cmp r0, #0              @ null string
    beq _end
    push {r4, r5, r6, r7, lr}
    mov r4, r0              @ save string address
    bl strlen               @ call strlen() - saved in r0 
    mov r2, r0              @ save n in r2
    mov r1, r0              @ save n in r1
    lsr r2, r2, #1          @ n/2
    sub r1, r1, #1          @ len(s) - 1
    add r7, r4, r1          @ r7 = &s[len(s) - 1] -> address of s[0] + (len(s) - 1)
    mov r12, #0             @ index
    mov r6, #0              @ counter
_loop:
    cmp r12, r2             @ i <= n/2
    bgt _true               @ end of cicle -> palindrome found
    ldrb r5, [r4, r12]      @ load s[i] 
    ldrb r6, [r7]           @ load s[len(s) - 1]
    cmp r5, r6
    bne _false
    add r12, r12, #1        @ i++
    sub r7, r7, #1          @ len(s) - i - 1
    b _loop
_increment_counter:
    add r6, r6, #1          @ c++
_false: 
    pop {r4, r5, r6, r7, lr}
    mov r0, #0
    mov pc, lr
_true:
    pop {r4, r5, r6, r7, lr}
    mov r0, #1
    mov pc, lr
_end:
    mov pc, lr
