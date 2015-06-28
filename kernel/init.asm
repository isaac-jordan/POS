.global _start
_start:
    ;@ Setup the stack pointer.
    MOV sp,#0x8000
    b hang
hang:
    b hang
