 ; call file for io
%include "io.asm"

; call file for basic calc function
%include "basic.asm"

; call file for volume function
%include "area_&_volume.asm"

; call file for temperature function
%include "temperature.asm"

; Fungsi untuk scan angka
%include "scanNum.asm"

; Fungsi untuk cetak angka
%include "printNum.asm"

; Fungsi untuk log
%include "log.asm"


section .data
;----------- program message ---------------

    msg1         db        'Calculator CSIPB v1.0',10,'Calculator basic',10,10,'for basic aritmathic use',10,'(',27,'[36m','+',27,'[39m',') for adder, (',27,'[36m','-',27,'[39m',') for subtract, (',27,'[36m','*',27,'[39m',') for multiply, (',27,'[36m','/',27,'[39m',') for devide ',10,10,'For count 2D area',10,' - circle    type ',27,'[36m','area.c ',27,'[39m',' and 1 arguments for radius',10,' - square    type ',27,'[36m','area.s ',27,'[39m',' and 1 arguments for side',10,' - diamond   type ',27,'[36m','area.d ',27,'[39m',' and 1 arguments for diagonal length ',10,' - triangle  type ',27,'[36m','area.t ',27,'[39m',' and 2 arguments for base and height ',10,' - rectangle type ',27,'[36m','area.r ',27,'[39m',' and 2 arguments for height and width ',10,' - trapezium type ',27,'[36m','area.tr',27,'[39m',' and 3 arguments for top, bottom and height ',10,10,'For count 3D volume ',10,' - cube                type ',27,'[36m','vol.cube',27,'[39m',' and 1 arguments for edge ',10,' - cuboid              type ',27,'[36m','vol.cubo',27,'[39m',' and 3 arguments for length, height, width ',10,' - cone                type ',27,'[36m','vol.con',27,'[39m','  and 2 arguments for radius, height ',10,' - sphere              type ',27,'[36m','vol.sph',27,'[39m','  and 1 arguments for radius ',10,' - cylinder            type ',27,'[36m','vol.cyl',27,'[39m','  and 2 arguments for radius, height ',10,' - square pyramid      type ',27,'[36m','vol.spy',27,'[39m','  and 2 arguments for side, height ',10,' - triangle pyramid    type ',27,'[36m','vol.tpy',27,'[39m','  and 3 arguments for base, triangle height, pyramid height ',10,' - rectangle pyramid   type ',27,'[36m','vol.rpy',27,'[39m','  and 3 arguments for rectangle height, rectangle width, pyramid height ',10,' - triangle prism      type ',27,'[36m','vol.tpr',27,'[39m','  and 3 arguments for base, triangle height, prism height ',10,' - rectangle prism     type ',27,'[36m','vol.rpr',27,'[39m','  and 3 arguments for rectangle height, rectangle width, prism height ',10,10,'For converter temperature',10,'use (',27,'[36m','c',27,'[39m',') for Celcius (',27,'[36m','k',27,'[39m',') for Kelvin (',27,'[36m','r',27,'[39m',') for Reamur (',27,'[36m','f',27,'[39m',') for Fahrenheit and 1 argument for height temperature to convert',10
    lmsg1        equ        $ - msg1

    msg2         db        'Calculator CSIPB v1.0',10,'Calculator basic',10,10,'for basic aritmathic use',10,'(',27,'[36m','+',27,'[39m',') for adder, (',27,'[36m','-',27,'[39m',') for subtract, (',27,'[36m','*',27,'[39m',') for multiply, (',27,'[36m','/',27,'[39m',') for devide ',10
    lmsg2        equ        $ - msg2

    msg3         db        'Calculator CSIPB v1.0',10,'Calculator temperature',10,10,'(',27,'[36m','c',27,'[39m',') for Celcius (',27,'[36m','k',27,'[39m',') for Kelvin (',27,'[36m','r',27,'[39m',') for Reamur (',27,'[36m','f',27,'[39m',') for Fahrenheit and 1 argument for height temperature to convert',10
    lmsg3        equ        $ - msg3

    msg4         db        'Calculator CSIPB v1.0',10,'Calculator area',10,10,'for count 2D area',10,' - circle    type ',27,'[36m','area.c ',27,'[39m',' and 1 arguments for radius',10,' - square    type ',27,'[36m','area.s ',27,'[39m',' and 1 arguments for side',10,' - diamond   type ',27,'[36m','area.d ',27,'[39m',' and 1 arguments for diagonal length ',10,' - triangle  type ',27,'[36m','area.t ',27,'[39m',' and 2 arguments for base and height ',10,' - rectangle type ',27,'[36m','area.r ',27,'[39m',' and 2 arguments for height and width ',10,' - trapezium type ',27,'[36m','area.tr',27,'[39m',' and 3 arguments for top, bottom and height ',10
    lmsg4        equ        $ - msg4

    msg5         db        'Calculator CSIPB v1.0',10,'Calculator volume',10,10,' - cube                type ',27,'[36m','vol.cube',27,'[39m',' and 1 arguments for edge ',10,' - cuboid              type ',27,'[36m','vol.cubo',27,'[39m',' and 3 arguments for length, height, width ',10,' - cone                type ',27,'[36m','vol.con',27,'[39m','  and 2 arguments for radius, height ',10,' - sphere              type ',27,'[36m','vol.sph',27,'[39m','  and 1 arguments for radius ',10,' - cylinder            type ',27,'[36m','vol.cyl',27,'[39m','  and 2 arguments for radius, height ',10,' - square pyramid      type ',27,'[36m','vol.spy',27,'[39m','  and 2 arguments for side, height ',10,' - triangle pyramid    type ',27,'[36m','vol.tpy',27,'[39m','  and 3 arguments for base, triangle height, pyramid height ',10,' - rectangle pyramid   type ',27,'[36m','vol.rpy',27,'[39m','  and 3 arguments for rectangle height, rectangle width, pyramid height ',10,' - triangle prism      type ',27,'[36m','vol.tpr',27,'[39m','  and 3 arguments for base, triangle height, prism height ',10,' - rectangle prism     type ',27,'[36m','vol.rpr',27,'[39m','  and 3 arguments for rectangle height, rectangle width, prism height ',10
    lmsg5        equ        $ - msg5

    calc         db        10,'(calc) '
    lcalc        equ        $ - calc

    result       db        'result = '
    lresult      equ        $ - result

    notfound     db        '-------------------------------',10,'      Function not found',10,'-------------------------------',10
    lnotfound    equ        $ - notfound

    FPEtext     db        27,'[31m','-------------------------------',10,'   Floating Point Exception',10,'-------------------------------',10,27,'[39m',10
    lFPEtext    equ        $ - FPEtext

    loghead     db        27,'[36m','-------------------------------',10,'      History Calculator',10,'-------------------------------',10,27,'[39m',
    lloghead    equ        $ - loghead

    ask_to_log   db         10,'----------------------------------------------',10,'      Do you want to save in log ? (y/n)',10,'----------------------------------------------'
    lask_to_log  equ        $ - ask_to_log

;---------- basic arithmatic ----------------

    plus		 db		   '+',0
    lplus		 equ	    $ - plus

    minus		 db		   '-',0
    lminus		 equ	    $ - minus

    divide 	 	 db		   '/',0
    ldivide	     equ	    $ - divide

    multiply 	 db 	   '*',0
    lmultiply    equ        $ - multiply

;------------- 2D area count ---------------

    triangle     db         'area.t',0
    ltriangle    equ        $ - triangle

    circle       db         'area.c',0
    lcircle      equ        $ - circle

    rectangle    db         'area.r',0
    lrectangle   equ        $ - rectangle

    square       db         'area.s',0
    lsquare      equ        $ - square

    trapezium    db         'area.tr',0
    ltrapezium   equ        $ - trapezium

    diamond      db         'area.d',0
    ldiamond     equ        $ - diamond

;------------ 3D volume count ------------

    cube         db         'vol.cube',0
    lcube        equ        $ - cube

    cuboid       db         'vol.cubo',0
    lcuboid      equ        $ - cuboid

    cone         db         'vol.con',0
    lcone        equ        $ - cone

    sphere       db         'vol.sph',0
    lsphere      equ        $ - sphere

    cylinder     db         'vol.cyl',0
    lcylinder    equ        $ - cylinder

    spyramid     db         'vol.spy',0
    lspyramid    equ        $ - spyramid

    tpyramid     db         'vol.tpy',0
    ltpyramid    equ        $ - tpyramid

    rpyramid     db         'vol.rpy',0
    lrpyramid    equ        $ - rpyramid

    tprism       db         'vol.tpr',0
    ltprism      equ        $ - tprism

    rprism       db         'vol.rpr',0
    lrprism      equ        $ - rprism
 
;--------- convert temperature -----------

    ;------------ celcius ------------

    tempc         db          'c',0
    ltempc        equ         $ - tempc

    ;------------ reamur --------------

    tempr         db          'r',0
    ltempr        equ         $ - tempr

    ;------------ kelvin  -------------

    tempk         db          'k',0
    ltempk        equ         $ - tempk

    ;---------- fahrenheit -------------

    tempf         db          'f',0
    ltempf        equ         $ - tempf

    ;-----------------------------------

    kel         db          'K '
    lkel        equ         $ - kel

    cel         db          '°C '
    lcel        equ         $ - cel

    rea         db          '°R '
    lrea        equ         $ - rea

    fahr        db          '°F '
    lfahr       equ         $ - fahr

    close       db          'exit',0
    lclose      equ         $ - close

    logs        db          'log',0 
    llogs       equ         $ - logs

;---------------------------------------------
    yes         db          'y',0

    log         db          './log.txt',0

    temp        dd          'tem'

    vol         dd          'vol'

    ar          dd          'ar'

    bsc         dd          'bsc'

    clr_scr     db          27, '[H' , 27, '[2J', 0

    len_clr_scr equ         $-clr_scr

    red         db          27,'[31m',0
    lred        equ         $ - red

    white       db          27,'[39m',0
    lwhite      equ         $ - white

    spasi       db          32
    lspasi      equ         $ - spasi

    newline     db          10
    lnewline    equ         $ - newline

;---------------------------------------------

section .bss

    question    resb     255

    function    resb     255

    num1        resd     1

    num2        resd     1

    num3        resd     1

    result1     resd     1

    result2     resd     1

    result3     resd     1

    isilog      resd     1

    templog     resb    1000 
section .text
 
    global main 

main :

    nop

    push ebp
    mov ebp, esp

    call _createFile
    mov [isilog], eax

    cmp dword [ebp + 4], 1 ; if argument only ./calc
    je fullcalc

    cmp dword [ebp + 4], 2 ; if argument 2 or more
    ja fullcalc

    mov eax, temp
    mov ebx, dword[ebp + 4 * 3] 

    call compare
    cmp ecx, 1
    je temperature

    mov eax, bsc
    mov ebx, dword[ebp + 4 * 3]

    call compare
    cmp ecx, 1
    je basic

    mov eax, ar
    mov ebx, dword[ebp + 4 * 3]

    call compare
    cmp ecx, 1
    je area

    mov eax, vol
    mov ebx, dword[ebp + 4 * 3]

    call compare
    cmp ecx, 1
    je volume

fullcalc :
    
    mov eax, 48 ; floating exception hendled
    mov ebx, 8
    mov ecx, next_fullcalc
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, lmsg1
    int 80h

    call _calc
    call inputstring

    mov ebx, function
    call copystring

    call f_temp
    cmp eax, 1 
    jne next_fullcalc

    call f_volume
    cmp eax, 1 
    jne next_fullcalc
 
    call f_area
    cmp eax, 1 
    jne next_fullcalc

    call f_basic
    cmp eax, 1 
    jne next_fullcalc

    mov eax, close
    mov ebx, function
    call compare
    cmp ecx, 1
    je exit ; close program

    mov eax, logs
    mov ebx, function
    call compare
    cmp ecx, 1
    je readLog_fullcalc
 
    call clear_screen
    call _notfound

    jmp fullcalc

hendledFPE_fc :

    call clear_screen
    call FPE
    jmp fullcalc

next_fullcalc :

    call clear_screen
    jmp fullcalc

readLog_fullcalc :

    call clear_screen
    call log_open
    jmp fullcalc


basic :

    mov eax, 48 ; floating exception hendled
    mov ebx, 8
    mov ecx, hendledFPE_bsc
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, lmsg2
    int 80h

    call _calc
    call inputstring

    mov ebx, function
    call copystring

    mov eax, close
    mov ebx, function
    call compare
    cmp ecx, 1
    je exit ; close program
 
    call f_basic

    cmp eax, 1 
    jne next_basic

    mov eax, logs
    mov ebx, function
    call compare
    cmp ecx, 1
    je readLog_basic

    call clear_screen
    call _notfound  
    
    jmp basic

hendledFPE_bsc :

    call clear_screen
    call FPE
    jmp basic

next_basic :

    call clear_screen
    jmp basic

readLog_basic :

    call clear_screen
    call log_open
    jmp basic

temperature :

    mov eax, 48 ; floating exception hendled
    mov ebx, 8
    mov ecx, hendledFPE_temp
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, lmsg3
    int 80h

    call _calc
    call inputstring

    mov ebx, function
    call copystring

    mov eax, close
    mov ebx, function
    call compare
    cmp ecx, 1
    je exit ; close program

    call f_temp

    cmp eax, 1 
    jne next_temperature

    mov eax, logs
    mov ebx, function
    call compare
    cmp ecx, 1
    je readLog_tem

    call clear_screen
    call _notfound

    jmp temperature

hendledFPE_temp :

    call clear_screen
    call FPE
    jmp temperature

next_temperature :

    call clear_screen
    jmp temperature

readLog_tem :

    call clear_screen
    call log_open
    jmp temperature


area :

    mov eax, 48 ; floating exception hendled
    mov ebx, 8
    mov ecx, hendledFPE_area
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, lmsg4
    int 80h

    call _calc
    call inputstring

    mov ebx, function
    call copystring

    mov eax, close
    mov ebx, function
    call compare
    cmp ecx, 1
    je exit ; close program

    call f_area

    cmp eax, 1 
    jne next_area

    mov eax, logs
    mov ebx, function
    call compare
    cmp ecx, 1
    je readLog_area

    call clear_screen
    call _notfound

    jmp area

hendledFPE_area :

    call clear_screen
    call FPE
    jmp area

next_area :

    call clear_screen
    jmp area

readLog_area :

    call clear_screen
    call log_open
    jmp area


volume :

    mov eax, 48 ; floating exception hendled
    mov ebx, 8
    mov ecx, hendledFPE_vol
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg5
    mov edx, lmsg5
    int 80h

    call _calc
    call inputstring

    mov ebx, function
    call copystring

    mov eax, close
    mov ebx, function
    call compare
    cmp ecx, 1
    je exit ; close program

    call f_volume
    
    cmp eax, 1 
    jne next_volume

    mov eax, logs
    mov ebx, function
    call compare
    cmp ecx, 1
    je readLog_volume

    call clear_screen
    call _notfound

    jmp volume

hendledFPE_vol :

    call clear_screen
    call FPE
    jmp volume

next_volume :

    call clear_screen
    jmp volume

readLog_volume :

    call clear_screen
    call log_open
    jmp volume


_notfound :

    mov eax, 4
    mov ebx, 1
    mov ecx, red
    mov edx, lred
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, notfound
    mov edx, lnotfound
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, white
    mov edx, lwhite
    int 80h

 ret

_result :

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, lresult
    int 80h

    ret

kelvin :

    mov eax, 4
    mov ebx, 1
    mov ecx, kel
    mov edx, lkel
    int 80h


    ret

celcius :

    mov eax, 4
    mov ebx, 1
    mov ecx, cel
    mov edx, lcel
    int 80h

    ret

fahrenheit :

    mov eax, 4
    mov ebx, 1
    mov ecx, fahr
    mov edx, lfahr
    int 80h

    ret

reamur :

    mov eax, 4
    mov ebx, 1
    mov ecx, rea
    mov edx, lrea
    int 80h

    ret

_calc

    mov eax, 4
    mov ebx, 1
    mov ecx, calc
    mov edx, lcalc
    int 80h

    ret

clear_screen :

    mov eax, 4
    mov ebx, 1
    mov ecx, clr_scr
    mov edx, len_clr_scr 
    int 0x80

    ret

_space :

    mov eax, 4
    mov ebx, [isilog]
    mov ecx, spasi
    mov edx, lspasi
    int 0x80

    ret

_newline :

    mov eax, 4
    mov ebx, [isilog]
    mov ecx, newline
    mov edx, lnewline
    int 0x80

    ret

_log_result :

    mov eax, 4
    mov ebx, [isilog]
    mov ecx, result
    mov edx, lresult
    int 80h

    ret

_n :
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, lnewline
    int 0x80

    ret

FPE :

    mov eax, 4
    mov ebx, 1
    mov ecx, FPEtext
    mov edx, lFPEtext
    int 0x80

    ret


exit :
    mov eax, 1      ; 1 is the exit syscal number
    mov ebx, 0      ; the status value to return
    int 0x80        ; execute a system call
