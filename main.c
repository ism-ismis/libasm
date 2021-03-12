/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ishirais <ishirais@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/11 23:58:21 by ishirais          #+#    #+#             */
/*   Updated: 2021/03/12 14:25:58 by ishirais         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <stdlib.h>

size_t	ft_strlen(char *str);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(const char *s1);

void	check_strlen(char *str)
{
	if (strlen(str) == ft_strlen(str))
		printf("\x1b[32m[OK]\x1b[39m ");
	else
		printf("\x1b[31m[NG]\x1b[39m ");
	printf(" strlen:%lu  ft:%lu\n", strlen(str), ft_strlen(str));

}

void	check_strcpy(char *src)
{
	char	dst1[1000];
	char	dst2[1000];

	strcpy(dst1, src);
	ft_strcpy(dst2, src);
	if (!strcmp(dst1, dst2))
		printf("\x1b[32m[OK]\x1b[39m ");
	else
		printf("\x1b[31m[NG]\x1b[39m ");
	printf("strcpy:%s  ft:%s\n", dst1, dst2);
}

void	check_strcmp(char *str1, char *str2)
{
	int	ret1;
	int	ret2;

	ret1 = strcmp(str1, str2);
	ret2 = ft_strcmp(str1, str2);
	if ((ret1 < 0 && ret2 < 0) || (ret1 == 0 && ret2 == 0) || (ret1 > 0 && ret2 > 0))
		printf("\x1b[32m[OK]\x1b[39m ");
	else
		printf("\x1b[31m[NG]\x1b[39m ");
	printf("strcmp:%d  ft:%d\n", ret1, ret2);
}

void	check_write(int fd, char *str, int size)
{
	int	ret1;
	int	ret2;
	int errno1 = 0;
	int errno2 = 0;

	errno = 0;
	write(fd, "write:", 6);
	ret1 = write(fd, str, size);
	if (errno)
		errno1 = errno;
	write(fd, "\n", 1);
	errno = 0;
	write(fd, "ft:", 3);
	ret2 = ft_write(fd, str, size);
	if (errno)
		errno2 = errno;
	write(fd, "\n", 1);
	if ((ret1 == ret2) && (errno1 == errno2))
		printf("\x1b[32m[OK]\x1b[39m ");
	else
		printf("\x1b[31m[NG]\x1b[39m ");
	printf("[ret]write:%d  ft:%d [errno]write:%d ft:%d\n", ret1, ret2, errno1, errno2);
}

void	check_read(int fd1, int fd2)
{
	char	buf1[100];
	char	buf2[100];
	int		i;
	int		ret1;
	int		ret2;
	int		errno1 = 0;
	int		errno2 = 0;

	errno = 0;
	i = 0;
	while(i < 100)
	{
		buf1[i] = 0;
		buf2[i] = 0;
		i++;
	}
	ret1 = read(fd1, buf1, 99);
	errno1 = errno;
	errno = 0;
	ret2 = ft_read(fd2, buf2, 99);
	errno2 = errno;
	if (errno == 0)
	{
		if (!(strcmp(buf1, buf2)) && (ret1 == ret2) && (errno1 == errno2))
			printf("\x1b[32m[OK]\x1b[39m");
		else
			printf("\x1b[31m[NG]\x1b[39m");
		printf("[buf]read:%s  ft:%s  [ret]read:%d ft:%d  [errno]read:%d, ft:%d\n", buf1, buf2, ret1, ret2, errno1, errno2);
	}
	else
	{
		if ((ret1 == ret2) && (errno1 == errno2))
			printf("\x1b[32m[OK]\x1b[39m\n");
		else
			printf("\x1b[31m[NG]\x1b[39m\n");
		printf("[buf]read:%s  ft:%s  [ret]read:%d ft:%d  [errno]read:%d, ft:%d\n", buf1, buf2, ret1, ret2, errno1, errno2);
	}
}

void	check_strdup(char *str)
{
	char	*dup1;
	char	*dup2;

	dup1 = strdup(str);
	dup2 = ft_strdup(str);
	if (!(strcmp(dup1, dup2)))
		printf("\x1b[32m[OK]\x1b[39m  ");
	else
		printf("\x1b[31m[NG]\x1b[39m  ");
	printf("strdup:%s ft:%s\n", dup1, dup2);
	free(dup1);
	free(dup2);
}

int 	main(void)
{
	char	str1[] = "hello world!!";
	char	str2[] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
	char	str3[] = "";
	char	str4[] = "\n";
	char	str5[] = "oeiruowkflsdl238912kw*a;le";
	char	str6[] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.x";
	int		fd1;
	int		fd2;

	printf("----test strlen----\n\n");
	check_strlen(str1);
	check_strlen(str2);
	check_strlen(str3);
	check_strlen(str4);
	check_strlen(str5);
	printf("\n");

	printf("----test strcpy----\n\n");
	check_strcpy(str1);
	check_strcpy(str2);
	check_strcpy(str3);
	check_strcpy(str4);
	check_strcpy(str5);
	printf("\n");
	
	printf("----test strcmp----\n\n");
	check_strcmp("good", "good");
	check_strcmp("", "");
	check_strcmp("good", "");
	check_strcmp("", "good");
	check_strcmp("good", "goodo");
	check_strcmp("goodo", "good");
	check_strcmp(str2, str2);
	check_strcmp(str2, str6);
	printf("\n");
	
	printf("----test write----\n\n");
	check_write(1, str1, strlen(str1));
	fd1 = open("./test.log", O_RDWR | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
	check_write(fd1, str1, strlen(str1));
	check_write(fd1, str2, strlen(str2));
	check_write(fd1, str3, strlen(str3));
	check_write(fd1, str4, strlen(str4));
	check_write(fd1, str1, 0);
	check_write(fd1, str4, strlen(str4));
	check_write(125, str1, strlen(str1));
	close(fd1);
	printf("\n");
	
	printf("----test read----\n\n");
	fd1 = open("./sample.txt", O_RDONLY);
	fd2 = open("./sample.txt", O_RDONLY);
	check_read(fd1, fd2);
	printf("Enter a same word twice to check stdin.\n");
	check_read(0, 0);
	check_read(125, 125);
	close(fd1);
	close(fd2);
	printf("\n");

	printf("----test strdup----\n\n");
	check_strdup(str1);
	check_strdup(str2);
	check_strdup(str3);
	check_strdup(str4);
	check_strdup(str5);
	return (0);
}
