_this$ = -4            ; size = 4
?dump@c@@QAEXXZ PROC   ; c::dump, COMDAT
; _this$ = ecx
    push   ebp
    mov    ebp, esp
    push   ecx
    mov    DWORD PTR _this$[ebp], ecx
    mov    eax, DWORD PTR _this$[ebp]
    mov    ecx, DWORD PTR [eax+4]
    push   ecx
    mov    edx, DWORD PTR _this$[ebp]
    mov    eax, DWORD PTR [edx]
    push   eax
    push   OFFSET ??_C@_07NJBDCIEC@?$CFd?$DL?5?$CFd?6?$AA@
    call   _printf
    add    esp, 12     ; 0000000cH
    mov    esp, ebp
    pop    ebp
    ret    0
?dump@c@@QAEXXZ ENDP   ; c::dump
