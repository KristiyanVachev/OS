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

	if ((fd = open(argv[1], O_CREAT|O_WRONLY)) == -1)
	{
		errx(1, "Operation open failed");
		exit(1);
	}
	
	char message[] = "A nice thing to write";
	char c;
	
	unsigned int i;
	for ( i = 0; i < strlen(message); i = i + 1)
	{	
		c = message[i];
		write(fd, &c, 1);
	} 
	
	close(fd);
	exit(0);
}

