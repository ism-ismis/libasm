; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ishirais <ishirais@student.42tokyo.jp>     +;+  +:+       +;+         ;
;                                                 +;+;+;+;+;+   +;+            ;
;    Created: 2021/03/12 14:02:48 by ishirais          ;+;    ;+;              ;
;    Updated: 2021/03/12 14:05:24 by ishirais         ;;;   ;;;;;;;;.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcpy
section .text
_ft_strcpy:
	xor	rdx, rdx			;rdx = 0;
	xor	rcx, rcx			;rcx = 0;
.loop:
	mov	dl, byte[rsi+rcx]	;dl = rsi[rcx]
	mov	byte[rdi+rcx], dl	;rdi[rcx] = dl
	cmp	byte[rsi+rcx], 0	;if (rsi[rcx] == 0)
	je	.end				;jump to .end
	inc	rcx					;rcx++;
	jmp	.loop				;jump to .loop
.end:
	mov rax, rdi			;rax = rdi
	ret						;return rax
