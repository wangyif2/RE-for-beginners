_TEXT    SEGMENT
_i$ = -84                 ; size = 4
_a$ = -80                 ; size = 80
_main      PROC
    push   ebp
    mov    ebp, esp
    sub    esp, 84                    ; 00000054H
    mov    DWORD PTR _i$[ebp], 0
    jmp    SHORT $LN3@main
$LN2@main:
    mov    eax, DWORD PTR _i$[ebp]
    add    eax, 1
    mov    DWORD PTR _i$[ebp], eax
$LN3@main:
    cmp    DWORD PTR _i$[ebp], 30            ; 0000001eH
    jge    SHORT $LN1@main
    mov    ecx, DWORD PTR _i$[ebp]  
    mov    edx, DWORD PTR _i$[ebp]       ; €вный промах компил€тора. эта инструкци€ лишн€€.
    mov    DWORD PTR _a$[ebp+ecx*4], edx ; а здесь в качестве второго операнда подошел бы ECX.
    jmp    SHORT $LN2@main
$LN1@main:
    xor    eax, eax
    mov    esp, ebp
    pop    ebp
    ret    0
_main      ENDP
