#!/bin/bash

if [ -z $1 ]; then
    echo "Try running this script again with name of assembly file as argument (without extension)"
else 
    # Generates object code (in elf64 format and debugging) from source code
    nasm $1.asm -f elf64 -g -F dwarf -o ./object-code/$1.o

    # Linker: Generates the executable file from object code
    ld ./object-code/$1.o -o ./executables/$1

    # Runs the executable file
    ./executables/$1
fi
