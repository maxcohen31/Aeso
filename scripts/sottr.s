    .text
    .global sottr
    .type sottr, %function

@ r0: int a
@ r1: int b

sottr:
    sub r0, r0, r1
    mov pc, lr
