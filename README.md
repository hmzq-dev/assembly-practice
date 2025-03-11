Assembly language used: X86-64 Intel

To assemble the code with NASM on linux and execute it, run the following commands in the main project directory:

`nasm file.asm -f elf64 -o ./object-code/file.o`

Generates object code (in elf64 format) from source code

`ld ./object-code/file.o -o ./executables/file -m elf_x86_64`

Linker: Generates the executable file from object code

`./executables/file`

Runs the executable file
