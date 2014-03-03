CFLAGS_M32=-m32
CFLAGS_M64=-m64
ifeq (, $(ENABLE64BIT))
ifeq ($(ARCH), x86_64)
ENABLE64BIT=Yes
endif
endif
ifeq ($(ENABLE64BIT), Yes)
CFLAGS += $(CFLAGS_M64)
LDFLAGS += $(CFLAGS_M64)
ASMFLAGS_PLATFORM = -DUNIX64
else
CFLAGS += $(CFLAGS_M32)
LDFLAGS += $(CFLAGS_M32)
ASMFLAGS_PLATFORM = -DX86_32
endif
ifeq ($(USE_ASM),Yes)
CFLAGS += -DX86_ASM
ASM_ARCH = x86
endif
ASM = nasm
ASMFLAGS += $(ASMFLAGS_PLATFORM) -DNO_DYNAMIC_VP
