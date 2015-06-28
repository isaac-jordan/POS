#!/bin/sh
compiler=arm-none-eabi
code=./kernel
boot=./boot

# First let's compile our assembly file.
$compiler-as $code/init.asm -o $code/init.o

# Then let's call the linker to generate a binary output.
$compiler-ld $code/init.o -o $code/kernel.elf

# Then let's dump some debug info to disk.
$compiler-objdump -D $code/init.o > $code/init.disassembled.asm
$compiler-objdump -D $code/kernel.elf > $code/kernel.disassembled.asm

# Lastly let's copy our binary into an img format.
$compiler-objcopy $code/kernel.elf -O binary $boot/kernel.img

echo "Finished compiling!"
