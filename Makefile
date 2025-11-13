# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rinka <rinka@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/08/08 19:14:52 by rinka             #+#    #+#              #
#    Updated: 2025/11/13 15:03:04 by rinka            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell

SRCS = \
	main.c \
	minishell_util.c \
	signal.c \
	builtins/env_util.c \
	builtins/env_lst_utils.c \
	builtins/cmd/ft_cd.c \
	builtins/cmd/ft_echo.c \
	builtins/cmd/ft_env.c \
	builtins/cmd/ft_exit.c \
	builtins/cmd/ft_export.c \
	builtins/cmd/ft_pwd.c \
	builtins/cmd/ft_unset.c \
	exec_cmd/pipe.c \
	exec_cmd/buildin.c \
	exec_cmd/redirect.c \
	exec_cmd/parent_builtin.c \
	exec_cmd/child_builtin.c \
	exec_cmd/child_external_search_path.c \
	parser/ft_cmdlst_utils.c \
	parser/join_expanded_tokens.c \
	parser/ft_parser_utils.c \
	parser/ft_parser.c \
	parser/ft_redirectlst_utils.c \
	parser/ft_heredoc.c \
	parser/ft_globbing.c \
	tokenizer/ft_tokenizer.c \
	tokenizer/ft_tokenlst_utils.c \
	tokenizer/ft_tokenlst_sort.c \
	utils/ft_free.c \
	utils/ft_handle_unclosed_quote.c \

OBJS = $(SRCS:.c=.o)

CC = cc
CFLAGS = -Wall -Wextra -Werror

LIBFT_DIR = libft
LIBFT = $(LIBFT_DIR)/libft.a

# linux
INCLUDE = -I./include
LDFLAGS = -lreadline

# mymac
# INCLUDE = -I./include -I/usr/local/opt/readline/include
# LDFLAGS = -L/usr/local/opt/readline/lib -lreadline

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

all: $(NAME)

$(NAME): $(LIBFT) $(OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(LIBFT) $(LDFLAGS)

$(LIBFT):
	make -C $(LIBFT_DIR)

clean:
	$(RM) $(OBJS)
	make -C $(LIBFT_DIR) fclean

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
