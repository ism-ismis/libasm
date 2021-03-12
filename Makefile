# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ishirais <ishirais@student.42tokyo.jp>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/12 14:18:35 by ishirais          #+#    #+#              #
#    Updated: 2021/03/12 14:19:33 by ishirais         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libasm.a

AS		=	nasm
AFLAGS	=	-f macho64
RM		=	rm -rf
CC		=	gcc
CFLAGS	=	-Wall -Wextra -Werror

SRCDIR	=	srcs/
SRCNAME	=	ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s
SRCS	=	$(addprefix $(SRCDIR), $(SRCNAME))
OBJS	=	$(SRCS:.s=.o)
.s.o:
			$(AS) $(AFLAGS) -s $< -o $(<:.s=.o)
$(NAME):	$(OBJS)
			ar rc $@ $(OBJS)
all:		$(NAME)
clean:
			$(RM) $(OBJS)
fclean:		clean
			$(RM) $(NAME) test test.log
re:			fclean all
test:		$(NAME)
			$(CC) $(CFLAGS) -L. -lasm -o test main.c
.PHONY:		all clean fclean re

