include build/platform-arch.mk
ifeq ($(ASM_ARCH), x86)
ifeq ($(ENABLE64BIT), Yes)
ASMFLAGS += -f win64
ASMFLAGS_PLATFORM = -DWIN64
CFLAGS += -DWIN64
else
ASMFLAGS += -f win32 -DPREFIX
CFLAGS += -DWIN32
endif
else
CFLAGS += -DWIN32
endif
ifeq ($(ASM_ARCH), arm)
CCAS = gas-preprocessor.pl -as-type armasm -force-thumb -- armasm
endif

CC=cl
CXX=cl
AR=lib
CXX_O=-Fo$@
CFLAGS += -nologo -W3 -EHsc -fp:precise -Zc:wchar_t -Zc:forScope -DGTEST_HAS_TR1_TUPLE=0
CXX_LINK_O=-nologo -Fe$@
AR_OPTS=-nologo -out:$@
CFLAGS_OPT=-O2 -Ob1 -Oy- -Zi -GF -Gm- -GS -Gy -DNDEBUG
CFLAGS_DEBUG=-Od -Oy- -ZI -Gm -RTC1 -D_DEBUG
CFLAGS_M32=
CFLAGS_M64=
LINK_LIB=$(1).lib
LIBSUFFIX=lib
LIBPREFIX=
EXEEXT=.exe
OBJ=obj
SHAREDLIBSUFFIX=dll
SHARED=-LD
SHLDFLAGS=-link -def:wels.def -implib:wels_dll.lib
EXTRA_LIBRARY=wels_dll.lib
