%ifndef _temperature
%define _temperature

section .data

section .bss

section .text

f_temp :  

    ;----- celcius -------

    mov eax, tempc
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_tempc

    ;------ reamur -----

    mov eax, tempr
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_tempr

    ;------ kelvin -----

    mov eax, tempk
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_tempk

    ;----- farenheit ----

    mov eax, tempf
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_tempf

    mov eax, 1

    ret
;--------- function -----------

;------ Celcius ---------

f_tempc :

    call scanNum
    mov dword [num1], eax

    call _result

 ;----- convert to reamur ------

    mov eax, [num1]
    mov ebx, 400
    mul ebx

    mov edx, 0
    mov ecx, 5
    idiv ecx

    mov dword[result1], eax
    mov ebx, 1 
    call printFloat

    call reamur

 ;------ convert to kelvin -----

    mov eax, [num1]
    add eax, 273

    mov ebx, 100
    mul ebx

    mov dword[result2], eax
    mov ebx, 1 
    call printFloat

    call kelvin

 ;------ convert to fahrenheit -----

    mov eax, [num1]
    mov ebx, 900
    mul ebx

    mov edx, 0
    mov ecx, 5
    idiv ecx

    add eax, 3200

    mov dword[result3], eax
    mov ebx, 1 
    call printFloat

    call fahrenheit

    call ask_for_log

    mov eax, yes
    mov ebx, question 

    call compare
    cmp ecx, 1
    jne _ret

    call _log_tempc

    jmp _ret

;------ Reamur ---------

f_tempr :

    call scanNum
    mov dword [num1], eax

    call _result

 ;------ convert to celcius -----

    mov eax, [num1]
    mov ebx, 500
    mul ebx

    mov edx, 0
    mov ecx, 4
    idiv ecx

    mov dword[result1], eax
    mov ebx, 1 
    call printFloat

    call celcius

 ;------ convert to kelvin -----

    mov eax, [num1]
    mov ebx, 500
    mul ebx

    mov edx, 0
    mov ecx, 4
    idiv ecx

    add eax, 27300

    mov dword[result2], eax
    mov ebx, 1 
    call printFloat

    call kelvin

 ;------ convert to fahrenheit -----

    mov eax, [num1]
    mov ebx, 900
    mul ebx

    mov edx, 0
    mov ecx, 4
    idiv ecx

    add eax, 3200

    mov dword[result3], eax
    mov ebx, 1 
    call printFloat

    call fahrenheit

    call ask_for_log

    mov eax, yes
    mov ebx, question 

    call compare
    cmp ecx, 1
    jne _ret

    call _log_tempr

    jmp _ret

;------- Kelvin ----------

f_tempk :

    call scanNum
    mov dword [num1], eax

    call _result

 ;------ convert to celcius -----

    mov eax, [num1]
    sub eax, 273

    mov ebx, 100
    mul ebx

    mov dword[result1], eax
    mov ebx, 1 
    call printFloat

    call celcius

 ;------ convert to reamur -----

    mov edx, 0
    mov eax, 400
    mov ecx, 5
    idiv ecx

    mov ebx, eax

    mov eax, [num1]
    sub eax, 273
    mul ebx

    mov dword[result2], eax
    mov ebx, 1 
    call printFloat

    call reamur

 ;------ convert to fahrenheit -----

    mov edx, 0
    mov eax, 900
    mov ecx, 5
    idiv ecx

    mov ebx, eax
    
    mov eax, [num1]
    sub eax, 273
    mul ebx

    add eax, 3200

    mov dword[result3], eax
    mov ebx, 1 
    call printFloat

    call fahrenheit

    call ask_for_log

    mov eax, yes
    mov ebx, question 

    call compare
    cmp ecx, 1
    jne _ret

    call _log_tempk

    jmp _ret

;---------- fahrenheit ---------

f_tempf :

    call scanNum
    mov dword [num1], eax

    call _result

 ;------ convert to celcius -----

    mov eax, 500
    mov edx, 0
    mov ecx, 9
    idiv ecx

    mov ebx, eax

    mov eax, [num1]
    sub eax, 32
    mul ebx
    
    mov dword[result1], eax
    mov ebx, 1 
    call printFloat

    call celcius

 ;------ convert to reamur -----

    mov eax, 400
    mov edx, 0
    mov ecx, 9
    idiv ecx

    mov ebx, eax

    mov eax, [num1]
    sub eax, 32
    mul ebx

    mov dword[result2], eax
    mov ebx, 1 
    call printFloat

    call reamur

 ;------ convert to kelvin -----

    mov eax, 500
    mov edx, 0
    mov ecx, 9
    idiv ecx

    mov ebx, eax

    mov eax, [num1]
    sub eax, 32
    mul ebx

    add eax, 27300

    mov dword[result3], eax
    mov ebx, 1
    call printFloat

    call kelvin

    call ask_for_log

    mov eax, yes
    mov ebx, question 

    call compare
    cmp ecx, 1
    jne _ret

    call _log_tempf

    jmp _ret
    
%endif