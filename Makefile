all:
	gcc -m32 -no-pie -nostdlib -c ./test_files/sum.c -o sum.o
	gcc -m32 -no-pie -nostdlib -c ./test_files/fib.c -o fib.o
	gcc -m32 -c loader.c -o loader.o

	gcc -m32 -no-pie -nostdlib sum.o -o sum
	gcc -m32 -no-pie -nostdlib fib.o -o fib
	gcc -m32 loader.o -o loader

	ar rcs lib_simpleloader.a loader.o

clean:
	-@rm -f *.o sum fib loader lib_simpleloader.a