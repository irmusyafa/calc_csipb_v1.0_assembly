%ifndef _volume
%define _volume

section .data

section .bss

section .text

f_area :

    mov eax, triangle
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_triangle

    mov eax, diamond
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_diamond

    mov eax, trapezium
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_trapezium

    mov eax, square
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_square

    mov eax, circle
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_circle

    mov eax, rectangle
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_rectangle

    mov eax, 1

    ret

;------ 2D area -------

f_triangle :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call _result

    mov eax, [num1]
    mov ebx, [num2]
    mul ebx

    mov ebx, 100
    mul ebx

    mov edx, 0
    mov ecx, 2
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

f_circle :

    call scanNum
    mov dword [num1], eax

    call _result

    mov eax, [num1]
    mov ebx, [num1]
    mul ebx

    mov ebx, 2200
    mul ebx

    mov edx, 0
    mov ecx, 7
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

    call _log_1inputFloat

    jmp _ret

f_square :

    call scanNum
    mov dword [num1], eax

    call _result

    mov eax, [num1]
    mov ebx, [num1]
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

    call _log_1inputInt

    jmp _ret

f_rectangle :

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

f_diamond :

    call scanNum
    mov dword [num1], eax

    call _result

    mov eax, [num1]
    mov ebx, [num1]
    mul ebx

    mov ebx, 100
    mul ebx

    mov edx, 0
    mov ecx, 2
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

    call _log_1inputFloat

    jmp _ret

f_trapezium :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call scanNum
    mov dword [num3], eax

    call _result

    mov eax, [num1]
    add eax, [num2]

    mov ebx, [num3]
    mul ebx

    mov ebx, 100
    mul ebx

    mov edx, 0
    mov ecx, 2
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

    call _log_3inputFloat

    jmp _ret

f_volume :

    mov eax, cube
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_cube

    mov eax, cuboid
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_cuboid

    mov eax, cone
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_cone

    mov eax, sphere
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_sphere

    mov eax, cylinder
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_cylinder

    mov eax, spyramid
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_spyramid

    mov eax, tpyramid
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_tpyramid

    mov eax, rpyramid
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_rpyramid

    mov eax, tprism
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_tprism

    mov eax, rprism
    mov ebx, function
    call compare
    cmp ecx, 1
    je f_rprism

    mov eax, 1
    ret

;------ 3D volume count ------

f_cube :

    call scanNum
    mov dword [num1], eax

    call _result

    mov eax, [num1]
    mov ebx, [num1]
    mul ebx

    mov ebx, [num1]
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

    call _log_1inputInt

    jmp _ret

f_cuboid :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call scanNum
    mov dword [num3], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, result
     mov edx, lresult
    int 80h

    mov eax, [num1]
    mov ebx, [num2]
    mul ebx

    mov ebx, [num3]
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

    call _log_3inputInt

    jmp _ret

f_cone :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call _result

    mov eax, [num1]
    mov ebx, [num1]
    mul ebx

    mov ebx, [num2]
    mul ebx

    mov ebx, 2200
    mul ebx

    mov edx, 0
    mov ecx, 21
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

f_sphere :

    call scanNum
    mov dword [num1], eax

    call _result

    mov eax, [num1]
    mov ebx, [num1]
    mul ebx

    mov ebx, [num1]
    mul ebx

    mov ebx, 400
    mul ebx

    mov edx, 0
    mov ecx, 3
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

    call _log_1inputFloat

    jmp _ret

f_cylinder :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call _result

    mov eax, [num1]
    mov ebx, [num1]
    mul ebx

    mov ebx, [num2]
    mul ebx

    mov ebx, 2200
    mul ebx

    mov edx, 0
    mov ecx, 7
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

f_spyramid :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call _result

    mov eax, [num1]
    mov ebx, [num1]
    mul ebx

    mov ebx, [num2]
    mul ebx

    mov ebx, 100
    mul ebx

    mov edx, 0
    mov ecx, 3
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

f_tpyramid :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call scanNum
    mov dword [num3], eax

    call _result

    mov eax, [num1]
    mov ebx, [num2]
    mul ebx

    mov ebx, 100
    mul ebx

    mov edx, 0
    mov ecx, 2
    idiv ecx

    mov ebx, [num3]
    mul ebx

    mov edx, 0
    mov ecx, 3
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

    call _log_3inputFloat

    jmp _ret

f_rpyramid :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call scanNum
    mov dword [num3], eax

    call _result

    mov eax, [num1]
    mov ebx, [num2]
    mul ebx

    mov ebx, 100
    mul ebx

    mov edx, 0
    mov ecx, 2
    idiv ecx

    mov ebx, [num3]
    mul ebx

    mov edx, 0
    mov ecx, 3
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

    call _log_3inputFloat

    jmp _ret

f_tprism :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call scanNum
    mov dword [num3], eax

    call _result

    mov eax, [num1]
    mov ebx, [num2]
    mul ebx

    mov ebx, 100
    mul ebx

    mov edx, 0
    mov ecx, 2
    idiv ecx

    mov ebx, [num3]
    mul ebx

    mov dword[result1], eax
    mov ebx, 1 
    call printFloat

    call ask_for_log

    mov eax, yes
    mov ebx, question 

    call compare
    cmp ecx, 1
    jne _ret

    call _log_3inputFloat

    jmp _ret

f_rprism :

    call scanNum
    mov dword [num1], eax

    call scanNum
    mov dword [num2], eax

    call scanNum
    mov dword [num3], eax

    call _result

    mov eax, [num1]
    mov ebx, [num2]
    mul ebx

    mov ebx, [num3]
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

    call _log_3inputInt

    jmp _ret

_ret

    mov eax, 0
    ret

%endif