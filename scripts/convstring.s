    .text
    .global convstring
    .type convstring, %function

convstring:
    push {r4, r5, lr} 
    mov r4, r0 @ r4 = string pointer (save original)
    mov r5, #0 @ r5 = result
    mov r1, #0 @ r1 = index

loop:
    ldrb r2, [r4, r1] @ load byte at string[index]
    cmp r2, #0 @ check for null terminator
    beq end
    mov r0, r2
    bl convdigit t
    mov r2, r0
    add r5, r5, r0 @ add the digit value
    lsl r5, r5, #4
    add r1, r1, #1 @ increment index
    b loop
end:
    mov r0, r5 
    pop {r4, r5, lr} 
    bx lr

