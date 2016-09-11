%ifndef _area
%define _area

section .data

section .bss

section .text

f_basic :

    mov eax, plus
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_plus
 
    mov eax, minus
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_minus

    mov eax, divide
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_divide

    mov eax, multiply
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_multiply

    mov eax, 1

    ret

f_plus :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call _result

    mov eax, [num1]
    add eax, [num2]

    mov dword[result1], eax
    mov ebx, 1 
    call printNum

    call ask_for_log

    mov eax, yes
    mov ebx, question 

    call compare
    cmp ecx, 1
    jne _ret

    call _log_2inputInt

    jmp _ret

f_minus :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call _result

    mov eax, [num1]
    sub eax, [num2]

    mov dword[result1], eax
    mov ebx, 1 
    call printNum

    call ask_for_log

    mov eax, yes
    mov ebx, question 

    call compare
    cmp ecx, 1
    jne _ret

    call _log_2inputInt

    jmp _ret

f_divide :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call _result

    mov edx, 0
    mov eax, [num1]
    mov ebx, 100
    mul ebx

    mov ecx, [num2]
    idiv ecx

    mov dword[result1], eax
    mov ebx, 1 
    call printFloat

    call ask_for_log

    mov eax, yes
    mov ebx, question 

    call compare
    cmp ecx, 1
    jne _ret

    call _log_2inputFloat

    jmp _ret

f_multiply :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call _result

    mov eax, [num1]
    mov ebx, [num2]
    mul ebx

    mov dword[result1], eax
    mov ebx, 1 
    call printNum

    call ask_for_log

    mov eax, yes
    mov ebx, question 

    call compare
    cmp ecx, 1
    jne _ret

    call _log_2inputInt

    jmp _ret

%endif