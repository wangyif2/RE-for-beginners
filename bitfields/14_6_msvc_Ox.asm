_a$ = 8                      ; size = 4
_f    PROC
    mov    eax, DWORD PTR _a$[esp-4]
    and    eax, -513         ; fffffdffH
    or     eax, 16384        ; 00004000H
    ret    0
_f    ENDP
