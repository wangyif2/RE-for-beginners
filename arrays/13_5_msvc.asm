_DATA    SEGMENT
COMM     _a:DWORD:01770H
_DATA    ENDS
PUBLIC   _insert
_TEXT    SEGMENT
_x$ = 8                 ; size = 4
_y$ = 12                ; size = 4
_z$ = 16                ; size = 4
_value$ = 20            ; size = 4
_insert    PROC
    push   ebp
    mov    ebp, esp
    mov    eax, DWORD PTR _x$[ebp]
    imul   eax, 2400                ; 00000960H
    mov    ecx, DWORD PTR _y$[ebp]
    imul   ecx, 120                ; 00000078H
    lea    edx, DWORD PTR _a[eax+ecx]
    mov    eax, DWORD PTR _z$[ebp]
    mov    ecx, DWORD PTR _value$[ebp]
    mov    DWORD PTR [edx+eax*4], ecx
    pop    ebp
    ret    0
_insert    ENDP
_TEXT      ENDS
