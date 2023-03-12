arm-none-eabi-gcc -g start.c -c -o start.o

arm-none-eabi-ld start.o  -T test.ld -o start

objdump -S start

objdump -s start

arm-none-eabi-gdb start

target remote localhost:3333

monitor reset

monitor halt