; ft_strlen.s
; size_t ft_strlen(const char *s)

global ft_strlen
section .text

ft_strlen:
    ; rdi = s
    xor     rax, rax
    ; length = 0
    mov     rcx, rdi
.find_nul:
    mov     dl, byte [rcx]
    cmp     dl, 0
    je      .done
    inc     rax
    inc     rcx
    jmp     .find_nul
.done:
    ret
