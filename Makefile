# TODO add back -Wextra when quickjs is -Wextra clean
CFLAGS = -Wall -Os

.PHONY: all
all: libquickjit.a

.PHONY: clean
clean:
	$(RM) *.[ao]

libquickjit.a: cutils.o libregexp.o libtcc.o libunicode.o quickjs.o
	$(AR) rcs $@ $^

libtcc.o: CFLAGS+=-DTCC_VERSION='"0.9.28rc"'
quickjs.o: CFLAGS+=-DCONFIG_VERSION='"2021-03-27"'

cutils.o: cutils.c cutils.h
libregexp.o: libregexp.c cutils.h libregexp.h libunicode.h libregexp-opcode.h
libtcc.o: libtcc.c tccpp.c tcc.h config.h libtcc.h dwarf.h x86_64-gen.c x86_64-link.c tcctok.h i386-tok.h x86_64-asm.h tccgen.c tccdbg.c tccasm.c tccelf.c tccrun.c i386-asm.c
libunicode.o: libunicode.c cutils.h libunicode.h libunicode-table.h
quickjs.o: quickjs.c cutils.h list.h quickjs.h libregexp.h libunicode.h quickjs-atom.h quickjs-opcode.h
