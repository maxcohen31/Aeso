.text
.global hash
.type hash, %function

hash:
    mov r2, #0 @ risultato
    mov r3, #4 @ i = 4 - 4 iterazioni
    cmp r0, #0 @ 0x00000000000000000000000000000000
    beq end
loop:
    lsr r0, r0, #4 @ primo nibble pari gettato
    and r12, r0, #15 @ salva nibble dispari - 0xF0
    add r2, r2, r3
    sub r3, r3, #1
    cmp r3, #0
    beq return
    b loop
return:
    and r2, r2, #15 @ somma mod 16
    mov r0, r2
    bx lr
end:
    bx lr

