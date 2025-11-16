    .text
    .global main
    .type main ,%function

msg:
    .asciz "%d\n"

@ r0 -> argc
@ r1 -> argv

main:
    cmp r0, #1 @ argv <= 1
    ble _end

    push {r4, r5, r6, r7, lr}
    mov r4, r0
    mov r5, r1
    mov r6, #1 @ i = 1
    mov r7, #0 @ result = 0

_loop:
    cmp r6, r4 
    bge _return @ i >= argc
    ldr r0, [r5, r6, lsl #2]
    bl atoi
    add r7, r7, r0 @ result += argv[i]
    add r6, r6, #1 @ i++
    b _loop

_return:
    ldr r0,=msg
    mov r1, r7
    bl printf
    pop {r4, r5, r6, r7, lr}
    mov pc, lr

_end:
    mov pc, lr
