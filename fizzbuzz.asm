; For every number between 1 and 100, output "fizz" if the number is divisible by 3,
; "buzz" if the number is divisible by 5, and "fizzbuzz" if it is divisible by both
; Thinking
; Loop 1 to 100
;   Check if divisible by 3 and prompt "fizz"
;   Check if divisible by 5 and prompt "buzz"
;   Check if divisible by 15 and prompt "fizzbuzz"
; Modules needed: is_factor, output_prompt
; Decide register convention for passing arguments

; Memory conventions:
; rax: immediate return value
; r12: loop counter
; r13: address of fizz, buzz, or fizzbuzz depending on what to output next

section .data
    fizz: db "fizz", 10, 13
    .len: equ $ - fizz
    buzz: db "buzz", 10, 13
    .len: equ $ - buzz
    fizzbuzz: db "fizzbuzz", 10, 13
    .len: equ $ - fizzbuzz

section .text
    global _start

_start:
    mov r13, fizz
    call output_result
    call exit

output_result:
    mov rax, 1
    mov rdi, 1
    mov rsi, [r13]
    mov rdx, [r13].len
    syscall
    ret

exit:
    mov rax, 60
    mov rdi, 0
    syscall
    
