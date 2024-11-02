.text
.global mydiv
.type mydiv, %function


mydiv:
    mov r2, #0 // r2 = result
start:
    cmp r0, r1 // 7 - 3
    blo end
    add r2, r2, #1
    // we need to know the result given by 7 - 3
    sub r0, r0, r1
    b start
end:   
    mov r0, r2
    mov pc, lr
