USE_ASM = No  # We don't have ASM working on Mac yet
ASM = nasm
CFLAGS += -fPIC
LDFLAGS += -lpthread
ASMFLAGS += --prefix _
ifeq ($(ENABLE64BIT), Yes)
ASMFLAGS += -f macho64
else
ASMFLAGS += -f macho
endif

