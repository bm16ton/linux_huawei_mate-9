cmd_scripts/kconfig/conf.o := gcc -Wp,-MD,scripts/kconfig/.conf.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89   -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1 -DLOCALE   -c -o scripts/kconfig/conf.o scripts/kconfig/conf.c

source_scripts/kconfig/conf.o := scripts/kconfig/conf.c

deps_scripts/kconfig/conf.o := \
    $(wildcard include/config/.h) \
    $(wildcard include/config/seed.h) \
    $(wildcard include/config/allconfig.h) \
    $(wildcard include/config/nosilentupdate.h) \
  /usr/x86_64-linux-gnu/include/stdc-predef.h \
  /usr/x86_64-linux-gnu/include/locale.h \
  /usr/x86_64-linux-gnu/include/features.h \
  /usr/x86_64-linux-gnu/include/features-time64.h \
  /usr/x86_64-linux-gnu/include/bits/wordsize.h \
  /usr/x86_64-linux-gnu/include/bits/timesize.h \
  /usr/x86_64-linux-gnu/include/sys/cdefs.h \
  /usr/x86_64-linux-gnu/include/bits/long-double.h \
  /usr/x86_64-linux-gnu/include/gnu/stubs.h \
  /usr/x86_64-linux-gnu/include/gnu/stubs-64.h \
  /usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h \
  /usr/x86_64-linux-gnu/include/bits/locale.h \
  /usr/x86_64-linux-gnu/include/bits/types/locale_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/__locale_t.h \
  /usr/x86_64-linux-gnu/include/ctype.h \
  /usr/x86_64-linux-gnu/include/bits/types.h \
  /usr/x86_64-linux-gnu/include/bits/typesizes.h \
  /usr/x86_64-linux-gnu/include/bits/time64.h \
  /usr/x86_64-linux-gnu/include/bits/endian.h \
  /usr/x86_64-linux-gnu/include/bits/endianness.h \
  /usr/x86_64-linux-gnu/include/stdio.h \
  /usr/x86_64-linux-gnu/include/bits/libc-header-start.h \
  /usr/lib/gcc/x86_64-linux-gnu/11/include/stdarg.h \
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
  /usr/x86_64-linux-gnu/include/stdlib.h \
  /usr/x86_64-linux-gnu/include/bits/waitflags.h \
  /usr/x86_64-linux-gnu/include/bits/waitstatus.h \
  /usr/x86_64-linux-gnu/include/sys/types.h \
  /usr/x86_64-linux-gnu/include/bits/types/clock_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/clockid_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/time_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/timer_t.h \
  /usr/x86_64-linux-gnu/include/bits/stdint-intn.h \
  /usr/x86_64-linux-gnu/include/endian.h \
  /usr/x86_64-linux-gnu/include/bits/byteswap.h \
  /usr/x86_64-linux-gnu/include/bits/uintn-identity.h \
  /usr/x86_64-linux-gnu/include/sys/select.h \
  /usr/x86_64-linux-gnu/include/bits/select.h \
  /usr/x86_64-linux-gnu/include/bits/types/sigset_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/__sigset_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/struct_timeval.h \
  /usr/x86_64-linux-gnu/include/bits/types/struct_timespec.h \
  /usr/x86_64-linux-gnu/include/bits/select2.h \
  /usr/x86_64-linux-gnu/include/bits/pthreadtypes.h \
  /usr/x86_64-linux-gnu/include/bits/thread-shared-types.h \
  /usr/x86_64-linux-gnu/include/bits/pthreadtypes-arch.h \
  /usr/x86_64-linux-gnu/include/bits/atomic_wide_counter.h \
  /usr/x86_64-linux-gnu/include/bits/struct_mutex.h \
  /usr/x86_64-linux-gnu/include/bits/struct_rwlock.h \
  /usr/x86_64-linux-gnu/include/alloca.h \
  /usr/x86_64-linux-gnu/include/bits/stdlib-bsearch.h \
  /usr/x86_64-linux-gnu/include/bits/stdlib-float.h \
  /usr/x86_64-linux-gnu/include/bits/stdlib.h \
  /usr/x86_64-linux-gnu/include/string.h \
  /usr/x86_64-linux-gnu/include/strings.h \
  /usr/x86_64-linux-gnu/include/bits/strings_fortified.h \
  /usr/x86_64-linux-gnu/include/bits/string_fortified.h \
  /usr/x86_64-linux-gnu/include/time.h \
  /usr/x86_64-linux-gnu/include/bits/time.h \
  /usr/x86_64-linux-gnu/include/bits/types/struct_tm.h \
  /usr/x86_64-linux-gnu/include/bits/types/struct_itimerspec.h \
  /usr/x86_64-linux-gnu/include/unistd.h \
  /usr/x86_64-linux-gnu/include/bits/posix_opt.h \
  /usr/x86_64-linux-gnu/include/bits/environments.h \
  /usr/x86_64-linux-gnu/include/bits/confname.h \
  /usr/x86_64-linux-gnu/include/bits/getopt_posix.h \
  /usr/x86_64-linux-gnu/include/bits/getopt_core.h \
  /usr/x86_64-linux-gnu/include/bits/unistd.h \
  /usr/x86_64-linux-gnu/include/bits/unistd_ext.h \
  /usr/x86_64-linux-gnu/include/getopt.h \
  /usr/x86_64-linux-gnu/include/bits/getopt_ext.h \
  /usr/x86_64-linux-gnu/include/sys/stat.h \
  /usr/x86_64-linux-gnu/include/bits/stat.h \
  /usr/x86_64-linux-gnu/include/bits/struct_stat.h \
  /usr/x86_64-linux-gnu/include/sys/time.h \
  /usr/x86_64-linux-gnu/include/errno.h \
  /usr/x86_64-linux-gnu/include/bits/errno.h \
  /usr/x86_64-linux-gnu/include/linux/errno.h \
  /usr/x86_64-linux-gnu/include/asm/errno.h \
  /usr/x86_64-linux-gnu/include/asm-generic/errno.h \
  /usr/x86_64-linux-gnu/include/asm-generic/errno-base.h \
  scripts/kconfig/lkc.h \
    $(wildcard include/config/prefix.h) \
    $(wildcard include/config/list.h) \
    $(wildcard include/config/y.h) \
  scripts/kconfig/expr.h \
    $(wildcard include/config/config.h) \
  /usr/x86_64-linux-gnu/include/assert.h \
  scripts/kconfig/list.h \
  /usr/lib/gcc/x86_64-linux-gnu/11/include/stdbool.h \
  /usr/x86_64-linux-gnu/include/libintl.h \
  scripts/kconfig/lkc_proto.h \

scripts/kconfig/conf.o: $(deps_scripts/kconfig/conf.o)

$(deps_scripts/kconfig/conf.o):
