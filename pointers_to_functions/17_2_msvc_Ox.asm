__a$ = 8            ; size = 4
__b$ = 12           ; size = 4
_comp      PROC
    mov    eax, DWORD PTR __a$[esp-4]
    mov    ecx, DWORD PTR __b$[esp-4]
    mov    eax, DWORD PTR [eax]
    mov    ecx, DWORD PTR [ecx]
    cmp    eax, ecx
    jne    SHORT $LN4@comp
    xor    eax, eax
    ret    0
$LN4@comp:
    xor    edx, edx
    cmp    eax, ecx
    setge  dl
    lea    eax, DWORD PTR [edx+edx-1]
    ret    0
_comp      ENDP

...

_numbers$ = -44       ; size = 40
_i$ = -4              ; size = 4
_argc$ = 8            ; size = 4
_argv$ = 12           ; size = 4
_main    PROC
    push    ebp
    mov    ebp, esp
    sub    esp, 44                              ; 0000002cH
    mov    DWORD PTR _numbers$[ebp], 1892       ; 00000764H
    mov    DWORD PTR _numbers$[ebp+4], 45       ; 0000002dH
    mov    DWORD PTR _numbers$[ebp+8], 200      ; 000000c8H
    mov    DWORD PTR _numbers$[ebp+12], -98     ; ffffff9eH
    mov    DWORD PTR _numbers$[ebp+16], 4087    ; 00000ff7H
    mov    DWORD PTR _numbers$[ebp+20], 5
    mov    DWORD PTR _numbers$[ebp+24], -12345  ; ffffcfc7H
    mov    DWORD PTR _numbers$[ebp+28], 1087    ; 0000043fH
    mov    DWORD PTR _numbers$[ebp+32], 88      ; 00000058H
    mov    DWORD PTR _numbers$[ebp+36], -100000 ; fffe7960H
    push    OFFSET _comp
    push    4
    push    10                                  ; 0000000aH
    lea    eax, DWORD PTR _numbers$[ebp]
    push    eax
    call    _qsort
    add    esp, 16                              ; 00000010H

...
