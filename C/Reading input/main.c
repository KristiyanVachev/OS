#include <stdio.h>
#include <err.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdint.h>


int main (int argc, char* argv[])
{

	if (argc != 2) {
		errx(1, "Invalid number of args");
	}
	
	//Validate that file exists
	int fd;

	if ((fd = open(argv[1], O_RDONLY)) == -1)
	{
		errx(1, "Operation open failed");
		exit(1);
	}
	
	char c;

	while (read(fd, &c, 1))
	{
		printf("%c", c);
	} 
	
	close(fd);
	exit(0);
}

