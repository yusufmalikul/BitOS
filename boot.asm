; boot.asm

; first 512 bytes (MBR) will be loaded by BIOS
; to the memory RAM address at 0x07c0
; Then BIOS job is done because the control
; is given to code at 0x07c0
; So we must set our code location by setting the ds
; to 0x07c0
mov ax, 0x07c0
mov ds, ax

mov ah, 0x0
mov al, 0x3
int 0x10

mov si, msg
mov ah, 0x0E

print_character_loop:
	lodsb

	cmp al, 0
	jz hang

	int 0x10
	
	jmp print_character_loop

msg:
	db 'Welcome to BitOS :)', 13, 10, 0

hang:
	jmp hang

	times 510-($-$$) db 0

	db 0x55
	db 0xAA
