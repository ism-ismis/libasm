; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ishirais <ishirais@student.42tokyo.jp>     +;+  +:+       +;+         ;
;                                                 +;+;+;+;+;+   +;+            ;
;    Created: 2021/03/12 14:02:35 by ishirais          ;+;    ;+;              ;
;    Updated: 2021/03/12 14:05:00 by ishirais         ;;;   ;;;;;;;;.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcmp
section .text
_ft_strcmp:
	xor r8, r8				;r8 = 0
	xor rdx, rdx			;rdx = 0
	xor rcx, rcx			;rcx = 0
.loop:
	mov	dl, byte[rdi+r8]	;dl = rdi[r8];
	mov cl, byte[rsi+r8]	;cl = rsi[r8];
	cmp dl, cl				;if (dl != cl)
	jne	.end				; jump to .end
	cmp	dl, 0				;if (dl == 0)
	je 	.end				;jump to .end
	cmp	cl, 0				;if (cl == 0)
	je	.end				; jump to .end
	inc r8					;r8++
	jmp .loop				; jump to .loop
.end:
	sub rdx, rcx			;rdx -= rcx
	mov rax, rdx			;rax = rdx
	ret
