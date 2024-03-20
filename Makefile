SHELL := /bin/sh
CC = clang
CFLAGS = -Wall -Wpedantic -Werror -Wextra

all: monte_carlo

monte_carlo: monte_carlo.o
	$(CC) -o monte_carlo monte_carlo.o

monte_carlo.o: monte_carlo.c
	$(CC) $(CFLAGS) -c monte_carlo.c

clean:
	rm -f monte_carlo *.o mc_data.dat inside_circle.dat outside_circle.dat pi_error1.dat pi_error2.dat pi_error3.dat pi_error4.dat monte_carlo.pdf error.pdf

format:
	clang-format -i -style=file *.[ch]

