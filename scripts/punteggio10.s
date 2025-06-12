.data
s:     .asciz "%d "
array: .word 2, 3, 4, 5
n:     .word 4

.text
.global main
.extern printf

main:
    push {r4, r5, r6, r7, lr}
    
    ldr r4,=array      @ r4 = base address of array
    ldr r5,=n
    ldr r5, [r5]        @ r5 = n (keep in r5) 
    mov r6, #0          @ i = 0
for_loop:
    cmp r6, r5          @ i == n
    bge print_loop      @ if i >= n, go to print loop
    
    lsl r7, r6, #2      @ r7 = i * 4
    ldr r0, [r4, r7]    @ r0 = array[i]
    add r0, r0, #10     @ r0 += 10
    str r0, [r4, r7]    @ array[i] = r0
    
    add r6, r6, #1      @ i++
    b for_loop

print_loop:
    mov r6, #0          @ reset i = 0 
print_next:
    cmp r6, r5          @ compare i with n
    bge end_program     @ if i >= n, exit 
    lsl r7, r6, #2      @ r7 = i * 4
    ldr r1, [r4, r7]    @ r1 = array[i] 
    ldr r0,=s          @ r0 = format string
    bl printf           @ printf(s, array[i]) 
    add r6, r6, #1      @ i++
    b print_next

end_program:
    pop {r4, r5, r6, r7, pc}
