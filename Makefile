# TODO add back -Wextra when quickjs is -Wextra clean
CFLAGS = -Wall -Os

.PHONY: all
all: libquickjs.a

.PHONY: clean
clean:
	$(RM) *.[ao] t

libquickjs.a: cutils.o libregexp.o libunicode.o quickjs.o
	$(AR) rcs $@ $^

cutils.o: cutils.c cutils.h
libregexp.o: libregexp.c cutils.h libregexp.h libunicode.h libregexp-opcode.h
libunicode.o: libunicode.c cutils.h libunicode.h libunicode-table.h
quickjs.o: CFLAGS+=-DCONFIG_VERSION='"2021-03-27"'
quickjs.o: quickjs.c cutils.h list.h quickjs.h libregexp.h libunicode.h quickjs-atom.h quickjs-opcode.h
