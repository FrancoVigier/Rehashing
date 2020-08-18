CC = gcc
CFLAGS = -g -O3 -lm -Wall -Wextra -Werror -std=c99

.PHONY: default_target all clean

default_target: Rehashing
all: default_target

OBJECTS_TABLAHASH = $(patsubst %.c, compilados/.obj/%.o, $(wildcard tablahash/*.c))
HEADERS_TABLAHASH = $(wildcard tablahash/*.h)

OBJECTS_REHASHING = $(patsubst %.c, compilados/.obj/%.o, $(wildcard *.c))
HEADERS_REHASHING = $(wildcard *.h)

compilados/.obj/%.o: %.c $(HEADERS_TABLAHASH) $(HEADERS_REHASHING)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: Rehashing $(OBJECTS_TABLAHASH) $(OBJECTS_REHASHING)

Rehashing: compilados compilados/.obj compilados/.obj/tablahash $(OBJECTS_TABLAHASH) $(OBJECTS_REHASHING)
	$(CC) $(OBJECTS_TABLAHASH) $(OBJECTS_REHASHING) $(CFLAGS) -o compilados/$@

compilados:
	mkdir -p $@

compilados/.obj/tablahash:
	mkdir -p $@
	
compilados/.obj:
	mkdir -p $@

clean:
	-rm -rf compilados
