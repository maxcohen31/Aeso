.text
.global stampa
.type stampa, %function

stampa:
    cmp r0, #0 @ lista null
    beq _end
    push {r4, lr} @ salva puntatore lista perché si fanno bl 
_loop:
    cmp r0, #0 @ fine lista?
    beq _end
    mov r4, r0
    ldr r0, =fmt
    ldr r1, [r4] @ carico il campo 'info' della lista
    bl printf
    ldr r0, [r4, #4] @ carico il campo next
    b _loop
_end:
    ldr r0, =nl
    bl printf
    pop {r4, pc}

.data
    fmt: .string "%d -> "
    nl: .string "\n"
