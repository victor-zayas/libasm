#include "libasm.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

int main(void)
{
    const char *s = "HelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHello";
    char *buf;
    char *dup;

    printf("ft_strlen: %zu \n(expected: %zu)\n\n", ft_strlen(s), strlen(s));

    size_t len = ft_strlen(s);
    size_t buf_size;
    if (len >= 128)
        buf_size = len + 1;
    else
        buf_size = 128;
    
    buf = malloc(buf_size);
    if (!buf)
    {
        perror("malloc failed");
        return 1;
    }

    ft_strcpy(buf, s);
    printf("ft_strcpy: %s \n(expected: %s)\n\n", buf, s);

    printf("ft_strcmp equal: %d (expected: 0)\n", ft_strcmp("abc", "abc"));
    printf("ft_strcmp empty: %d (expected: 0)\n", ft_strcmp("", ""));
    printf("ft_strcmp s1 > s2: %d (expected: >0)\n", ft_strcmp("abd", "abc"));
    printf("ft_strcmp s1 < s2: %d (expected: <0)\n", ft_strcmp("abc", "abd"));
    printf("ft_strcmp s1 empty: %d (expected: <0)\n", ft_strcmp("", "abc"));
    printf("ft_strcmp s2 empty: %d (expected: >0)\n\n", ft_strcmp("abc", ""));

    ssize_t w = ft_write(1, "ft_write test\n", 14);
    printf("ft_write returned: %zd (errno=%d)\n\n", w, errno);

    printf("Please enter some text for ft_read test:\n");
    ssize_t r = ft_read(0, buf, buf_size - 1);
    printf("ft_read returned: %zd (errno=%d)\n", r, errno);
    if (r > 0)
    {
        buf[r] = 0;
        printf("Read: %s\n\n", buf);
        
        if (r == (ssize_t)(buf_size - 1) && buf[r - 1] != '\n')
        {
            char discard;
            while (ft_read(0, &discard, 1) > 0 && discard != '\n')
                ;
        }
    }
    else if (r < 0)
    {
        perror("ft_read failed");
    }

    free(buf);

    dup = ft_strdup(s);
    if (dup)
    {
        printf("ft_strdup: %s \n(expected %s)\n", dup, s);
        free(dup);
    }
    else
    {
        perror("ft_strdup failed");
    }

    return 0;
}
