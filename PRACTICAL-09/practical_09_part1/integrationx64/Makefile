EXECUTABLE=IntegratingCandASM

all:
	nasm -f elf64 add.asm -o add.o -l starter.lst
	gcc -m64 -c main.c
	gcc -m64 main.o add.o -o $(EXECUTABLE)
	./$(EXECUTABLE)

#Clean folder
clean:
	rm -rf *o *.lst $(EXECUTABLE)