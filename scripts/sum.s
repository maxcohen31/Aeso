.text
.global sum
.type sum, %function


sum:
    mov r1, r0 // r1 = n
    mov r0, #0 // result = 0
    mov r2, #1 // i = 0

start: 
    cmp r2, r1 // i > n
    bgt end
    add r0, r0, r2
    add r2, r2, #1 // i++
    b start

end:
    mov pc, lr
