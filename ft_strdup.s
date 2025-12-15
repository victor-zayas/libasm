; ft_strdup.s
; char *ft_strdup(const char *s)

global ft_strdup
section .text

extern malloc
extern ft_strlen

ft_strdup:
