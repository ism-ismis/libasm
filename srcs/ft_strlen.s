; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ishirais <ishirais@student.42tokyo.jp>     +;+  +:+       +;+         ;
;                                                 +;+;+;+;+;+   +;+            ;
;    Created: 2021/03/12 14:02:17 by ishirais          ;+;    ;+;              ;
;    Updated: 2021/03/12 14:05:51 by ishirais         ;;;   ;;;;;;;;.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strlen
section .text
_ft_strlen:
	xor rax, rax
.loop:
	cmp	byte[rdi+rax], 0
	je	.end
	inc	rax	
	jmp	.loop
.end:
	ret	
