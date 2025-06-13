.text
.global bubbleSort
.type bubbleSort, %function

/* r0 contains the address of the array */
/* r1 contains the number of elements */

bubbleSort:
    push {r4, r5, r6, lr}
    cmp r0, #0 @ array null
    beq _end
    cmp r1, #2 @ array already sorted if n < 2
    blt _end
    mov r2, #0 @ i = 0
_outer_loop:
    sub r4, r1, r2 @ n - i
    sub r4, r4, #1 @ n - i - 1
    cmp r4, #0 @ no more comparison needed    
    ble _increment_i
    mov r5, #0 @ j = 0
_inner_loop:
    cmp r5, r4
    bge _increment_i
    ldr r3, [r0, r5, lsl #2] @ array[i]
    add r6, r5, #1 @ j++
    ldr r12, [r0, r6, lsl #2] @ array[j + 1]
    cmp r3, r12 @ array[i] > array[j+1]
    ble _skip
    str r12, [r0, r5, lsl #2]
    str r3, [r0, r6, lsl #2] 
_skip:
    add r5, r5, #1 @ j++
    b _inner_loop
_increment_i:
    add r2, r2, #1 @ i++
    sub r4, r1, #1 @ n - 1
    cmp r2, r4 @ compare i with n - 1
    blt _outer_loop
_end:
    pop {r4-r6, lr}
    bx lr



