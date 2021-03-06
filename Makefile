# Ces cibles ne sont pas des vrais fichiers
.PHONY: clean

# On désactive toutes les règles implicites

# Déclarations de constantes
CC = gcc
CFLAGS = -Wall -Werror -W 
SRC = $(wildcard *.c)
OBJS = $(SRC:.c=.o)


program: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(OBJS): $(SRC)
	$(CC) $(CFLAGS) -c $^

makefile.dep: $(SRC)
	gcc -MM $^ > $@

clean:
	rm -f *.o program

include makefile.dep
