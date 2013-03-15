.text:00541204 sub     edx, 0
.text:00541207 jz      short call_rotate1 ; если остаток 0, перейти к rotate1
.text:00541209 dec     edx
.text:0054120A jz      short call_rotate2 ; .. если он 1, перейти к rotate2
.text:0054120C dec     edx
.text:0054120D jnz     short next_character_in_password
.text:0054120F test    ebx, ebx
.text:00541211 jle     short next_character_in_password
.text:00541213 mov     edi, ebx
