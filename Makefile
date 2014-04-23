# 
# sss Makefile
#
# Description: 
# 	Makefile for building sss
#
# Dependencies:
#	G++:		http://gcc.gnu.org/
#	Allegro 5:	https://www.allegro.cc/
#	pkg-config:	http://www.freedesktop.org/wiki/Software/pkg-config/
#
#

CXX = g++
CFLAGS = -Wall -g
LDFLAGS=

CFLAGS += $(shell pkg-config --cflags allegro_main-5.0)
LDFLAGS += $(shell pkg-config --libs allegro_main-5.0)

.PHONY: clean

OBJ = main
OBJS= $(addsuffix .o,$(OBJ))
OUT = sss

sss: $(OBJS)
	$(CXX) $(OBJS) -o $(OUT) $(LDFLAGS)

main.o: ./src/main.cpp
	$(CXX) $(CFLAGS) -o $@ -c $<


# Generic
# -------

clean:
	rm -rvf sss *.o
