; ft_strlen.s
; size_t ft_strlen(const char *s)

global ft_strlen
section .text

ft_strlen:
    xor     rax, rax                ; Initialize counter to 0
.loop:  
    cmp     byte [rdi + rax], 0     ; Compare current byte with '\0'
    je      .done                   ; If '\0', finish
    inc     rax                     ; Increment counter
    jmp     .loop                   ; Repeat
.done:  
    ret                             ; Return length in rax
