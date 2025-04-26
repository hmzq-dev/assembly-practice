; For every number between 1 and 100, output "fizz" if the number is divisible by 3,
; "buzz" if the number is divisible by 5, and "fizzbuzz" if it is divisible by both

section .data
    fizz: db "fizz", 0
    buzz: db "buzz", 0
    colon: db 58, 32, 0
    newline: db 10, 13, 0


section .bss
    iteration_counter: resb 3


section .text
    global _start


_start:
    ; r13 is loop counter
    mov r13, 0
    call iterate
    call exit


iterate:
    inc r13
    ; copy counter to r11 for manipulation
    mov r11, r13

    ; Print iteration counter
    mov r15, 0
    mov r14, 10
    mov r9, 1
    call two_digit
    call three_digit

    call int_to_ascii
    mov rsi, iteration_counter
    call output
    mov rsi, colon
    call output

    ; Check if divisible by 3
    mov r14, 3
    call get_remainder
    call output_fizz

    ; Check if divisible by 5
    mov r14, 5
    call get_remainder
    call output_buzz

    ; Print new line
    mov rsi, newline
    call output

    cmp r13, 100
    jne iterate
    ret


two_digit:
    cmp r13, 10
    jl return
    inc r9
    mov rax, r14
    mov r10, 10
    mul r10
    mov r14, rax
    ret


three_digit:
    cmp r13, 100
    jl return
    inc r9
    mov rax, r14
    mov r10, 10
    mul r10
    mov r14, rax
    ret


int_to_ascii:
    ; r15 -> loop counter, r14 -> divisor
    mov rdx, 0
    mov rax, r14
    mov r10, 10
    div r10
    mov r14, rax

    mov rax, r11
    mov rdx, 0
    div r14
    add rax, 48
    mov byte [iteration_counter + r15], al
    mov r11, rdx

    ; Loop condition
    inc r15
    cmp r15, r9
    jne int_to_ascii
    ret


output_fizz:
    cmp rdx, 0
    jne return
    mov rsi, fizz
    call output
    ret


output_buzz:
    cmp rdx, 0
    jne return
    mov rsi, buzz
    call output
    ret


get_remainder:
    ; Quotient in rax, divisor in r14
    mov rax, r13
    mov rdx, 0
    div r14
    ; Remainder is stored in rdx
    ret


output:
    ; Output a string with unknown length
    ; mov string address to rsi before calling this function
    mov rax, 1
    mov rdi, 1
    ; Calculate string length
    mov r11, 0
    call calculate_length

    mov rdx, r11
    syscall
    ret


calculate_length:
    mov r12b, [rsi + r11]
    inc r11
    cmp r12, 0
    jne calculate_length
    ret


exit:
    mov rax, 60
    mov rdi, 0
    syscall
    

return:
    ret
