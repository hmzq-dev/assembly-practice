; Let's assume we have a line represented by the slope-intercept equation y = 2x + 4
; The assembly below will calculate the value of y when you plug in 3 for x
mov rax, 3
mul rax, 2
add rax, 4
; rax will now store the result