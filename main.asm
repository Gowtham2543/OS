org 0x7c00

mov si, STR
call printf

mov al, 1
mov cl, 2
call readDisk

call test	

jmp $

%include "./printf.asm"
%include "./readDisk.asm"
test:
	mov si, testString
	call printf

STR: db "Booting OS", 0x0a, 0x0d, 0
diskErrorMsg: db "Unable to read the disk", 0x0a, 0x0d, 0
testString: db "You are in second sector", 0x0a , 0x0d, 0

times 510 - ($ - $$) db 0
dw 0xaa55

times 512 db 0  ; Padding second sector so bios read does not give		    error
