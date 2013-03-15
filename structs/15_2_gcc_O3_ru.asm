; f(float)
      public _Z1ff
_Z1ff proc near

var_4 = dword ptr -4
arg_0 = dword ptr  8

      push    ebp
      mov     ebp, esp
      sub     esp, 4
      mov     eax, [ebp+arg_0]
      or      eax, 80000000h  ; выставить знак '-'
      mov     edx, eax
      and     eax, 807FFFFFh  ; оставить в eax только знак и мантиссу
      shr     edx, 23         ; подготовить экспоненту
      add     edx, 2          ; прибавить 2
      movzx   edx, dl         ; сбросить все биты кроме 7:0 в EAX в 0
      shl     edx, 23         ; подвинуть новую только что вычисленную экспоненту на свое место
      or      eax, edx        ; сложить новую экспоненту и оригинальное значение без экспоненты
      mov     [ebp+var_4], eax
      fld     [ebp+var_4]
      leave
      retn
_Z1ff endp

      public main
main  proc near
      push    ebp
      mov     ebp, esp
      and     esp, 0FFFFFFF0h
      sub     esp, 10h
      fld     ds:dword_8048614 ; -4.936
      fstp    qword ptr [esp+8]
      mov     dword ptr [esp+4], offset asc_8048610 ; "%f\n"
      mov     dword ptr [esp], 1
      call    ___printf_chk
      xor     eax, eax
      leave
      retn
main  endp
