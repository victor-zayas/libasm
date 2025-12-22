; ft_strdup.s
; char *ft_strdup(const char *s)

global ft_strdup
<<<<<<< HEAD
section .text

extern malloc
extern ft_strlen

ft_strdup:
=======
extern malloc

section .text

ft_strdup:
    push    rdi                     ; Save original string pointer
    xor     rcx, rcx                ; Initialize counter to 0
.get_len:
    cmp     byte [rdi + rcx], 0     ; Check if current byte is '\0'
    je      .alloc                  ; If '\0', proceed to allocation
    inc     rcx                     ; Increment counter
    jmp     .get_len                ; Repeat
.alloc:
    inc     rcx                     ; Add 1 for null terminator
    push    rcx                     ; Save length+1 for later
    mov     rdi, rcx                ; Set malloc argument (size)
    call    malloc wrt ..plt        ; Call malloc via PLT
    test    rax, rax                ; Check if malloc failed
    jz      .error                  ; If NULL, return NULL
    
    pop     rcx                     ; Restore length+1
    pop     rsi                     ; Restore original string pointer to rsi
    mov     rdi, rax                ; Destination = allocated memory
    xor     rdx, rdx                ; Initialize index to 0
.copy:
    mov     cl, byte [rsi + rdx]    ; Load byte from source[index]
    mov     byte [rdi + rdx], cl    ; Store byte to dest[index]
    test    cl, cl                  ; Check if byte is '\0'
    je      .done                   ; If '\0', finish
    inc     rdx                     ; Increment index
    jmp     .copy                   ; Repeat
.done:
    ret                             ; Return pointer to new string in rax
.error: 
    pop     rcx                     ; Clean stack
    pop     rdi                     ; Clean stack
    xor     rax, rax                ; Return NULL
    ret
>>>>>>> 71a8c8d (ft_strdup done)
