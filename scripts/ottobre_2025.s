.text
.global conta
.type conta, %function

@ r0: indirizzo all'array di istruzioni 
@ r1: numero di istruzioni

conta:
    push {r4, r5, lr}
    cmp r1, #0 @ n == 0
    beq _exit

    mov r2, #0 @ contatore per le istruzioni di memoria
    mov r3, #0 @ contatore per le istruzioni di salto
    mov r12, #0 @ i = 0
_loop:
    cmp r12, r1
    beq _print
    ldr r4, [r0], #4  @ carica il primo elemento dell'array
    and r5, r4, #0x0C000000 @ maschera bit 27-26
    cmp r5, #0x04000000
    beq _memory
    cmp r5, #0x08000000
    beq _load    
    add r12, r12, #1
    b _loop
_memory:
    add r2, r2, #1
    add r12, r12, #1
    b _loop

_load:
    add r3, r3, #1
    add r12, r12, #1
    b _loop

_print:
    ldr r0, =string
    mov r1, r2
    mov r2, r3
    bl printf
    pop {r4, r5, lr}
    mov pc, lr

_exit:
    pop {r4, r5, lr}
    mov pc, lr

.data
string:
    .asciz "Istruzioni memoria: %d\nIstruzioni di salto: %d\n"
