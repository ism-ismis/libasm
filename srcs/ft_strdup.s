; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ishirais <ishirais@student.42tokyo.jp>     +;+  +:+       +;+         ;
;                                                 +;+;+;+;+;+   +;+            ;
;    Created: 2021/03/12 14:06:01 by ishirais          ;+;    ;+;              ;
;    Updated: 2021/03/12 14:06:32 by ishirais         ;;;   ;;;;;;;;.fr        ;
;                                                                              ;
; **************************************************************************** ;

extern	_malloc
extern	_ft_strlen
extern	_ft_strcpy
extern	___error
global	_ft_strdup
section .text
_ft_strdup:
	push	rdi
	call	_ft_strlen
	mov		rdi, rax
	call	_malloc
	jz		.error
	mov		rdi, rax
	pop		rsi
	call	_ft_strcpy
	ret
.error:
	call	___error
	mov		qword[rax], 12
	mov		rax, 0
	ret
