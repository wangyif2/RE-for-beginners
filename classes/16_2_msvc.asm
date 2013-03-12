_this$ = -4             ; size = 4
??0c@@QAE@XZ PROC       ; c::c, COMDAT
; _this$ = ecx
    push   ebp
    mov    ebp, esp
    push   ecx
    mov    DWORD PTR _this$[ebp], ecx
    mov    eax, DWORD PTR _this$[ebp]
    mov    DWORD PTR [eax], 667      ; 0000029bH
    mov    ecx, DWORD PTR _this$[ebp]
    mov    DWORD PTR [ecx+4], 999    ; 000003e7H
    mov    eax, DWORD PTR _this$[ebp]
    mov    esp, ebp
    pop    ebp
    ret    0
??0c@@QAE@XZ ENDP                  ; c::c

_this$ = -4                        ; size = 4
_a$ = 8                            ; size = 4
_b$ = 12                           ; size = 4
??0c@@QAE@HH@Z PROC                ; c::c, COMDAT
; _this$ = ecx
    push   ebp
    mov    ebp, esp
    push   ecx
    mov    DWORD PTR _this$[ebp], ecx
    mov    eax, DWORD PTR _this$[ebp]
    mov    ecx, DWORD PTR _a$[ebp]
    mov    DWORD PTR [eax], ecx
    mov    edx, DWORD PTR _this$[ebp]
    mov    eax, DWORD PTR _b$[ebp]
    mov    DWORD PTR [edx+4], eax
    mov    eax, DWORD PTR _this$[ebp]
    mov    esp, ebp
    pop    ebp
    ret    8
??0c@@QAE@HH@Z ENDP                ; c::c
