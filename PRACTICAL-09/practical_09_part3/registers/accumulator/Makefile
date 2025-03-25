EXECUTABLE=AccumulatorRegisterExample

all:
	nasm -f elf64 example.asm -o example.o
	gcc -m64 -c main.c
	gcc -m64 main.o example.o -o $(EXECUTABLE)
	gdb ./$(EXECUTABLE) --tui

#Clean folder
clean:
	rm -rf *o *.lst .gdb_history $(EXECUTABLE)