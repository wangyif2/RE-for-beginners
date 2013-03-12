                public main
main            proc near

var_20          = dword ptr -20h

                push    ebp
                mov     ebp, esp
                and     esp, 0FFFFFFF0h
                push    ebx
                mov     ebx, 2                ; i=2
                sub     esp, 1Ch
                nop                           ; aligning label loc_80484D0 (loop body begin) by 16-byte border

loc_80484D0:
                mov     [esp+20h+var_20], ebx ; pass i as first argument to f()
                add     ebx, 1                ; i++
                call    f
                cmp     ebx, 64h              ; i==100?
                jnz     short loc_80484D0     ; if not, continue
                add     esp, 1Ch
                xor     eax, eax              ; return 0
                pop     ebx
                mov     esp, ebp
                pop     ebp
                retn
main            endp
