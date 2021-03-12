; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ishirais <ishirais@student.42tokyo.jp>     +;+  +:+       +;+         ;
;                                                c +;+;+;+;+;+   +;+           ;
;    Created: 2021/03/12 14:01:43 by ishirais          ;+;    ;+;              ;
;    Updated: 2021/03/12 14:04:29 by ishirais         ;;;   ;;;;;;;;.fr        ;
;                                                                              ;
; **************************************************************************** ;

extern ___error
global _ft_read
section .text
_ft_read:
	mov	rax, 0x02000003
	syscall
	jc		.error
	ret
.error:
	push	rax
	call	___error
	pop		qword[rax]
	mov		rax, -1
	ret
