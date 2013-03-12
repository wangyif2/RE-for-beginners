.globl f_unsigned
    .type    f_unsigned, @function
f_unsigned:
    push   ebp
    mov    ebp, esp
    sub    esp, 24
    mov    eax, DWORD PTR [ebp+8]
    cmp    eax, DWORD PTR [ebp+12]
    jbe    .L7
    mov    DWORD PTR [esp], OFFSET FLAT:.LC0 ; "a>b"
    call   puts
.L7:
    mov    eax, DWORD PTR [ebp+8]
    cmp    eax, DWORD PTR [ebp+12]
    jne    .L8
    mov    DWORD PTR [esp], OFFSET FLAT:.LC1 ; "a==b"
    call   puts
.L8:
    mov    eax, DWORD PTR [ebp+8]
    cmp    eax, DWORD PTR [ebp+12]
    jae    .L10
    mov    DWORD PTR [esp], OFFSET FLAT:.LC2 ; "a<b"
    call   puts
.L10:
    leave
    ret
