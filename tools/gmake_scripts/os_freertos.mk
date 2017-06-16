#
# This file is subject to the terms of the GFX License. If a copy of
# the license was not distributed with this file, you can obtain one at:
#
#             http://ugfx.org/license.html
#

# See readme.txt for the make API

# Requirements:
#
# FREERTOS:			The location of the FreeRTOS code	eg FREERTOS=../FreeRTOS
# FREERTOS_BOARD	The board name						eg FREERTOS_BOARD=RaspberryPi
#

# Optional:
#
# FREERTOS_MODULES	 A list of directories containing FreeRTOS source (eg drivers, startup etc) - default is ""
# FREERTOS_LDSCRIPT  The loader script - default is ""
#

PATHLIST += FREERTOS

CFLAGS += -DSTM32F429_439xx -DUSE_STDPERIPH_DRIVER -DGFX_OS_NO_INIT

LDFLAGS  += -lc -lgcc -lnosys

INCPATH += $(FREERTOS)/Source/include \
           $(FREERTOS)/Source/portable/GCC/$(FREERTOS_CPUCLASS) \
           $(FREERTOS)/Demo/Common/include \
           $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC \
           $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Libraries/CMSIS/Include \
           $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Libraries/STM32F4xx_StdPeriph_Driver/inc \
           $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Utilities/STM32F429I-Discovery \
           $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Utilities/Common

SRC += $(FREERTOS)/Source/list.o \
       $(FREERTOS)/Source/queue.o \
       $(FREERTOS)/Source/tasks.o \
       $(FREERTOS)/Source/timers.o \
       $(FREERTOS)/Source/portable/MemMang/heap_1.o \
       $(FREERTOS)/Demo/Common/Minimal/flash.o \
       $(FREERTOS)/Source/portable/GCC/$(FREERTOS_CPUCLASS)/port.c \
       $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/system_stm32f4xx.c \
       $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/partest.c \
       $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma2d.c \
       $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_fmc.c \
       $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c \
       $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_i2c.c \
       $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_ltdc.c \
       $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c \
       $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_spi.c \
       $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Libraries/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c \
       $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Utilities/STM32F429I-Discovery/stm32f429i_discovery_lcd.c \
       $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Utilities/STM32F429I-Discovery/stm32f429i_discovery_sdram.c

# SRC     += $(foreach sdir,$(FREERTOS_MODULES),$(wildcard $(sdir)/*.c))

ifeq ($(LDSCRIPT),)
  ifneq ($(FREERTOS_LDSCRIPT),)
    LDSCRIPT= $(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/$(FREERTOS_LDSCRIPT)
  endif
endif
