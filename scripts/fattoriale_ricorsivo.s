.text
.global fact
.type fact, %function

@ r0: parametro n
@ NB: non è usata la ricorsione in coda

fact:
    cmp r0, #0
    beq _return_1
    cmp r0, #1
    beq _return_1

    @ n * fact(n-1)
    @ ricorsione
    sub r1, r0, #1 @ n - 1
    mov r0, r1
    push {r0, r1, lr} @ salvo r0 e r1 che serviranno dopo
    bl fact 
    mov r2, r0 @ sposto in r2 il risultato di fact
    pop {r0, r1, lr}
    mul r3, r2, r0 @ registro per il risultato
    mov r0, r3
    mov pc, lr
    
    
_return_1:
    mov r0, #1
    mov pc, lr
