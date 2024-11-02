.text
.global fact
.type fact, %function



fact:
    mov r1, r0 // r1 = n
    mov r0, #1 // R0 = result (see main.c)
start:    
    // Check if n = 0
    cmp r1, #0 // r1 - 0
    beq fine
    mul r0, r1, r0 // result = n * result
    sub r1, r1, #1
    // jump to CMP
    b start
fine:
    mov pc, lr 
