C = gcc
CFLAGS = -g -Wall -std=c99

mm: mm.o
	$(CC) $(CFLAGS) -o mm mm.o

mm.o: mm.c mm.h
	$(CC) $(CFLAGS) -c mm.c

clean:
	$(RM) mm *.o *~
