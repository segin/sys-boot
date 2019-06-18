# 

RM=rm -f

boot.img: 
	nasm boot.asm -o boot.o
	nasm payload.asm -o payload.o
	cat boot.o payload.o > boot.img

clean:
	$(RM) boot.img boot.o payload.o