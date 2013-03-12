                public d_max
d_max           proc near

arg_0           = qword ptr  8
arg_8           = qword ptr  10h

                push    ebp
                mov     ebp, esp
                fld     [ebp+arg_0] ; _a
                fld     [ebp+arg_8] ; _b

; состояние стека сейчас: ST(0) = _b, ST(1) = _a

                fxch    st(1)

; состояние стека сейчас: ST(0) = _a, ST(1) = _b

                fucom   st(1) ; сравнить _a и _b
                fnstsw  ax
                sahf
                ja      short loc_8048448
                fstp    st ; записать ST(0) в ST(0) (холостая операция), выкинуть значение лежащее на вершине стека, оставить _b
                jmp     short loc_804844A

loc_8048448:
                fstp    st(1) ; записать _a в ST(0), выкинуть значение лежащее на вершине стека, оставить _a на вершине стека

loc_804844A:
                pop     ebp
                retn
d_max           endp
