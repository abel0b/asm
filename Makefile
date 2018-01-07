OK=\033[32;01m
KO=\033[0m
ASOPTS=--gstabs

all: exit fibo

exit:
	@echo -e "${OK}× Building exit${KO}"
	as $(ASOPTS) -o 1-exit/exit.o 1-exit/exit.asm
	ld -o bin/exit 1-exit/exit.o

fibo:
	@echo -e "${OK}× Building fibo${KO}"
	as $(ASOPTS) -o 2-fibo/fibo.o 2-fibo/fibo.asm
	ld -o bin/fibo 2-fibo/fibo.o

clean: clean-o clean-bin

clean-o:
	rm -rf ./**/*.o

clean-bin:
	rm -f ./bin/*

.PHONY: hello
