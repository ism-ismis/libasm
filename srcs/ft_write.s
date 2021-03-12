; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ishirais <ishirais@student.42tokyo.jp>     +;+  +:+       +;+         ;
;                                                 +;+;+;+;+;+   +;+            ;
;    Created: 2021/03/12 14:06:57 by ishirais          ;+;    ;+;              ;
;    Updated: 2021/03/12 14:07:18 by ishirais         ;;;   ;;;;;;;;.fr        ;
;                                                                              ;
; **************************************************************************** ;

extern  ___error
global _ft_write
section .text
_ft_write:
	mov		rax, 0x02000004
	syscall
	jc		.error
	ret
.error:
	push	rax
	call	___error
	pop		qword[rax]
	mov		rax, -1
	ret
