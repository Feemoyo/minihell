# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fmoreira <fmoreira@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/12 14:08:18 by fmoreira          #+#    #+#              #
#    Updated: 2022/09/12 15:18:43 by fmoreira         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_DIR =	./src
SRC		=	ft_minishell.c

OBJ_DIR =	./obj
OBJ		=	$(patsubst	%.c, $(OBJ_DIR)/%.o, $(SRC))

INCD_DIR	=	./include
INCD		=	minishell.h

vpath	%.c	$(SRC_DIR)
vpath	%.h $(INCD_DIR)

CC		= gcc
NAME	= minishell
CFLAGS	= -Wall -Wextra -Werror
RM		= rm -rf

LIBFT_DIR	=	./libs/libft/
LIBFT		=	./libs/libft/libft.a

all:	$(NAME)

$(NAME):		$(OBJ) $(LIBFT)
				@$(CC) $(OBJ) $(LIBFT) -o $(NAME)

$(LIBFT):		
				@make -C $(LIBFT_DIR)

$(OBJ_DIR)/%.o:	%.c	$(INCD_DIR)
				@mkdir -p $(OBJ_DIR)
				@$(CC) -c -o $@ -I $(INCD_DIR) $<

clean:
				@$(RM) $(OBJ_DIR)
				@make -C $(LIBFT_DIR) clean

fclean:			clean
				@$(RM) $(NAME)
				@make -C $(LIBFT_DIR) fclean
				
re:				fclean all

.PHONY:	all clean fclean re