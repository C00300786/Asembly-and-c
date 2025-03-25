AS=nasm #Assembly compiler
ASFLAGS=-f elf64 -g -l gameloop.lst #Assembly flags 32 Bit
LD=ld #Lmainker
LDFLAGS=#Linker flags

SOURCES=$(wildcard ./*.asm) #Sources
OBJECTS=$(SOURCES:.asm=.o) #Object files
EXECUTABLE=StarterKitx64

#Check version
all: $(SOURCES) $(EXECUTABLE)

#Create executable
$(EXECUTABLE): $(OBJECTS) 
	$(LD) $(LDFLAGS) $(OBJECTS) -o $@

#Compile assembly program
$(OBJECTS): $(SOURCES)
	$(AS) $(ASFLAGS) $(SOURCES)
 
#Clean folder
clean:
	rm -rf *o *.lst $(EXECUTABLE)