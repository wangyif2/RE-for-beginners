_key$ = 8           ; size = 4
_len$ = 12          ; size = 4
_hash$ = 16         ; size = 4
_crc    PROC
    mov    edx, DWORD PTR _len$[esp-4]
    xor    ecx, ecx                      ; i будет лежать в регистре ECX
    mov    eax, edx
    test   edx, edx
    jbe    SHORT $LN1@crc
    push   ebx
    push   esi
    mov    esi, DWORD PTR _key$[esp+4]   ; ESI = key
    push   edi
$LL3@crc:

; работаем с байтами используя 32-битные регистры. в EDI положим байт с адреса key+i

    movzx  edi, BYTE PTR [ecx+esi]             
    mov    ebx, eax  ; EBX = (hash = len)
    and    ebx, 255  ; EBX = hash & 0xff


; XOR EDI, EBX (EDI=EDI^EBX) - это операциия задействует все 32 бита каждого регистра
; но остальные биты (8-31) будут обнулены всегда, так что все ОК
; они обнулены потому что для EDI это было сделано инструкцией MOVZX выше
; а старшие биты EBX были сброшены инструкцией AND EBX, 255 (255 = 0xff)

    xor    edi, ebx                            
    
    ; EAX=EAX>>8; образовавшиеся из ниоткуда биты в результате (биты 24-31) будут заполнены нулями
    shr    eax, 8   

    ; EAX=EAX^crctab[EDI*4] - выбираем элемент из таблицы crctab[] под номером EDI
    xor    eax, DWORD PTR _crctab[edi*4] 
    inc    ecx               ; i++
    cmp    ecx, edx          ; i<len ?
    jb     SHORT $LL3@crc    ; да
    pop    edi
    pop    esi
    pop    ebx
$LN1@crc:
    ret    0
_crc    ENDP
