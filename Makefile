ARC     =   libds.a
HDR     =   libds.h
SRC_DIR =   src
OBJ_DIR =   obj
SRC     =   $(wildcard $(SRC_DIR)/*.c)
OBJ     =   $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))

FLAGS   =   -Wall -Wextra -Werror -g

LIST    =   ft_list
LIST_A  =   $(LIST)/$(LIST).a

BTREE   =   ft_btree
BTREE_A =   $(BTREE)/$(BTREE).a

all: $(ARC)

$(ARC): $(OBJ) $(LIST_A) $(BTREE_A)
    ar rcs $(ARC) $^

$(LIST_A) $(BTREE_A):
    $(MAKE) -C $(dir $@)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(HDR)
    @mkdir -p $(OBJ_DIR)
    gcc $(FLAGS) -I. -c $< -o $@

clean:
    $(MAKE) -C $(LIST) clean
    $(MAKE) -C $(BTREE) clean
    rm -rf $(OBJ_DIR)

fclean: clean
    $(MAKE) -C $(LIST) fclean
    $(MAKE) -C $(BTREE) fclean
    rm -f $(ARC)

re: fclean all

.PHONY: all clean fclean re
