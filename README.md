quickjit
========

quickjs meets jit

# what?

This is a fork of [QuickJS](https://bellard.org/quickjs/) that just-in-time
compiles JavaScript code to native machine code.

# how?

QuickJS compiles JavaScript to bytecode. QuickJIT then takes the bytecode,
translates it to C and compiles it with [tcc](https://bellard.org/tcc/).

# license

QuickJIT has the same license as QuickJS. tcc is LGPL.
