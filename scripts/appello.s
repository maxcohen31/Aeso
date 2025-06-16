    .text
    .global powerSum
    .type powerSum, %function

powerSum:
    push   {r4, r5, r6, lr}
    mov    r3, #0      @ sum = 0
    mov    r12, #0     @ i = 0
_for:
    cmp    r12, r1 @ i == n
    beq    _end
    ldr    r4, [r0, r12, lsl #2]   @ load arr[i]
    mov r5, #1 @ power = 1
    mov r6, #0 @ counter for power - index j of the inner loop
_power:
    cmp r6, r12
    beq _power_done
    mul r5, r5, r2 @ store x * x in r5
    add r6, r6, #1 @ j++
    b _power
_power_done:
    mul r5, r5, r4 @ arr[i] * x^i
    add r3, r3, r5 @ sum += arr[i] * x^i
    add r12, r12, #1
    b _for
_end:
    mov r0, r3
    pop {r4, r5, r6, lr}
    mov pc, lr



    
