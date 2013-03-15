.text:00541369 mov     esi, [esp+2Ch+Str]

; сбросить в ноль младшие 6 бит
.text:0054136D and     esi, 0FFFFFFC0h

; выровнять размер по 64-байтной границе
.text:00541370 add     esi, 40h        
