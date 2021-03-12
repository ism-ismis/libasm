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
	xor r8, r8				
	xor rdx, rdx			
	xor rcx, rcx			
.loop:
	mov	dl, byte[rdi+r8]
	mov cl, byte[rsi+r8]
	cmp dl, cl
	jne	.end
	cmp	dl, 0
	je 	.end
	cmp	cl, 0
	je	.end
	inc r8	
	jmp .loop
.end:
	sub rdx, rcx
	mov rax, rdx	
	ret
