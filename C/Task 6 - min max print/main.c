#include <stdio.h>
#include <err.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdint.h>

int parseOperation();

int main (int argc, char* argv[])
{

	if (argc != 3) {
		errx(1, "Invalid number of args");
	}
	
	int operation = parseOperation(argv); 	

	if (operation < 0)
	{
		errx(1, "Ivalid operation");
	}
	
	//Validate that file exists
	int fd;

	if ((fd = open(argv[2], O_RDONLY)) == -1)
	{
		errx(1, "Operation open failed");
		exit(1);
	}
	uint16_t number;

	//Min
	if (operation == 0)
	{
		uint16_t min;
		read(fd, &min, sizeof(min));
		while(read(fd, &number, sizeof(number)))
		{
			if (min > number)
			{
				min = number;
			}		
		}
		printf("min %u\n", min);
	}
	

	
	
	close(fd);
	exit(0);
}

//Parse the command. If the command is invalid return -1.
int parseOperation(char* argv[])
{
	int isValid = -1;

	int cmp = strcmp(argv[1], "--min");
	if (cmp == 0) {
		isValid = 0;
	}
	
	cmp = strcmp(argv[1], "--max");
 	if (cmp == 0) {
		isValid = 1;
	}

	cmp = strcmp(argv[1], "--print");
 	if (cmp == 0) {
		isValid = 2;
	}

	return isValid;
}


