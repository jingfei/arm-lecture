
default: fib

fib: fib.o
	gcc -Wall -pg fib.c -o fib

fib.o: fib.c

qemu: fib
	@num=1 ; while [ $$num -le 10 ] ; do \
		echo "go to $$num" ; \
		echo "\ngo to $$num \n" >> analysis.txt ; \
		./fib $$num ; \
		gprof fib gmon.out -p -b >> analysis.txt ; \
		num=`expr $$num + 1` ; \
	done

clean: 
	rm fib fib.o gmon.out analysis.txt
