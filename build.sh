#!/bin/sh
compiler=arm-none-eabi
code=./kernel
boot=./boot

arm-none-eabi-gcc -DRPI2 -O2 -mfpu=neon-vfpv4 -mfloat-abi=hard -mcpu=cortex-a7 -march=armv7-a -mtune=cortex-a7 -nostartfiles -nostdlib -ffreestanding -g $code/blinkingOK.c -o kernel.elf
arm-none-eabi-objcopy kernel.elf -O binary $boot/kernel.img

echo "Finished compiling!"

#arm-none-eabi-gcc -O2 -DRPI2 -mfpu=neon-vfpv4 -mfloat-abi=hard -march=armv7-a -mtune=cortex-a7 -nostartfiles -g $code/rpi.c -o kernel.elf
