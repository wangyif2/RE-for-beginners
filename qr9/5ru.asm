.text:00541081 first_loop1_begin:
.text:00541081    xor     esi, esi        ; ESI is счетчик второго цикла
.text:00541083
.text:00541083 first_loop2_begin:
.text:00541083    push    ebp             ; arg_0
.text:00541084    push    esi             ; счетчик первого цикла
.text:00541085    push    edi             ; счетчик второго цикла
.text:00541086    call    get_bit
.text:0054108B    add     esp, 0Ch
.text:0054108E    mov     [ebx+esi], al   ; записываем во внутренний массив
.text:00541091    inc     esi             ; инкремент счетчика первого цикла
.text:00541092    cmp     esi, 8
.text:00541095    jl      short first_loop2_begin
.text:00541097    inc     edi             ; инкремент счетчика второго цикла

; инкремент указателя во внутреннем массиве на 8 на каждой итерации первого цикла
.text:00541098    add     ebx, 8          
.text:0054109B    cmp     edi, 8
.text:0054109E    jl      short first_loop1_begin
