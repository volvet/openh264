include build/platform-arch.mk
SHAREDLIBSUFFIX = so
CFLAGS += -fPIC -DMT_ENABLED
LDFLAGS += -lpthread
ifeq ($(ASM_ARCH), x86)
ASMFLAGS += -DNOPREFIX
ifeq ($(ENABLE64BIT), Yes)
ASMFLAGS += -f elf64
else
ASMFLAGS += -f elf
endif
endif

