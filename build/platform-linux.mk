ASM = nasm
CFLAGS += -fPIC -DLINUX -D__NO_CTYPE
LDFLAGS += -lpthread
ifeq ($(ENABLE64BIT), Yes)
ASMFLAGS += -f elf64
else 
ASMFLAGS += -f elf32
endif

