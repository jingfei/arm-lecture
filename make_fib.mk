CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O1 -Wall
LDFLAGS = -fno-stack-protector

objects	= fibseq.o fib.o

default: fibseq

.PHONY: default clean qemu

fibseq: $(objects)
	$(CC) $(LDFLAGS) -o $@ $^

fib.o: fib.s
fibseq.o: fibseq.c

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) fibseq

QEMU_CMD = qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq &
CMD = yes 9 | $(call QEMU_CMD) && sleep 1
qemu: fibseq
	@num=1 ; i1=0 ; i2=1 ; \
	while [ $$num -le 50 ] ; do \
		# save output answer \
		ans=`yes $$num | $(call QEMU_CMD)` ; \
		sleep 0.5 ; \
		# echo output \
		echo $$ans ; \
		# split output string && save answer \
		ans=`echo $$ans | cut -d ' ' -f 7` ;  \
		# calculate the correct answer \
		i3=$$i2 ;  i2=`expr $$i1 + $$i2` ; i1=$$i3 ; \
		# check if it is right \
		if [ "$$i1" -eq "$$ans" ] ; then \
			echo " -> correct" ; \
		else \
			echo " -> wrong, the ans is $$i1" ; \
		fi ; \
		num=`expr $$num + 1` ; \
	done

