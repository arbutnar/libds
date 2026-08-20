ARCHIVE = libds.a
FLAGS = -Wall -Wextra -Werror -g

SUBDIRS = ft_list ft_btree ft_map
SUBARCHIVES = $(foreach dir,$(SUBDIRS),$(dir)/$(dir).a)
OBJECTS = $(foreach dir,$(SUBDIRS),$(wildcard $(dir)/obj/*.o))


all: $(ARCHIVE)

$(ARCHIVE): $(SUBARCHIVES)
	$(info archiving $(ARCHIVE))
	@ar rcs $@ $(OBJECTS)

$(SUBARCHIVES): FORCE
	$(info calling $(@D) Makefile)
	@$(MAKE) -C $(@D)

FORCE:

clean:
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir $@; \
	done

fclean:
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir $@; \
	done
	$(info deleting $(ARCHIVE))
	@rm -f $(ARCHIVE)

re: fclean all

.PHONY: all clean fclean re
