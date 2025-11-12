    .text
    .global moveZeros
    .type moveZeros, %function
    

@ r0: base address of our array
@ r1: size of the array

moveZeros:
    cmp r0, #0 @ array null
    beq _end
    cmp r1, #0 @ size = 0
    beq _end_size

    mov r2, #0 @ i = 0
    mov r3, #0 @ j = 0

_for_loop:
    cmp r2, r1 @ i == size
    beq _jump_to_while
    ldr r12, [r0, r2, lsl #2] @ load array[i]
    cmp r12, #0 @ array[i] = 0
    bne _update
    add r2, r2, #1 @ i++
    b _for_loop

_jump_to_while:
    cmp r3, r1 @ j < n
    bge _done
    mov r12, #0
    str r12, [r0, r3, lsl #2]
    add r3, r3, #1
    b _jump_to_while

_update:
    str r12, [r0, r3, lsl #2] @ array[j] = array[i]
    add r3, r3, #1 @ j++
    add r2, r2, #1 @ i++
    b _for_loop

_end:
    ldr r0,=msg
    bl printf
    mov pc, lr

_end_size:
    ldr r0,=msg2
    bl printf
    mov pc, lr

_done:
    mov pc, lr


.data
    
msg: 
    .asciz "Error: empty array\n"
msg2:
    .asciz "Error: size is zero\n"



