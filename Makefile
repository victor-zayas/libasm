NAME = libasm.a
NASM = nasm
NASM_FLAGS = -f elf64
AR = ar
ARFLAGS = rcs
CC = gcc
CFLAGS = -Wall -Wextra -Werror

ASM_SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s 
#ft_strdup.s
ASM_OBJS = $(ASM_SRCS:.s=.o)

TEST = test_libasm

all: $(NAME)

$(NAME): $(ASM_OBJS)
	$(AR) $(ARFLAGS) $@ $^

%.o: %.s
	$(NASM) $(NASM_FLAGS) -o $@ $<

$(TEST): main.c $(NAME)
	$(CC) $(CFLAGS) -o $@ main.c -L. -lasm

test: $(TEST)

clean:
	@rm -f $(ASM_OBJS) $(TEST)

fclean: clean
	@rm -f $(NAME)

re: fclean all


.PHONY: all clean fclean re bonus