%ifndef _log
%define _log

section .data

section .bss

section .text

_createFile :

    mov eax, 8
    mov ebx, log
    mov ecx, 0700
    int 0x80

    ret

_openFile :

    mov eax, 5
    mov edx, 01FFh
    mov ecx, 0
    mov ebx, log
    int 80h

    mov [isilog], eax
    
    ret

_closeFile :
    mov eax, 6
    mov ebx, log
    int 80h

    ret

ask_for_log :

    mov eax, 4
    mov ebx, 1
    mov ecx, ask_to_log
    mov edx, lask_to_log
    int 0x80

    call _calc

    call inputstring

    mov ebx, question
    call copystring

    ret

_log_tempc :

    mov eax, function
    call logStr

    call _space

    mov dword[logCheck], 1
    mov eax, [num1]
    call printFloat

    call _space

    call _log_result

    mov dword[logCheck], 1
    mov eax, [result1]
    call printFloat
    mov eax, 4
    mov ebx, [isilog]
    mov ecx, rea
    mov edx, lrea
    int 80h

    call _space

    mov dword[logCheck], 1
    mov eax, [result2]
    call printFloat
    mov eax, 4
    mov ebx, [isilog]
    mov ecx, kel
    mov edx, lkel
    int 80h

    call _space

    mov dword[logCheck], 1
    mov eax, [result3]
    call printFloat
    mov eax, 4
    mov ebx, [isilog]
    mov ecx, fahr
    mov edx, lfahr
    int 80h

    call _newline

    ret

_log_tempr :

    mov eax, function
    call logStr

    call _space

    mov dword[logCheck], 1
    mov eax, [num1]
    call printFloat

    call _space

    call _log_result

    mov dword[logCheck], 1
    mov eax, [result1]
    call printFloat
    mov eax, 4
    mov ebx, [isilog]
    mov ecx, cel
    mov edx, lcel
    int 80h

    call _space

    mov dword[logCheck], 1
    mov eax, [result2]
    call printFloat
    mov eax, 4
    mov ebx, [isilog]
    mov ecx, kel
    mov edx, lkel
    int 80h

    call _space

    mov dword[logCheck], 1
    mov eax, [result3]
    call printFloat
    mov eax, 4
    mov ebx, [isilog]
    mov ecx, fahr
    mov edx, lfahr
    int 80h

    call _newline

    ret

_log_tempk :

    mov eax, function
    call logStr

    call _space

    mov dword[logCheck], 1
    mov eax, [num1]
    call printFloat

    call _space

    call _log_result

    mov dword[logCheck], 1
    mov eax, [result1]
    call printFloat
    mov eax, 4
    mov ebx, [isilog]
    mov ecx, cel
    mov edx, lcel
    int 80h

    call _space

    mov dword[logCheck], 1
    mov eax, [result2]
    call printFloat
    mov eax, 4
    mov ebx, [isilog]
    mov ecx, rea
    mov edx, lrea
    int 80h

    call _space

    mov dword[logCheck], 1
    mov eax, [result3]
    call printFloat
    mov eax, 4
    mov ebx, [isilog]
    mov ecx, fahr
    mov edx, lfahr
    int 80h

    call _newline

    ret

_log_tempf :

    mov eax, function
    call logStr

    call _space

    mov dword[logCheck], 1
    mov eax, [num1]
    call printFloat

    call _space

    call _log_result

    call _space

    mov dword[logCheck], 1
    mov eax, [result1]
    call printFloat
    mov eax, 4
    mov ebx, [isilog]
    mov ecx, cel
    mov edx, lcel
    int 80h

    call _space

    mov dword[logCheck], 1
    mov eax, [result2]
    call printFloat
    mov eax, 4
    mov ebx, [isilog]
    mov ecx, rea
    mov edx, lrea
    int 80h

    call _space

    mov dword[logCheck], 1
    mov eax, [result3]
    call printFloat
    mov eax, 4
    mov ebx, [isilog]
    mov ecx, kel
    mov edx, lkel
    int 80h

    call _newline

    ret

_log_1inputInt

    mov eax, function
    call logStr

    call _space

    mov dword[logCheck], 1
    mov eax, [num1]
    call printNum

    call _space

    call _log_result

    mov dword[logCheck], 1
    mov eax, [result1]
    call printNum

    call _newline

    ret

_log_2inputInt

    mov eax, function
    call logStr

    call _space

    mov dword[logCheck], 1
    mov eax, [num1]
    call printNum

    call _space

    mov dword[logCheck], 1
    mov eax, [num2]
    call printNum

    call _space

    call _log_result

    mov dword[logCheck], 1
    mov eax, [result1]
    call printNum

    call _newline

    ret

_log_3inputInt

    mov eax, function
    call logStr

    call _space

    mov dword[logCheck], 1
    mov eax, [num1]
    call printNum

    call _space

    mov dword[logCheck], 1
    mov eax, [num2]
    call printNum

    call _space

    mov dword[logCheck], 1
    mov eax, [num3]
    call printNum

    call _space

    call _log_result

    mov dword[logCheck], 1
    mov eax, [result1]
    call printNum

    call _newline

    ret

_log_1inputFloat

    mov eax, function
    call logStr

    call _space

    mov dword[logCheck], 1
    mov eax, [num1]
    call printNum

    call _space

    call _log_result

    mov dword[logCheck], 1
    mov eax, [result1]
    call printFloat

    call _newline

    ret

_log_2inputFloat

    mov eax, function
    call logStr

    call _space

    mov dword[logCheck], 1
    mov eax, [num1]
    call printNum

    call _space

    mov dword[logCheck], 1
    mov eax, [num2]
    call printNum

    call _space

    call _log_result

    mov dword[logCheck], 1
    mov eax, [result1]
    call printFloat

    call _newline

    ret

_log_3inputFloat

    mov eax, function
    call logStr

    call _space

    mov dword[logCheck], 1
    mov eax, [num1]
    call printNum

    call _space

    mov dword[logCheck], 1
    mov eax, [num2]
    call printNum

    call _space

    mov dword[logCheck], 1
    mov eax, [num3]
    call printNum

    call _space

    call _log_result

    mov dword[logCheck], 1
    mov eax, [result1]
    call printFloat

    call _newline

    ret

log_open :
    
    mov ecx, 999

next_open :                   
    mov dword[templog + ecx], 0
    dec ecx
    cmp ecx, 0
    jne next_open

    mov eax, 5          ;sys open
    mov ebx, log  
    mov ecx, 0          ;read only access
    mov edx, 0777       ;read
    int 0x80            ;call kernel
    mov [isilog], eax    ;

    mov eax, 3
    mov ebx, [isilog]
    mov ecx, templog
    mov edx, 1000
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, loghead
    mov edx, lloghead
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, templog
    mov edx, 1000
    int 80h

    call _n

    mov eax, 6
    mov ebx, [isilog]
    int 0x80

    call _createFile
    mov [isilog], eax

    ret

%endif