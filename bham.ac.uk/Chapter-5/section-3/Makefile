# Automatically generate lists of sources using wildcards
C_SOURCES = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)

# TODO: Make sources dep on all header files

# Convert the *.c filenames to *.o to give a list of object files to build
OBJ = ${C_SOURCES:.c=.o}

# Default build target
all: os-image

# Run bochs to simulate booting of our code.
run: all
	bochs

# This is the actual disk image that bochs loads
# a combination of our compiled bootsector and kernel
os-image: boot/boot.bin kernel.bin
	cat $^ > os-image

# Builds a binary of our kernel
kernel.bin: kernel/kernel_entry.o ${OBJ}
	ld -o $@ -Ttext 0x1000 $^ --oformat binary

# Builds kernel object file
%.o : %.c ${HEADERS}
	gcc -ffreestanding -c $< -o $@

# Builds kernel entry object file
%.o : %.asm
	nasm $< -f elf -o $@

# Assemble boot sector to raw machine code
%.bin : %.asm
	nasm $< -f bin -I '../../16bit/' -o $@

# Clear any generated files
clean:
	rm -rf *.bin *.o *.dis os-image *.map

# Disassemble kernel for debugging
kernel.dis : kernel.bin
	ndisasm -b 32 $< > $@
