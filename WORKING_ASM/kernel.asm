format binary as 'img'

PERIPHERAL_BASE = $3F000000 ; Raspberry Pi 2 Peripheral Base Address

GPBASE  = $200000 ; $3F200000
GPFSEL1 =      $4 ; $3F200004
GPSET1  =     $20 ; $3F200020
GPCLR1  =     $2C ; $3F20002C

org $8000

mov r0,PERIPHERAL_BASE
orr r0,GPBASE ; R0 = GPBASE
ldr r1,[r0,GPFSEL1] ; R1 = GPFSEL1
mov r2,7
and r1,r2,lsl 18 ; &= 7 << 18
mov r2,1
orr r1,r2,lsl 18 ; |= 1 << 18
str r1,[r0,GPFSEL1]

mov r2,r2,lsl 15 ; 1 << 15
Loop:
  str r2,[r0,GPSET1]
  mov r1,$100000
  WaitA:
    subs r1,1
    bne WaitA
  str r2,[r0,GPCLR1]
  mov r1,$100000
  WaitB:
    subs r1,1
    bne WaitB

  b Loop
