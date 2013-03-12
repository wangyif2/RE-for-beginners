??0c@@QAE@XZ PROC               ; c::c, COMDAT
; _this$ = ecx
    mov    eax, ecx
    mov    DWORD PTR [eax], 667   ; 0000029bH
    mov    DWORD PTR [eax+4], 999 ; 000003e7H
    ret    0
??0c@@QAE@XZ ENDP                 ; c::c

_a$ = 8                           ; size = 4
_b$ = 12                          ; size = 4
??0c@@QAE@HH@Z PROC               ; c::c, COMDAT
; _this$ = ecx
    mov    edx, DWORD PTR _b$[esp-4]
    mov    eax, ecx
    mov    ecx, DWORD PTR _a$[esp-4]
    mov    DWORD PTR [eax], ecx
    mov    DWORD PTR [eax+4], edx
    ret    8
??0c@@QAE@HH@Z ENDP               ; c::c

?dump@c@@QAEXXZ PROC              ; c::dump, COMDAT
; _this$ = ecx
    mov    eax, DWORD PTR [ecx+4]
    mov    ecx, DWORD PTR [ecx]
    push   eax
    push   ecx
    push   OFFSET ??_C@_07NJBDCIEC@?$CFd?$DL?5?$CFd?6?$AA@
    call   _printf
    add    esp, 12                ; 0000000cH
    ret    0
?dump@c@@QAEXXZ ENDP              ; c::dump
