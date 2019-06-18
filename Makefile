# 

RM=rm -f

boot.img: 
	nasm boot.asm -o boot.img

clean:
	$(RM) boot.img