_str$ = 8                       ; size = 4
_strlen PROC
    mov    ecx, DWORD PTR _str$[esp-4]  ; ECX -> pointer to the string
    mov    eax, ecx                     ; move to EAX
$LL2@strlen_:
    mov    dl, BYTE PTR [eax]           ; DL = *EAX
    inc    eax                          ; EAX++
    test    dl, dl                      ; DL==0?
    jne    SHORT $LL2@strlen_           ; no, continue loop
    sub    eax, ecx                     ; calculate pointers difference
    dec    eax                          ; decrement EAX
    ret    0
_strlen_ ENDP
