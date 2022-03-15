NAME	=	born2bebot
CFLAGS	=	-Wall -Wextra -Werror -pedantic $(WNO) -fsanitize=address -g -Llibft -lft
WNO		=	-Wno-unused-variable -Wno-unused-parameter -Wno-unused-function -Wno-unused-private-field

IDIR	=	inc
SDIR	=	src

IDIRFT	=	libft/include

_SRC	=	main utils timer bot input init logic mcts/mcts

SRC		=	$(addsuffix .c, $(addprefix $(SDIR)/, $(_SRC)))

ifeq ($(shell uname -s),Linux)
	CFLAGS += -lbsd -pthread -lm
endif

all:
	$(MAKE) -C libft
	$(CC) -I$(IDIR) -I$(IDIRFT) -o $(NAME) $(SRC) $(CFLAGS)

fclean:
	rm -rf $(NAME)

re: fclean all

test: all
	clear
	./$(NAME)
