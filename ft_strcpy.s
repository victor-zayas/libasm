; ft_strcpy.s
; char *ft_strcpy(char *dst, const char *src)

global ft_strcpy
section .text

ft_strcpy:
    mov     rax, rdi                ; Save dst pointer to return it
    xor     rcx, rcx                ; Initialize index to 0
.loop:
    mov     dl, byte [rsi + rcx]    ; Load byte from src[index]
    mov     byte [rdi + rcx], dl    ; Store byte to dst[index]
    test    dl, dl                  ; Check if byte is '\0'
    je      .done                   ; If '\0', finish
    inc     rcx                     ; Increment index
    jmp     .loop                   ; Repeat
.done:
    ret                             ; Return original dst pointer in rax
