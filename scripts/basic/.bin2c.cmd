cmd_scripts/basic/bin2c := gcc -Wp,-MD,scripts/basic/.bin2c.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89     -o scripts/basic/bin2c scripts/basic/bin2c.c  

source_scripts/basic/bin2c := scripts/basic/bin2c.c

deps_scripts/basic/bin2c := \
  /usr/x86_64-linux-gnu/include/stdc-predef.h \
  /usr/x86_64-linux-gnu/include/stdio.h \
  /usr/x86_64-linux-gnu/include/bits/libc-header-start.h \
  /usr/x86_64-linux-gnu/include/features.h \
  /usr/x86_64-linux-gnu/include/features-time64.h \
  /usr/x86_64-linux-gnu/include/bits/wordsize.h \
  /usr/x86_64-linux-gnu/include/bits/timesize.h \
  /usr/x86_64-linux-gnu/include/sys/cdefs.h \
  /usr/x86_64-linux-gnu/include/bits/long-double.h \
  /usr/x86_64-linux-gnu/include/gnu/stubs.h \
  /usr/x86_64-linux-gnu/include/gnu/stubs-64.h \
  /usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h \
  /usr/lib/gcc/x86_64-linux-gnu/11/include/stdarg.h \
  /usr/x86_64-linux-gnu/include/bits/types.h \
  /usr/x86_64-linux-gnu/include/bits/typesizes.h \
  /usr/x86_64-linux-gnu/include/bits/time64.h \
  /usr/x86_64-linux-gnu/include/bits/types/__fpos_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/__mbstate_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/__fpos64_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/__FILE.h \
  /usr/x86_64-linux-gnu/include/bits/types/FILE.h \
  /usr/x86_64-linux-gnu/include/bits/types/struct_FILE.h \
  /usr/x86_64-linux-gnu/include/bits/stdio_lim.h \
  /usr/x86_64-linux-gnu/include/bits/floatn.h \
  /usr/x86_64-linux-gnu/include/bits/floatn-common.h \
  /usr/x86_64-linux-gnu/include/bits/stdio.h \
  /usr/x86_64-linux-gnu/include/bits/stdio2.h \

scripts/basic/bin2c: $(deps_scripts/basic/bin2c)

$(deps_scripts/basic/bin2c):
