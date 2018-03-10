OK=\033[32;01m
KO=\033[0m
ASOPTS=--gstabs

all: exit fibo strlen hello max

exit:
	@echo -e "${OK}× Building exit${KO}"
	as $(ASOPTS) -o 1-exit/exit.o 1-exit/exit.asm
	ld -o bin/exit 1-exit/exit.o

fibo:
	@echo -e "${OK}× Building fibo${KO}"
	as $(ASOPTS) -o 2-fibo/fibo.o 2-fibo/fibo.asm
	ld -o bin/fibo 2-fibo/fibo.o

strlen:
	@echo -e "${OK}× Building strlen${KO}"
	as $(ASOPTS) -o 3-strlen/strlen.o 3-strlen/strlen.asm
	ld -o bin/strlen 3-strlen/strlen.o

hello:
	@echo -e "${OK}× Building hello${KO}"
	as $(ASOPTS) -o 4-hello/hello.o 4-hello/hello.asm
	ld -o bin/hello 4-hello/hello.o

max:
	@echo -e "${OK}× Building max${KO}"
	as $(ASOPTS) -o 5-max/max.o 5-max/max.asm
	ld -o bin/max 5-max/max.o

clean: clean-o clean-bin

clean-o:
	rm -rf ./**/*.o

clean-bin:
	rm -f ./bin/*

.PHONY: hello
