                public insert
insert          proc near

x               = dword ptr  8
y               = dword ptr  0Ch
z               = dword ptr  10h
value           = dword ptr  14h

                push    ebp
                mov     ebp, esp
                push    ebx
                mov     ebx, [ebp+x]
                mov     eax, [ebp+y]
                mov     ecx, [ebp+z]
                lea     edx, [eax+eax]
                mov     eax, edx
                shl     eax, 4
                sub     eax, edx
                imul    edx, ebx, 600
                add     eax, edx
                lea     edx, [eax+ecx]
                mov     eax, [ebp+value]
                mov     dword ptr ds:a[edx*4], eax
                pop     ebx
                pop     ebp
                retn
insert          endp
