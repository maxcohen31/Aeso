.text
.global counter
.type counter, %function

counter:
    mov r2, #0 // result = 0
    mov r3, #0 // i = 0
loop:
    cmp r0, #0 // stringa nulla? 
    beq end // esco
    ldrb r12, [r0, r3] // carica array[i]
    cmp r12, #0 // '\0'? 
    beq end
    cmp r12, r1
    addeq r2, r2, #1 // carattere uguale
    add r3, r3, #1 // i++
    b loop
end:
    mov r0, r2
    mov pc, lr
