; ft_write.s
; ssize_t ft_write(int fd, const void *buf, size_t count)

global  ft_write
section .text

extern  __errno_location

ft_write:
    mov     rax, 1              ; SYS_write
    syscall                     ; use rdi=fd, rsi=buf, rdx=count
 
    cmp     rax, 0 
    jge     .ok                 ; success rax >= 0 | error rax = -errno
 
    neg     rax                 ; rax = positive errno
    mov     rcx, rax            ; rcx = rax
    sub     rsp, 8              ; align the stack
    call    __errno_location wrt ..plt    ; rax = &errno (PIE-compatible)
    add     rsp, 8                
    mov     dword [rax], ecx    ; *errno = ecx (4 bytes)
    mov     rax, -1             ; return standar error
    ret

.ok:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits