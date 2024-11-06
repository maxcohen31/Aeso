.text
.global countzero
.type countzero, %function

countzero:
    mov r2, #0 // result = 0
    mov r3, #0 // i = 0
loop:
    cmp r3, r1 // i == size
    beq end
    ldr r12, [r0, r3 lsl #2] // carico in r12 array[i]
    cmp r12, #0 // il primo elemento dell'array è 0?
    addeq r2, r2, #1 // result++
    add r3, r3, #1 // i++
    // la riga 16 la evitiamo se usiamo la riga 11
    // add r0, r0, #4 // leggo prossimo elemento array 
    b loop
end:
    mov r0, r2
    mov pc, lr
    
