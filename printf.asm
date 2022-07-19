printf:
	pusha
	mov ah, 0x0e
	str_loop:
		mov al, [si]
		cmp al, 0
		jne printchar
		popa
		ret
printchar:
	int 0x10
	add si, 1
	jmp str_loop


