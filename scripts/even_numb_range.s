.text
.global even_range 
.type even_range, %function


even_range:
    mov r1, #0 // result = 0
    mov r2, r0 // r2 = n
    mov r3, #0 // i = 0
loop:
    cmp r3, r2 // i == size
    beq end
    tst r3, #1 // primo elemento è pari?
    addeq r1, r1, r3
    add r3, r3, #1
    b loop
end:
    mov r0, r1
    mov pc, lr
