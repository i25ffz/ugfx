GFXINC  +=	$(GFXLIB)/boards/base/STM32F429i-Discovery
ifeq ($(OPT_OS),chibios)
	GFXSRC  +=	$(GFXLIB)/boards/base/STM32F429i-Discovery/stm32f429i_discovery_sdram.c \
				$(GFXLIB)/boards/base/STM32F429i-Discovery/stm32f4xx_fmc.c

	# GFXDEFS += -DGFX_USE_OS_CHIBIOS=TRUE
endif

include $(GFXLIB)/drivers/gdisp/STM32LTDC/driver.mk
include $(GFXLIB)/drivers/ginput/touch/STMPE811/driver.mk
