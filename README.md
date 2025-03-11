Assembly language used: X86-64 Intel

To assemble the code with NASM, run the following commands:
```shell
nasm -f elf file.asm
ld -m elf_i386 -s -o file file.o 
```