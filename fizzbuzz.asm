; For every number between 1 and 100, output "fizz" if the number is divisible by 3,
; "buzz" if the number is divisible by 5, and "fizzbuzz" if it is divisible by both
; Thinking
; Loop 1 to 100
;   Check if divisible by 3 and prompt "fizz"
;   Check if divisible by 5 and prompt "buzz"
;   Check if divisible by 15 and prompt "fizzbuzz"

section .data
    fizz: db "fizz", 10, 13, 0
    buzz: db "buzz", 10, 13, 0
    fizzbuzz: db "fizzbuzz", 10, 13, 0


section .text
    global _start


_start:
    mov rsi, fizz
    call dynamic_output
    call exit


dynamic_output:
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
    