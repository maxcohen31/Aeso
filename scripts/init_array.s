    .text
    .global iniArray
    .type iniArray, %function

@ r0: int num

iniArray:
    push {r4, lr}
    mov r4, #0 @ i = 0 (specified by text)
    mov r5, r0 @ r5 = num
    sub sp, sp, #40 @ allocate space for local array on the stack
    
    @ initialize an array of ten elements
    mov r1, #10 @ size
_loop:
    cmp r4, r1 @ i == 10
    beq _end

    @ calling confronta
    mov r1, r4 
    bl confronta @ confronta(num, i)
    str r0, [sp, r4, lsl #2] @ array[i] = confronta(num, i)
    add r4, r4, #1
    mov r0, r5
    b _loop

_end:
    add sp, sp, #40 @ deallocate space on the stack
    pop {r4, lr}
    mov pc, lr
    
    


