include build/platform-arch.mk
SHAREDLIBSUFFIX = dylib
SHARED = -dynamiclib
CFLAGS += -Werror -fPIC -DMACOS -DMT_ENABLED -MMD -MP
LDFLAGS += -lpthread
ifeq ($(ASM_ARCH), x86)
ASMFLAGS += --prefix _ -DNOPREFIX
ifeq ($(ENABLE64BIT), Yes)
ASMFLAGS += -f macho64
else
ASMFLAGS += -f macho
LDFLAGS += -read_only_relocs suppress
endif
endif

