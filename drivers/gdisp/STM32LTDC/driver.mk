GFXINC +=	$(GFXLIB)/drivers/gdisp/STM32LTDC

ifeq ($(OPT_OS),chibios)
GFXSRC +=	$(GFXLIB)/drivers/gdisp/STM32LTDC/gdisp_lld_STM32LTDC.c
endif

ifeq ($(OPT_OS),freertos)
GFXINC +=	$(GFXLIB)/drivers/gdisp/STM32LTDC \
			$(FREERTOS)/Demo/$(FREERTOS_CPUTYPE)_$(FREERTOS_BOARD)_GCC/Utilities/STM32F429I-Discovery

GFXSRC +=	$(GFXLIB)/drivers/gdisp/STM32LTDC/gdisp_lld_ILI9341.c
endif