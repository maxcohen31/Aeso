    .text
    .global map
    .type map, %function

@ r0: pointer to first string
@ r1: size of array 

map:
    push {r4, r5, lr}
    cmp r0, #0 @ array NULL
    beq _end
    cmp r1, #0 @ n = 0
    beq _end
    mov r2, #0 @ result
    mov r4, r0 @ save address of r0
    mov r5, #0 @ i = 0
_loop:
    cmp r5, r1
    beq _return
    ldr r3, [r4], #4 @ load arr[i] then increment by 4 bytes
    mov r0, r3 @ arr[i] is being passed to myatoi
    bl myatoi @ call myatoi
    cmp r0, #-1 @ check if the convertion returns -1
    beq _skip
    add r2, r2, r0 @ add result of myatoi to our result variable
_skip:
    add r5, r5, #1
    b _loop
_return:
    lsr r2, r2, #2 @ result = result / 4
    mov r0, r2
    pop {r4, r5, lr}
    mov pc, lr
_end:
    mov r0, #0
    pop {r4, r5, lr}
    mov pc, lr

