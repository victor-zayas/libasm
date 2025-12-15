; ft_read.s
; ssize_t ft_read(int fd, void *buf, size_t count)

global  ft_read
section .text

extern  __errno_location

ft_read:
    mov     rax, 0              ; SYS_read
    syscall                     ; use rdi=fd, rsi=buf, rdx=count
 
    cmp     rax, 0 
    jge     .ok                 ; success rax >= 0 | error rax = -errno
 
    neg     rax                 ; rax = positive errno
    mov     rcx, rax            ; rcx = positive errno
    sub     rsp, 8              ; align the stack
    call    __errno_location wrt ..plt    ; rax = &errno (PIE-compatible)
    add     rsp, 8              ; restore stack
    mov     dword [rax], ecx    ; *errno = ecx (4 bytes)
    mov     rax, -1             ; return standard error
    ret

.ok:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
