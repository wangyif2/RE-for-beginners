#include <windows.h>
	
#include <stdio.h>
#include <assert.h>

#define IS_SET(flag, bit)       ((flag) & (bit))
#define SET_BIT(var, bit)       ((var) |= (bit))
#define REMOVE_BIT(var, bit)    ((var) &= ~(bit))

static BYTE cube[8][8];

void set_bit (int x, int y, int z, bool bit)
{
	if (bit)
		SET_BIT (cube[x][y], 1<<z);
	else
		REMOVE_BIT (cube[x][y], 1<<z);
};

bool get_bit (int x, int y, int z)
{
	if ((cube[x][y]>>z)&1==1)
		return true;
	return false;
};

void rotate_f (int row)
{
	bool tmp[8][8];
	int x, y;

	for (x=0; x<8; x++)
		for (y=0; y<8; y++)
			tmp[x][y]=get_bit (x, y, row);

	for (x=0; x<8; x++)
		for (y=0; y<8; y++)
			set_bit (y, 7-x, row, tmp[x][y]);
};

void rotate_t (int row)
{
	bool tmp[8][8];
	int y, z;

	for (y=0; y<8; y++)
		for (z=0; z<8; z++)
			tmp[y][z]=get_bit (row, y, z);

	for (y=0; y<8; y++)
		for (z=0; z<8; z++)
			set_bit (row, z, 7-y, tmp[y][z]);
};

void rotate_l (int row)
{
	bool tmp[8][8];
	int x, z;

	for (x=0; x<8; x++)
		for (z=0; z<8; z++)
			tmp[x][z]=get_bit (x, row, z);

	for (x=0; x<8; x++)
		for (z=0; z<8; z++)
			set_bit (7-z, row, x, tmp[x][z]);
};

void rotate_all (char *pwd, int v)
{
	char *p=pwd;

	while (*p)
	{
		char c=*p;
		int q;

		c=tolower (c);

		if (c>='a' && c<='z')
		{
			q=c-'a';
			if (q>24)
				q-=24;

			int quotient=q/3;
			int remainder=q % 3;

			switch (remainder)
			{
			case 0: for (int i=0; i<v; i++) rotate1 (quotient); break;
			case 1: for (int i=0; i<v; i++) rotate2 (quotient); break;
			case 2: for (int i=0; i<v; i++) rotate3 (quotient); break;
			};
		};

		p++;
	};
};

void crypt (BYTE *buf, int sz, char *pw)
{
	int i=0;
	
	do
	{
		memcpy (cube, buf+i, 8*8);
		rotate_all (pw, 1);
		memcpy (buf+i, cube, 8*8);
		i+=64;
	}
	while (i<sz);
};

void decrypt (BYTE *buf, int sz, char *pw)
{
	char *p=strdup (pw);
	strrev (p);
	int i=0;

	do
	{
		memcpy (cube, buf+i, 8*8);
		rotate_all (p, 3);
		memcpy (buf+i, cube, 8*8);
		i+=64;
	}
	while (i<sz);
	
	free (p);
};

void crypt_file(char *fin, char* fout, char *pw)
{
	FILE *f;
	int flen, flen_aligned;
	BYTE *buf;

	f=fopen(fin, "rb");
	
	if (f==NULL)
	{
		printf ("Cannot open input file!\n");
		return;
	};

	fseek (f, 0, SEEK_END);
	flen=ftell (f);
	fseek (f, 0, SEEK_SET);

	flen_aligned=(flen&0xFFFFFFC0)+0x40;

	buf=(BYTE*)malloc (flen_aligned);
	memset (buf, 0, flen_aligned);

	fread (buf, flen, 1, f);

	fclose (f);

	crypt (buf, flen_aligned, pw);
	
	f=fopen(fout, "wb");

	fwrite ("QR9", 3, 1, f);
	fwrite (&flen, 4, 1, f);
	fwrite (buf, flen_aligned, 1, f);

	fclose (f);

	free (buf);

};

void decrypt_file(char *fin, char* fout, char *pw)
{
	FILE *f;
	int real_flen, flen;
	BYTE *buf;

	f=fopen(fin, "rb");
	
	if (f==NULL)
	{
		printf ("Cannot open input file!\n");
		return;
	};

	fseek (f, 0, SEEK_END);
	flen=ftell (f);
	fseek (f, 0, SEEK_SET);

	buf=(BYTE*)malloc (flen);

	fread (buf, flen, 1, f);

	fclose (f);

	if (memcmp (buf, "QR9", 3)!=0)
	{
		printf ("File is not crypted!\n");
		return;
	};

	memcpy (&real_flen, buf+3, 4);

	decrypt (buf+(3+4), flen-(3+4), pw);
	
	f=fopen(fout, "wb");

	fwrite (buf+(3+4), real_flen, 1, f);

	fclose (f);

	free (buf);
};

// run: input output 0/1 password
// 0 for encrypt, 1 for decrypt

int main(int argc, char *argv[])
{
	if (argc!=5)
	{
		printf ("Incorrect parameters!\n");
		return 1;
	};

	if (strcmp (argv[3], "0")==0)
		crypt_file (argv[1], argv[2], argv[4]);
	else
		if (strcmp (argv[3], "1")==0)
			decrypt_file (argv[1], argv[2], argv[4]);
		else
			printf ("Wrong param %s\n", argv[3]);

	return 0;
};
