_str$ = 8                        ; size = 4
_strlen PROC
    mov    ecx, DWORD PTR _str$[esp-4] ; ECX -> указатель на строку
    mov    eax, ecx                    ; переложить в EAX
$LL2@strlen_:
    mov    dl, BYTE PTR [eax]          ; DL = *EAX
    inc    eax                         ; EAX++
    test    dl, dl                     ; DL==0?
    jne    SHORT $LL2@strlen_          ; нет, продолжаем цикл
    sub    eax, ecx                    ; вычисляем разницу указателей
    dec    eax                         ; декремент EAX
    ret    0
_strlen_ ENDP
