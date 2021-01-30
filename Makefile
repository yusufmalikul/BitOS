boot.bin:
	nasm -f bin boot.asm -o boot.bin

qemu: boot.bin
	qemu-system-x86_64 -machine accel=kvm -curses -drive file=boot.bin,format=raw

clean:
	rm *.bin 
