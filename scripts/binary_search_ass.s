.text
.global binary_search
.type binary_search, %function


binary_search:
    push {r4, r5, r6, lr}
    mov r3, #-1 // risultato        
    mov r4, #0 // i = 0
    mov r5, r2; // j = size
loop:
    cmp r4, r5  // i < j
    bgt fine
    mov r6, r4 //  m = i
    add r6, r5, r4 // m = i+j
    lsr r6, r6, #1  // m = (i+j)/2
    ldr r12, [r0, r6, lsl #2] // legge array
    cmp r12, r1  // arr[m] == element
    beq uguali 
    cmp r12, r1  
    blt go_left // arr[m] > element
    bgt go_right // arr[m] < element
    b loop
go_left:
    mov r6, r5
    sub r6, r5, #-1 // m = j - 1
go_right:
    mov r6, r4
    add r6, r4, #1
uguali:
    mov r3, r6 // salvo indice in risultato
fine:
    mov r0, r3;
    pop {r4, r5, r6, lr}
    mov pc, lr
