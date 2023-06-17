CFLAGS=-Wall $(shell pkg-config --cflags libxml-2.0 libcurl)
LDFLAGS= $(shell pkg-config --libs libxml-2.0 libcurl)

all: bin/workerinstall
#simpledatabasehandler_unit_tests

bin/workerinstall: workerinstall.o
	$(CC) $(LDFLAGS) -g workerinstall.o -o bin/workerinstall

%.o:%.c
	$(CC) $(CFLAGS) -g -c $< -o $@

#simpledatabasehandler_unit_tests:
#	gcc -g -c ./simpledatabasehandler/unit_tests.c -o ./simpledatabasehandler/unit_tests.o -I./simpledatabasehandler
#	gcc -g -c ./simpledatabasehandler/simpledatabasehandler.c -o ./simpledatabasehandler/simpledatabasehandler.o -I./simpledatabasehandler
#	gcc -g -o ./unit_tests ./simpledatabasehandler/unit_tests.o ./simpledatabasehandler/simpledatabasehandler.o

clean:
	rm -f *.o bin/workerinstall