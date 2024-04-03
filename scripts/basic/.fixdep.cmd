cmd_scripts/basic/fixdep := gcc -Wp,-MD,scripts/basic/.fixdep.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89     -o scripts/basic/fixdep scripts/basic/fixdep.c  

source_scripts/basic/fixdep := scripts/basic/fixdep.c

deps_scripts/basic/fixdep := \
    $(wildcard include/config/his/driver.h) \
    $(wildcard include/config/my/option.h) \
    $(wildcard include/config/.h) \
    $(wildcard include/config/foo.h) \
    $(wildcard include/config/boom.h) \
  /usr/x86_64-linux-gnu/include/stdc-predef.h \
  /usr/x86_64-linux-gnu/include/sys/types.h \
  /usr/x86_64-linux-gnu/include/features.h \
  /usr/x86_64-linux-gnu/include/features-time64.h \
  /usr/x86_64-linux-gnu/include/bits/wordsize.h \
  /usr/x86_64-linux-gnu/include/bits/timesize.h \
  /usr/x86_64-linux-gnu/include/sys/cdefs.h \
  /usr/x86_64-linux-gnu/include/bits/long-double.h \
  /usr/x86_64-linux-gnu/include/gnu/stubs.h \
  /usr/x86_64-linux-gnu/include/gnu/stubs-64.h \
  /usr/x86_64-linux-gnu/include/bits/types.h \
  /usr/x86_64-linux-gnu/include/bits/typesizes.h \
  /usr/x86_64-linux-gnu/include/bits/time64.h \
  /usr/x86_64-linux-gnu/include/bits/types/clock_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/clockid_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/time_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/timer_t.h \
  /usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h \
  /usr/x86_64-linux-gnu/include/bits/stdint-intn.h \
  /usr/x86_64-linux-gnu/include/endian.h \
  /usr/x86_64-linux-gnu/include/bits/endian.h \
  /usr/x86_64-linux-gnu/include/bits/endianness.h \
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
  /usr/x86_64-linux-gnu/include/sys/stat.h \
  /usr/x86_64-linux-gnu/include/bits/stat.h \
  /usr/x86_64-linux-gnu/include/bits/struct_stat.h \
  /usr/x86_64-linux-gnu/include/sys/mman.h \
  /usr/x86_64-linux-gnu/include/bits/mman.h \
  /usr/x86_64-linux-gnu/include/bits/mman-map-flags-generic.h \
  /usr/x86_64-linux-gnu/include/bits/mman-linux.h \
  /usr/x86_64-linux-gnu/include/bits/mman-shared.h \
  /usr/x86_64-linux-gnu/include/unistd.h \
  /usr/x86_64-linux-gnu/include/bits/posix_opt.h \
  /usr/x86_64-linux-gnu/include/bits/environments.h \
  /usr/x86_64-linux-gnu/include/bits/confname.h \
  /usr/x86_64-linux-gnu/include/bits/getopt_posix.h \
  /usr/x86_64-linux-gnu/include/bits/getopt_core.h \
  /usr/x86_64-linux-gnu/include/bits/unistd.h \
  /usr/x86_64-linux-gnu/include/bits/unistd_ext.h \
  /usr/x86_64-linux-gnu/include/fcntl.h \
  /usr/x86_64-linux-gnu/include/bits/fcntl.h \
  /usr/x86_64-linux-gnu/include/bits/fcntl-linux.h \
  /usr/x86_64-linux-gnu/include/bits/fcntl2.h \
  /usr/x86_64-linux-gnu/include/string.h \
  /usr/x86_64-linux-gnu/include/bits/libc-header-start.h \
  /usr/x86_64-linux-gnu/include/bits/types/locale_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/__locale_t.h \
  /usr/x86_64-linux-gnu/include/strings.h \
  /usr/x86_64-linux-gnu/include/bits/strings_fortified.h \
  /usr/x86_64-linux-gnu/include/bits/string_fortified.h \
  /usr/x86_64-linux-gnu/include/stdlib.h \
  /usr/x86_64-linux-gnu/include/bits/waitflags.h \
  /usr/x86_64-linux-gnu/include/bits/waitstatus.h \
  /usr/x86_64-linux-gnu/include/bits/floatn.h \
  /usr/x86_64-linux-gnu/include/bits/floatn-common.h \
  /usr/x86_64-linux-gnu/include/alloca.h \
  /usr/x86_64-linux-gnu/include/bits/stdlib-bsearch.h \
  /usr/x86_64-linux-gnu/include/bits/stdlib-float.h \
  /usr/x86_64-linux-gnu/include/bits/stdlib.h \
  /usr/x86_64-linux-gnu/include/stdio.h \
  /usr/lib/gcc/x86_64-linux-gnu/11/include/stdarg.h \
  /usr/x86_64-linux-gnu/include/bits/types/__fpos_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/__mbstate_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/__fpos64_t.h \
  /usr/x86_64-linux-gnu/include/bits/types/__FILE.h \
  /usr/x86_64-linux-gnu/include/bits/types/FILE.h \
  /usr/x86_64-linux-gnu/include/bits/types/struct_FILE.h \
  /usr/x86_64-linux-gnu/include/bits/stdio_lim.h \
  /usr/x86_64-linux-gnu/include/bits/stdio.h \
  /usr/x86_64-linux-gnu/include/bits/stdio2.h \
  /usr/lib/gcc/x86_64-linux-gnu/11/include/limits.h \
  /usr/lib/gcc/x86_64-linux-gnu/11/include/syslimits.h \
  /usr/x86_64-linux-gnu/include/limits.h \
  /usr/x86_64-linux-gnu/include/bits/posix1_lim.h \
  /usr/x86_64-linux-gnu/include/bits/local_lim.h \
  /usr/x86_64-linux-gnu/include/linux/limits.h \
  /usr/x86_64-linux-gnu/include/bits/pthread_stack_min-dynamic.h \
  /usr/x86_64-linux-gnu/include/bits/pthread_stack_min.h \
  /usr/x86_64-linux-gnu/include/bits/posix2_lim.h \
  /usr/x86_64-linux-gnu/include/ctype.h \
  /usr/x86_64-linux-gnu/include/arpa/inet.h \
  /usr/x86_64-linux-gnu/include/netinet/in.h \
  /usr/x86_64-linux-gnu/include/bits/stdint-uintn.h \
  /usr/x86_64-linux-gnu/include/sys/socket.h \
  /usr/x86_64-linux-gnu/include/bits/types/struct_iovec.h \
  /usr/x86_64-linux-gnu/include/bits/socket.h \
  /usr/x86_64-linux-gnu/include/bits/socket_type.h \
  /usr/x86_64-linux-gnu/include/bits/sockaddr.h \
  /usr/x86_64-linux-gnu/include/asm/socket.h \
  /usr/x86_64-linux-gnu/include/asm-generic/socket.h \
  /usr/x86_64-linux-gnu/include/linux/posix_types.h \
  /usr/x86_64-linux-gnu/include/linux/stddef.h \
  /usr/x86_64-linux-gnu/include/asm/posix_types.h \
  /usr/x86_64-linux-gnu/include/asm/posix_types_64.h \
  /usr/x86_64-linux-gnu/include/asm-generic/posix_types.h \
  /usr/x86_64-linux-gnu/include/asm/bitsperlong.h \
  /usr/x86_64-linux-gnu/include/asm-generic/bitsperlong.h \
    $(wildcard include/config/64bit.h) \
  /usr/x86_64-linux-gnu/include/asm/sockios.h \
  /usr/x86_64-linux-gnu/include/asm-generic/sockios.h \
  /usr/x86_64-linux-gnu/include/bits/types/struct_osockaddr.h \
  /usr/x86_64-linux-gnu/include/bits/socket2.h \
  /usr/x86_64-linux-gnu/include/bits/in.h \

scripts/basic/fixdep: $(deps_scripts/basic/fixdep)

$(deps_scripts/basic/fixdep):
