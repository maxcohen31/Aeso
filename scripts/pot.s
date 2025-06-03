.text
.global pot
.type pot, %function
.extern conta_bit_a_uno
.extern printf

pot:
    push {lr}
    cmp r0, #0
    beq print_false

    bl conta_bit_a_uno
    cmp r0, #1
    beq print_true

print_false:
    ldr r0, =false_msg
    bl printf
    b end

print_true:
    ldr r0, =true_msg
    bl printf
    b end

end:
    pop {lr}
    bx lr

    .data
true_msg:
    .asciz "Power of 2: True\n"

false_msg:
    .asciz "Power of 2: False\n"
