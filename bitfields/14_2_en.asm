_key$ = 8                ; size = 4
_len$ = 12               ; size = 4
_hash$ = 16              ; size = 4
_crc    PROC
    mov    edx, DWORD PTR _len$[esp-4]
    xor    ecx, ecx                      ; i will be stored in ECX
    mov    eax, edx
    test   edx, edx
    jbe    SHORT $LN1@crc
    push   ebx
    push   esi
    mov    esi, DWORD PTR _key$[esp+4]   ; ESI = key
    push   edi
$LL3@crc:

; work with bytes using only 32-bit registers. byte from address key+i we store into EDI

    movzx  edi, BYTE PTR [ecx+esi] 
    mov    ebx, eax    ; EBX = (hash = len)
    and    ebx, 255    ; EBX = hash & 0xff

; XOR EDI, EBX (EDI=EDI^EBX) - this operation uses all 32 bits of each register
; but other bits (8-31) are cleared all time, so it's OK
; these are cleared because, as for EDI, it was done by MOVZX instruction above
; high bits of EBX was cleared by AND EBX, 255 instruction above (255 = 0xff)

    xor    edi, ebx    
    shr    eax, 8                        ; EAX=EAX>>8; bits 24-31 taken "from nowhere" will be cleared
    xor    eax, DWORD PTR _crctab[edi*4] ; EAX=EAX^crctab[EDI*4] - choose EDI-th element from crctab[] table
    inc    ecx                           ; i++
    cmp    ecx, edx                      ; i<len ?
    jb     SHORT $LL3@crc                ; yes
    pop    edi
    pop    esi
    pop    ebx
$LN1@crc:
    ret    0
_crc    ENDP
