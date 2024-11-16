    .text
    .global count_elements
    .type count_elements, %function

count_elements:
    cmp r0, #0 @; lista nulla?
    beq end
    mov r1, #0 @; c = 0
    mov r2, r0
loop:
    cmp r2, #0
    add r1, r1, #1 @; c++
    ldr r2, [r2, #4] @; scorre la lista 
    b loop
end:
    mov r0, r1
    mov pc, lr
