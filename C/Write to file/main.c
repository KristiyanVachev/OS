#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

int main()
{

	FILE* file = fopen("test.bmp", "r+b");
	fseek(file, 200, SEEK_SET);
	fwrite(" ", 1, 1, file);
	fclose(file);

	exit(0);
}
