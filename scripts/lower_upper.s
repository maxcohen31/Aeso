.text
.global maius
.type maius, %function


maius:
    cmp r0, #0 // null string?
    beq fine
    ldrb r1, [r0] // leggo il primo carattere
    cmp r1, #0 // è la stringa vuota? 
    beq fine
    cmp r1, #0x61 // confronta il primo carattere con 'a'
    blow next
    cmp r1, 0x7a // confonta il primo carattere con 'z' 
    blow next
    sub r1, r1, #0x20
    strb r1, [r0]
next:
    add r0, r0, #1
    b maius
fine:
    mov pc, lr





