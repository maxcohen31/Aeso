/* ARMv7 script that builds a linked list */

    .data 
arr:    .word 1, 2, 3, 4, 5
len:    .word 5
str:    .string "%d "


    .bss /* zero initialiased data */
list:   .space 40 @ 5 * 8 bytes
    
    .text
    .global main

main:
    push {r4, r5, r6, r7, r8, lr}
    ldr r0,=arr @ load address of the array
    ldr r1,=len  
    ldr r1, [r1] @ load len
    ldr r2,=list @ load list
    mov r3, #0 @ i = 0
    mov r4, #0 @ prev = NULL
    ldr r8,=list @ save address of the list for printing 
_build:
    cmp r3, r1 @ i == len
    beq _print
    ldr r5, [r0, r3, lsl #2] @ load r5 = arr[i]
    str r5, [r2] @ store node->value
    add r6, r2, #4 @ r6 point to node->next
    mov r7, #0 @ NULL value
    str r7, [r6] @ node->next = NULL

    /* linking nodes */
    cmp r4, #0
    beq _skip_linking
    add r7, r4, #4 @ r7 = &prev.next
    str r2, [r7] @ prev->next = current
_skip_linking:
    mov r4, r2 @ prev = current
    add r2, r2, #8 @ move to next node space
    add r3, r3, #1 @ i++
    b _build
_print:
    mov r2, r8 @ head of the list
_print_loop:
    cmp r2, #0 @ next = NULL
    beq _end
    /* print data */
    ldr r0,=str @ load format string
    ldr r1, [r2] @ load node.value
    push {r2} @ save r2
    bl printf
    pop {r2} @ restore r2
    add r2, r2, #4
    ldr r2, [r2] @ load node.next
    b _print_loop
_end:
    pop {r4-r8, lr}
    bx lr
