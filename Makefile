all: d1 d2 l t s

d1:
	bash d1.sh

d2:
	bash d2.sh

l:
	bash l.sh

t: 
	gcc -o tr-t tr-t.c
	bash t.sh

s: 
	gcc -o trai-s trai-s.c
	bash s.sh

clean:
	rm -f tr-t trai-s
