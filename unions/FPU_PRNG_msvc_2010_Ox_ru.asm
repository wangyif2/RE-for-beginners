
$SG4232    DB    '%f', 0aH, 00H

__real@3ff0000000000000 DQ 03ff0000000000000r    ; 1

tv140 = -4                        ; size = 4
_tmp$ = -4                        ; size = 4
_main    PROC
    push   ebp
    mov    ebp, esp
    and    esp, -64               ; ffffffc0H
    sub    esp, 56                ; 00000038H
    push   esi
    push   edi
    push   0
    call   __time64
    add    esp, 4
    mov    esi, eax
    mov    edi, 100               ; 00000064H
$LN3@main:

; собственно, генерируем случайное 32-битное число

    imul   esi, 1664525           ; 0019660dH
    add    esi, 1013904223        ; 3c6ef35fH
    mov    eax, esi

; оставляем биты необходимые только для мантиссы

    and    eax, 8388607           ; 007fffffH

; выставляем экспоненту в 1
    
    or     eax, 1065353216        ; 3f800000H

; записываем это значение как int

    mov    DWORD PTR _tmp$[esp+64], eax
    sub    esp, 8

; загружаем это значение уже как float

    fld    DWORD PTR _tmp$[esp+72]

; отнимаем единицу от него

    fsub   QWORD PTR __real@3ff0000000000000
    fstp   DWORD PTR tv140[esp+72]
    fld    DWORD PTR tv140[esp+72]
    fstp   QWORD PTR [esp]
    push   OFFSET $SG4232
    call   _printf
    add    esp, 12                ; 0000000cH
    dec    edi
    jne    SHORT $LN3@main
    pop    edi
    xor    eax, eax
    pop    esi
    mov    esp, ebp
    pop    ebp
    ret    0
_main    ENDP
_TEXT    ENDS
END
