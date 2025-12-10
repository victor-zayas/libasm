; ft_strcmp.s
; int ft_strcmp(const char *s1, const char *s2)

global ft_strcmp
section .text

ft_strcmp:
    xor     rcx, rcx                ; Initialize index to 0
.loop:
    mov     al, byte [rdi + rcx]    ; Load byte from s1[index]
    mov     dl, byte [rsi + rcx]    ; Load byte from s2[index]
    cmp     al, dl                  ; Compare s1[index] with s2[index]
    jne     .differ                 ; If different, calculate difference
    test    al, al                  ; Check if s1[index] is '\0'
    je      .equal                  ; If '\0', strings are equal
    inc     rcx                     ; Increment index
    jmp     .loop                   ; Repeat
.differ:    
    movzx   rax, al                 ; Zero-extend s1 byte to rax
    movzx   rdx, dl                 ; Zero-extend s2 byte to rdx
    sub     rax, rdx                ; Calculate s1 - s2
    ret                             ; Return difference in rax
.equal: 
    xor     rax, rax                ; Return 0 (strings are equal)
    ret
