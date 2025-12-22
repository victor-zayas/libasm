#include "libasm.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

int main(void)
{
    const char *s = "Hello";
    char buf[64];
    char *dup;

    printf("ft_strlen: %zu (expected: %zu)\n", ft_strlen(s), strlen(s));

    ft_strcpy(buf, s);
    printf("ft_strcpy: %s (expected: %s)\n", buf, s);

    printf("ft_strcmp equal: %d (expected: 0)\n", ft_strcmp("abc", "abc"));
    printf("ft_strcmp empty: %d (expected: 0)\n", ft_strcmp("", ""));
    printf("ft_strcmp s1 > s2: %d (expected: >0)\n", ft_strcmp("abd", "abc"));
    printf("ft_strcmp s1 < s2: %d (expected: <0)\n", ft_strcmp("abc", "abd"));
    printf("ft_strcmp s1 empty: %d (expected: <0)\n", ft_strcmp("", "abc"));
    printf("ft_strcmp s2 empty: %d (expected: >0)\n", ft_strcmp("abc", ""));

    ssize_t w = ft_write(1, "ft_write test\n", 14);
    printf("ft_write returned: %zd (errno=%d)\n", w, errno);

    printf("Please enter up to 20 characters for ft_read test:\n");
    ssize_t r = ft_read(0, buf, 20);
    printf("ft_read returned: %zd (errno=%d)\n", r, errno);
    if (r > 0)
    {
        buf[r] = 0;
        printf("Read: %s\n", buf);
    }

    dup = ft_strdup(s);
    if (dup)
    {
        printf("ft_strdup: %s (expected %s)\n", dup, s);
        free(dup);
    }
    else
    {
        perror("ft_strdup failed");
    }

    return 0;
}
