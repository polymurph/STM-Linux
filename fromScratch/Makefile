include makefile.conf

#Avoid confusion with a file named CLean 
.PHONY: clean

#Name of the project 
TARGET = test_project

#Are we on Debug ?
DEBUG = 1

#definition of the toolchain used
PREFIX = arm-none-eabi-

#######################################
#Compiler Definition
#######################################
CC = $(PREFIX)gcc
CPP= $(PREFIX)g++
AS = $(PREFIX)gcc -x assembler-withn-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
BIN = $(CP) -O binary -S
HEX = $(CP) -O ihex

#######################################
#Objects to link
#######################################
OBJECTS += main.o
OBJECTS += startup_ARMCM4.o

#######################################
# CFLAGS
#######################################
CPU = -mcpu=cortex-m4
FPU = -mfpu=fpv4-sp-d16
FLOAT-ABI = -mfloat-abi=hard
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)
CFLAGS = $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

#######################################
# LDFLAGS
#######################################
LDSCRIPT = nokeep.ld
LIBS = -lc -lm -lnosys
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBS) -Wl,-Map=$(TARGET).map,--cref -Wl,--gc-sections

#######################################
# Building
#######################################
#Types of make
all : $(TARGET).bin
#For C sources 
%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

#for S sources
%.o: %.s
	$(AS) -c $(CFLAGS) $< -o $@
	
%.bin: %.elf 
	$(BIN) $< $@	

$(TARGET).elf: $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@
	




clean:
	-rm -fR *.o *.map *.elf 
