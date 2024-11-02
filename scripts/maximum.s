.text
.global max
.type max, %function

/*
max:
    cmp r0, r1 // compare r0 and r1
    movgt r0, r0 // if r0 >= r1 r0 remains the same
    movlt r0, r1 // if r0 < r1 loads r1 into r0
    cmp r1, r2 // compare r1 and r2
    movgt r1, r1
    movlt r1, r2
    cmp r0, r2
    movgt r0, r0
    movlt r0, r2
    mov pc, lr
*/   


max: 
    cmp r0, r1
    movlt r0, r1 // if r0 <= r1 writes r1 into r0

    cmp r0, r2
    movlt r0, r2 // if current r0 <= r2 writes r2 into r0

    mov pc, lr
