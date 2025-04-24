; For every number between 1 and 100, output "fizz" if the number is divisible by 3,
; "buzz" if the number is divisible by 5, and "fizzbuzz" if it is divisible by both

section .data
    fizz: db "fizz", 0
    buzz: db "buzz", 0
    plus: db 58, 32, 0
    newline: db 10, 13, 0


section .text
    global _start


_start:
    ; r13 is loop counter
    mov r13, 0
    call iterate
    call exit


iterate:
    inc r13

    ; Print plus sign to signify new line
    mov rsi, plus
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
