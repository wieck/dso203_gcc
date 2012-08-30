# ----------------------------------------------------------------------
# Bin/Makefile
#
#	Build the DSO203_GCC firmware on a UNIX system.
# ----------------------------------------------------------------------

# ----
# Version number of .hex files to be generated
# ----
VERSION=125


# ----
# OS specific settings
#
#	On most platforms, the cross compile prefix is arm-none-eabi-.
#	Don't know what "none" is for, but on FreeBSD it is just
#	arm-eabi-. 
# ----
OS=$(shell uname -s)

ifeq ($(OS),FreeBSD)
	CROSS=arm-eabi-
endif

CROSS?=arm-none-eabi-


# ----
# Paths to toolchain executables
# ----
CC=$(CROSS)gcc
OBJCOPY=$(CROSS)objcopy
LD=$(CROSS)ld
AS=$(CROSS)as
STRIP=$(CROSS)strip


# ----
# Paths to source files
# ----
STM_INC=../FWLib/inc
STM_SRC=../FWLib/src
STM_ASM=../FWLib/asm

SRC_SRC=../App/src
SRC_INC=../App/inc
SRC_LDS=../App/lds
SRC_ASM=../App/asm


# ----
# Compiler and linker flags
# ----
CFLAGS = -Wall -Os -Werror -fno-common -mcpu=cortex-m3 -mthumb -msoft-float -fomit-frame-pointer -MD -I $(STM_INC) -I $(SRC_INC) -I $(SRC_SRC)
AFLAGS = -mcpu=cortex-m3 -mthumb
LDFLAGS = -nostartfiles -mcpu=cortex-m3 -mthumb -march=armv7 -mfix-cortex-m3-ldrd -msoft-float


# ----
# Files and targets
# ----
OBJS =	Calibrat.o \
		Draw.o  \
		Files.o \
		Function.o \
		Interrupt.o \
		Main.o \
		Menu.o \
		Process.o \
		startup.o \
		BIOS.o \
		stm32f10x_nvic.o \
		cortexm3_macro.o

TARGETS = APP1G$(VERSION).hex APP2G$(VERSION).hex APP3G$(VERSION).hex 

all: $(OBJS) $(TARGETS)

.PHONY: clean

clean:
	rm -f *.o *.d *.elf $(TARGETS)

Calibrat.o:	$(SRC_SRC)/Calibrat.c
	$(CC) $(CFLAGS) -c -o $@ $^

Draw.o:	$(SRC_SRC)/Draw.c
	$(CC) $(CFLAGS) -c -o $@ $^

Files.o:	$(SRC_SRC)/Files.c
	$(CC) $(CFLAGS) -c -o $@ $^

Function.o:	$(SRC_SRC)/Function.c
	$(CC) $(CFLAGS) -c -o $@ $^

Interrupt.o:	$(SRC_SRC)/Interrupt.c
	$(CC) $(CFLAGS) -c -o $@ $^

Main.o:	$(SRC_SRC)/Main.c
	$(CC) $(CFLAGS) -c -o $@ $^

Menu.o:	$(SRC_SRC)/Menu.c
	$(CC) $(CFLAGS) -c -o $@ $^

Process.o:	$(SRC_SRC)/Process.c
	$(CC) $(CFLAGS) -c -o $@ $^

startup.o:	$(SRC_SRC)/startup.c
	$(CC) $(CFLAGS) -c -o $@ $^

BIOS.o:	$(SRC_ASM)/BIOS.S
	$(CC) $(AFLAGS) -c -o $@ $^

stm32f10x_nvic.o:	$(STM_SRC)/stm32f10x_nvic.c
	$(CC) $(CFLAGS) -c -o $@ $^

cortexm3_macro.o:	$(STM_ASM)/cortexm3_macro.s
	$(CC) $(AFLAGS) -c -o $@ $^



APP1G$(VERSION).elf:	$(SRC_LDS)/app1.lds $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS) -T $<

APP2G$(VERSION).elf:	$(SRC_LDS)/app2.lds $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS) -T $<

APP3G$(VERSION).elf:	$(SRC_LDS)/app3.lds $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS) -T $<



APP1G$(VERSION).hex:	APP1G$(VERSION).elf
	$(OBJCOPY) -O ihex $< $@
	
APP2G$(VERSION).hex:	APP2G$(VERSION).elf
	$(OBJCOPY) -O ihex $< $@
	
APP3G$(VERSION).hex:	APP3G$(VERSION).elf
	$(OBJCOPY) -O ihex $< $@
	

