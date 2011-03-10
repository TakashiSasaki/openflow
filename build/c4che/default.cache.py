AR = '/usr/bin/ar'
ARFLAGS = 'rcs'
CC = ['/usr/bin/gcc']
CCDEFINES_ST = '-D%s'
CCFLAGS_DEBUG = ['-g']
CCFLAGS_MACBUNDLE = ['-fPIC']
CCFLAGS_RELEASE = ['-O2']
CCLNK_SRC_F = ''
CCLNK_TGT_F = ['-o', '']
CC_NAME = 'gcc'
CC_SRC_F = ''
CC_TGT_F = ['-c', '-o', '']
CC_VERSION = ('4', '4', '3')
COMPILER_CC = 'gcc'
CPP = '/usr/bin/cpp'
CPPPATH_ST = '-I%s'
DEST_BINFMT = 'elf'
DEST_CPU = 'x86_64'
DEST_OS = 'linux'
FULLSTATIC_MARKER = '-static'
LIBPATH_ST = '-L%s'
LIB_ST = '-l%s'
LINKFLAGS_MACBUNDLE = ['-bundle', '-undefined', 'dynamic_lookup']
LINK_CC = ['/usr/bin/gcc']
PREFIX = '/usr/local'
RANLIB = '/usr/bin/ranlib'
RPATH_ST = '-Wl,-rpath,%s'
SHLIB_MARKER = '-Wl,-Bdynamic'
SONAME_ST = '-Wl,-h,%s'
STATICLIBPATH_ST = '-L%s'
STATICLIB_MARKER = '-Wl,-Bstatic'
STATICLIB_ST = '-l%s'
macbundle_PATTERN = '%s.bundle'
program_PATTERN = '%s'
shlib_CCFLAGS = ['-fPIC', '-DPIC']
shlib_LINKFLAGS = ['-shared']
shlib_PATTERN = 'lib%s.so'
staticlib_LINKFLAGS = ['-Wl,-Bstatic']
staticlib_PATTERN = 'lib%s.a'
