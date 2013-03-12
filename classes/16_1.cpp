#include <stdio.h>

class c
{
private:
    int v1;
    int v2;
public:
    c() // ctor
    {
        v1=667;
        v2=999;
    };

    c(int a, int b) // ctor
    {
        v1=a;
        v2=b;
    };

    void dump()
    {
        printf ("%d; %d\n", v1, v2);
    };
};

int main()
{
    class c c1;
    class c c2(5,6);
    
    c1.dump();
    c2.dump();

    return 0;
};
