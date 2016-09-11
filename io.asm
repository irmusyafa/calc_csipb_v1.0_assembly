%ifndef _ioFunc
%define _ioFunc

floatstrlen equ 255

section .data

	divider dd 10

	negativeCheck dd 0

	logCheck dd 0

section .bss

	charinput resb 1

	textinput resb 256

	ltextinput resd 1

	_printFloatStr resb floatstrlen

section .text

inputtext :

	; Baca dari stdin ke _scanNumStr
	mov eax, 3
	mov ebx, 0
	mov ecx, charinput
	mov edx, 1
	int 0x80

	ret


inputstring :
	
	mov dword [ltextinput], 0 ; length input reset


loopinputtext :

	cmp dword [ltextinput], 255 ;check length input overflow or not
	je inputstringexit

	call inputtext ; read character

	cmp byte [charinput], ' ' ; check space
	je inputstringexit

	cmp byte [charinput], 10 ; check newline
	je inputstringexit
	
	cmp byte [charinput], 0  ; check null
	je inputstringexit

	mov ecx, [ltextinput] 
	mov bl,  [charinput]
	mov byte [textinput + ecx], bl ; move char to array of string

	add dword [ltextinput], 1 	; Increment counter

	jmp loopinputtext


inputstringexit :
	
	mov ecx, [ltextinput]
	mov byte [textinput + ecx], 0 ; add 0 for and string

	mov eax, textinput		; eax for string address
	mov ebx, [ltextinput]	; ebx for length string

	ret

copystring :

	mov dl, [eax]		; copy char from eax to ebx
	mov byte [ebx], dl

	cmp byte [eax], 0	; check null ?
	je copystringexit

	add eax, 1	; counter
	add ebx, 1	; counter 

	jmp copystring

copystringexit :

	ret


compare :

compareloop :

	mov dl, [ebx] ;store letter in first word to ebx
	cmp dl, [eax] ;compare letter first word and second word 
	jne false

	cmp byte [eax], 0 ; compare eax with 0 check letter finish or not
	je true

	add eax, 1 ;add counter for fisrt word
	add ebx, 1 ;add counter for second word

	jmp compareloop

true :
	mov ecx, 1 ;sign eax to 1 for true 
	jmp finish

false :
	mov ecx, 0 ;sign eax to 0 for false
	jmp finish

finish :

	ret

printFloat :
	
	mov ecx, floatstrlen ; reset ecx for last index in string
	sub ecx, 1
	mov dword [negativeCheck], 1 ; reset negative sign

	cmp eax, 0			; check 0
	jne _negativeCheck

	mov byte [_printFloatStr + ecx], '0' ; print 0 char
	sub ecx, 1
	jmp _printFloat

_negativeCheck :

	cmp eax, 0			; check negative
	jg _printFloatLoop

	mov dword [negativeCheck], -1 ; if negative set sign negative to -1
	mov edx, 0
	mov eax, eax

	cdq
	imul dword [negativeCheck] ; multiply with -1 

_printFloatLoop :

	cmp eax, 10 ; check 1 digit e.g 0.01
	jl _1digit 

	cmp eax, 100 ; check 2 digit e.g 0.11
	jl _2digit

	jmp _more

_1digit :

	mov edx, eax

	add dl, '0'
	mov byte[_printFloatStr+ ecx], dl
	sub ecx, 1

	mov byte[_printFloatStr+ ecx], '0'
	sub ecx, 1

	mov byte[_printFloatStr+ ecx], '.'
	sub ecx, 1

	mov byte[_printFloatStr+ ecx], '0'
	sub ecx, 1

	jmp _printFloat

_2digit :

	mov edx, 0
	div dword[divider]

	add dl, '0'
	mov byte[_printFloatStr+ ecx], dl
	sub ecx, 1

	add al, '0'
	mov byte[_printFloatStr+ ecx], al
	sub ecx, 1

	mov byte[_printFloatStr+ ecx], '.'
	sub ecx, 1
	
	mov byte[_printFloatStr+ ecx], '0'
	sub ecx, 1
	
	jmp _printFloat

_more :
	
	mov edx, 0							; back comma 
	div dword[divider]		
	
	add dl, '0'
	mov byte[_printFloatStr+ ecx], dl
	sub ecx, 1
	
	mov edx, 0
	div dword[divider]
	
	add dl, '0'
	mov byte[_printFloatStr+ ecx], dl
	sub ecx, 1
	
	mov byte[_printFloatStr+ ecx], '.'
	sub ecx, 1

_Frontcomma :

	mov edx, 0
	div dword [divider]

	add dl, '0'
	mov byte [_printFloatStr + ecx], dl

	sub ecx, 1

	cmp eax, 0
	jne _Frontcomma

_printFloat :

	cmp dword [negativeCheck], -1 ;	check negative
	jne _printFloatNext

	mov byte [_printFloatStr + ecx], '-' ; if negative add (-) to string 
	sub ecx, 1

_printFloatNext :

	mov edx, floatstrlen
	sub edx, ecx
	sub edx, 1

	add ecx, _printFloatStr 
	add ecx, 1					; ecx to first index to print

	cmp dword[logCheck], 1
	je _printToLog

	mov eax, 4	; print to terminal
	mov ebx, 1
	int 0x80

	jmp _printFloatExit

_printToLog

	mov eax, 4	; print to terminal
	mov ebx, [isilog]
	int 0x80

	mov dword[logCheck], 0

_printFloatExit :

	ret

logStr :

	mov ecx, eax

_logStrLoop :

	cmp byte [ecx], 0
	je _logStrExit

	mov ebx, [isilog]
	mov eax, 4
	mov edx, 1
	int 0x80

	add ecx, 1

	jmp _logStrLoop

_logStrExit :

	ret

%endif