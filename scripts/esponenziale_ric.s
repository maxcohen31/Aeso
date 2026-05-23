.text
.global rec_exp
.type rec_exp, %function

@ r0: base
@ r1: potenza

rec_exp:
    cmp r1, #0
    beq _return_1
    cmp r1, #1
    beq _return_n

    @ ricorsione
    sub r1, r1, #1 @ pow - 1
    push {r0, r1, lr}
    bl rec_exp
    mov r2, r0 @ salva il risultato in r2
    pop {r0, r1, lr}
    mul r0, r0, r2
    mov pc, lr

_return_1:
    mov r0, #1
    mov pc, lr
_return_n:
    mov pc, lr
    
