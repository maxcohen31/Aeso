    .text
    .global
    .type confronta, %function

@ r0: int a
@ r1: int b

confronta:
    bl sottr @ sottr(a, b)
    cmp r0, #0 @ sottr(a, b) >= 0
    gte _return_1 @ if sottr(a, b) >= 0 then 1
    mov r0, #0 @ else 0
    mov pc, lr

_return_1:
    mov r0, #1
    mov pc, lr

