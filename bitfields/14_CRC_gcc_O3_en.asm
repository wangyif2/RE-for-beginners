                public crc
crc             proc near

key             = dword ptr  8
hash            = dword ptr  0Ch

                push    ebp
                xor     edx, edx
                mov     ebp, esp
                push    esi
                mov     esi, [ebp+key]
                push    ebx
                mov     ebx, [ebp+hash]
                test    ebx, ebx
                mov     eax, ebx
                jz      short loc_80484D3
                nop                     ; padding
                lea     esi, [esi+0]    ; padding; ESI doesn't changing here

loc_80484B8:
                mov     ecx, eax        ; save previous state of hash to ecx
                xor     al, [esi+edx]   ; al=*(key+i)
                add     edx, 1          ; i++
                shr     ecx, 8          ; ecx=hash>>8
                movzx   eax, al         ; eax=*(key+i)
                mov     eax, dword ptr ds:crctab[eax*4] ; eax=crctab[eax]
                xor     eax, ecx        ; hash=eax^ecx
                cmp     ebx, edx
                ja      short loc_80484B8

loc_80484D3:
                pop     ebx
                pop     esi
                pop     ebp
                retn
crc             endp
\