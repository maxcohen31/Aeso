.text
.global conta
.type conta, %function

conta:
    push {r4, r5, lr}
    mov r5, #0      // contatore di sequenze consecutive
    mov r1, #0      // i = 0
    ldrb r2, [r0]   // carica primo carattere 
    cmp r2, #0
    beq fine
loop:
    add r1, r1, #1 // i++
    ldrb r3, [r0, r1]  // carica prossimo carattere 
    cmp r3, #0 // trovo carattere nullo
    beq fine 
    sub r4, r3, r2 // s[i+1] - s[i]
    cmp r4, #1
    addeq r5, r5, #1  // c++
    mov r2, r3 // s[i] diventa s[i+1]
    b loop
fine:
    mov r0, r5
    pop {r4, r5, lr}
    mov pc, lr
