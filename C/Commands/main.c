#include <stdio.h>
#include <err.h>
#include <stdlib.h>
#include <unistd.h>

int main (int argc, char* argv[])
{
	if (argc != 2){
		errx(1, "err");
	}

	if (execl("/bin/ls", "ls", argv[1], 0) == -1) {
		err(99, "err excling");
	} else {
		printf("foobar\n");
	}
	exit(0);
}


