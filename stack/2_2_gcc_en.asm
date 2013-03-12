                public f
f               proc near               ; CODE XREF: main+6

s               = dword ptr -10h
var_C           = dword ptr -0Ch

                push    ebp
                mov     ebp, esp
                sub     esp, 38h
                mov     eax, large gs:14h
                mov     [ebp+var_C], eax
                xor     eax, eax
                sub     esp, 624
                lea     eax, [esp+18h]
                add     eax, 0Fh
                shr     eax, 4           ; align pointer
                shl     eax, 4           ; by 16-byte border
                mov     [ebp+s], eax
                mov     eax, offset format ; "hi! %d, %d, %d\n"
                mov     dword ptr [esp+14h], 3
                mov     dword ptr [esp+10h], 2
                mov     dword ptr [esp+0Ch], 1
                mov     [esp+8], eax    ; format
                mov     dword ptr [esp+4], 600 ; maxlen
                mov     eax, [ebp+s]
                mov     [esp], eax      ; s
                call    _snprintf
                mov     eax, [ebp+s]
                mov     [esp], eax      ; s
                call    _puts
                mov     eax, [ebp+var_C]
                xor     eax, large gs:14h
                jz      short locret_80484EB
                call    ___stack_chk_fail

locret_80484EB:                         ; CODE XREF: f+70
                leave
                retn
f               endp
