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
	xor	rdx, rdx
	xor	rcx, rcx
.loop:
	mov	dl, byte[rsi+rcx]
	mov	byte[rdi+rcx], dl
	cmp	byte[rsi+rcx], 0
	je	.end
	inc	rcx	
	jmp	.loop
.end:
	mov rax, rdi
	ret				
