smoketest: smoketest.asm binsearchbonus.asm
	nasm -felf64 binsearchbonus.asm
	nasm -felf64 smoketest.asm
	ld -o smoketest smoketest.o binsearchbonus.o

.PHONY: clean
clean:
	rm -f smoketest binsearchbonus.o smoketest.o
