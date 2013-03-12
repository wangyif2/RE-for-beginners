d_max           proc near

b               = qword ptr -10h
a               = qword ptr -8
a_first_half    = dword ptr  8
a_second_half   = dword ptr  0Ch
b_first_half    = dword ptr  10h
b_second_half   = dword ptr  14h

                push    ebp
                mov     ebp, esp
                sub     esp, 10h

; put a and b to local stack:

                mov     eax, [ebp+a_first_half]
                mov     dword ptr [ebp+a], eax
                mov     eax, [ebp+a_second_half]
                mov     dword ptr [ebp+a+4], eax
                mov     eax, [ebp+b_first_half]
                mov     dword ptr [ebp+b], eax
                mov     eax, [ebp+b_second_half]
                mov     dword ptr [ebp+b+4], eax

; load a and b to FPU stack:

                fld     [ebp+a]
                fld     [ebp+b]

; current stack state: ST(0) - b; ST(1) - a

                fxch    st(1) ; this instruction swapping ST(1) and ST(0)

; current stack state: ST(0) - a; ST(1) - b

                fucompp            ; compare a and b and pop two values from stack, i.e., a and b
                fnstsw  ax         ; store FPU status to AX
                sahf               ; load SF, ZF, AF, PF, and CF flags state from AH
                setnbe  al                ; store 1 to AL if CF=0 and ZF=0
                test    al, al            ; AL==0 ?
                jz      short loc_8048453 ; yes
                fld     [ebp+a]
                jmp     short locret_8048456

loc_8048453:
                fld     [ebp+b]

locret_8048456:
                leave
                retn
d_max           endp
