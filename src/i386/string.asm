global memset
memset:
push ebp
mov ebp, esp
	mov edi, [ebp + 8]			; dest
	movzx eax, byte [ebp + 12]	; c
	mov ecx, [ebp + 16] 		; n

	cld

	test ecx, 0b11
	jz memset_32
	test ecx, 1
	jz memset_16
		rep stosb
		jmp memset_end
	memset_32:
		shr ecx, 2
		rep stosd
		jmp memset_end
	memset_16:
		shr ecx, 1
		rep stosw
	memset_end:
	mov eax, [esp + 8]
leave
ret

global memcmp
memcmp:
push ebp
mov ebp, esp
	mov edi, [ebp + 8]
	mov esi, [ebp + 12]
	mov ecx, [ebp + 16]

	cld

	test ecx, 0b11
	jz memcmp_32
	test ecx, 0b1
	jz memcmp_16

	; 8-bit comparison
		repe cmpsb

		; Jump if equal
		cmp ecx, 0
		jz memcmp_eq

		mov al, [esi]
		cmp al, [edi]
		ja memcmp_gt
		jb memcmp_lt

	; 32-bit comparison
	memcmp_32:
		shr ecx, 2
		repe cmpsd

		cmp ecx, 0
		jz memcmp_eq

		shl ecx, 1
	; 16-bit comparison
	memcmp_16:
		shr ecx, 1
		rep cmpsw

		cmp ecx, 0
		jz memcmp_eq

		mov ax, [esi]
		mov dx, [edi]

		cmp ah, dh
		ja memcmp_gt
		jb memcmp_lt

		cmp al, dl
		ja memcmp_gt
		jmp memcmp_lt

	memcmp_eq:
	xor eax, eax
	jmp memcmp_end

	memcmp_gt:
	mov eax, 1
	jmp memcmp_end

	memcmp_lt:
	mov eax, -1
memcmp_end:
leave
ret
