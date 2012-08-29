CROSS=arm-eabi-
CC=$(CROSS)gcc
OBJCOPY=$(CROSS)objcopy
LD=$(CROSS)ld
AS=$(CROSS)as
STRIP=$(CROSS)strip

STM_INC=../FWLib/inc
STM_SRC=../FWLib/src
STM_ASM=../FWLib/asm

SRC_SRC=../App/src
SRC_INC=../App/inc
SRC_LDS=../App/lds
SRC_ASM=../App/asm

VERSION=251

CFLAGS = -Wall -Os -Werror -fno-common -mcpu=cortex-m3 -mthumb -msoft-float -fomit-frame-pointer -MD -I $(STM_INC) -I $(SRC_INC) -I $(SRC_SRC)
AFLAGS = -mcpu=cortex-m3 -mthumb
LDFLAGS = -nostartfiles -mcpu=cortex-m3 -mthumb -march=armv7 -mfix-cortex-m3-ldrd -msoft-float

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

TARGETS = APP1_$(VERSION).hex APP2_$(VERSION).hex APP3_$(VERSION).hex 

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



APP1_$(VERSION).elf:	$(SRC_LDS)/app1.lds $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS) -T $<

APP2_$(VERSION).elf:	$(SRC_LDS)/app2.lds $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS) -T $<

APP3_$(VERSION).elf:	$(SRC_LDS)/app3.lds $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS) -T $<



APP1_$(VERSION).hex:	APP1_$(VERSION).elf
	$(OBJCOPY) -O ihex $< $@
	
APP2_$(VERSION).hex:	APP2_$(VERSION).elf
	$(OBJCOPY) -O ihex $< $@
	
APP3_$(VERSION).hex:	APP3_$(VERSION).elf
	$(OBJCOPY) -O ihex $< $@
	

