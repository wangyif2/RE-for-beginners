_t$ = -8         ; size = 4
_f$ = -4         ; size = 4
__in$ = 8        ; size = 4
?f@@YAMM@Z PROC  ; f
    push   ebp
    mov    ebp, esp
    sub    esp, 8

    fld    DWORD PTR __in$[ebp]
    fstp   DWORD PTR _f$[ebp]

    push   4
    lea    eax, DWORD PTR _f$[ebp]
    push   eax
    lea    ecx, DWORD PTR _t$[ebp]
    push   ecx
    call   _memcpy
    add    esp, 12          ; 0000000cH

    mov    edx, DWORD PTR _t$[ebp]
    or     edx, -2147483648 ; 80000000H - выставляем знак минус
    mov    DWORD PTR _t$[ebp], edx

    mov    eax, DWORD PTR _t$[ebp]
    shr    eax, 23          ; 00000017H - выкидываем мантиссу
    and    eax, 255         ; 000000ffH - оставляем здесь только экспоненту
    add    eax, 2           ; прибавляем к ней два
    and    eax, 255         ; 000000ffH
    shl    eax, 23          ; 00000017H - пододвигаем результат на место бит 30:23
    mov    ecx, DWORD PTR _t$[ebp]
    and    ecx, -2139095041 ; 807fffffH - выкидываем экспоненту
    
    ; складываем оригинальное значение без экспоненты с новой только что вычисленной экспонентой
    or     ecx, eax         
    mov    DWORD PTR _t$[ebp], ecx

    push   4
    lea    edx, DWORD PTR _t$[ebp]
    push   edx
    lea    eax, DWORD PTR _f$[ebp]
    push   eax
    call   _memcpy
    add    esp, 12          ; 0000000cH

    fld    DWORD PTR _f$[ebp]

    mov    esp, ebp
    pop    ebp
    ret    0
?f@@YAMM@Z ENDP             ; f
