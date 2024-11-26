all: fork fork_test

fork: fork.o
	ld -o fork fork.o

fork.o: fork.s
	as -o fork.o fork.s

fork_test: fork_test.c
	${CC} -o fork_test fork_test.c

clean:
	rm fork fork.o fork_test
