
.section .data

Numbers:
    .long 1, 15, 4, 2, 7, 9, 23, 7, 3, 11

Array_length:
    .long 10

message:
    .asciz "Maximum value: %d\n"

.section .text
.globl main

main:
    pushq %rbp
    movq %rsp, %rbp

    leaq Numbers(%rip), %r8
    movl (%r8), %esi
    movl $1, %ecx
    movl Array_length(%rip), %edx

while_loop:
    cmpl %edx, %ecx
    jge finished

    movl (%r8,%rcx,4), %eax
    cmpl %esi, %eax
    jle next_number

    movl %eax, %esi

next_number:
    incl %ecx
    jmp while_loop

finished:
    leaq message(%rip), %rdi
    movl $0, %eax
    call printf@PLT

    movl $0, %eax
    popq %rbp
    ret

.section .note.GNU-stack,"",@progbits
