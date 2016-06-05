# ST Visual Debugger Generated MAKE File, based on stm8af_discover.stp

ifeq ($(CFG), )
CFG=Debug
$(warning ***No configuration specified. Defaulting to $(CFG)***)
endif

ToolsetRoot=C:\PROGRA~2\COSMIC\FSE_CO~1\CXSTM8
ToolsetBin=C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8
ToolsetInc=C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Hstm8
ToolsetLib=C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Lib
ToolsetIncOpts=-i"C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Hstm8" 
ToolsetLibOpts=-l"C:\Program Files (x86)\COSMIC\FSE_Compilers\CXSTM8\Lib" 
ObjectExt=o
OutputExt=elf
InputName=$(basename $(notdir $<))


# 
# Debug
# 
ifeq "$(CFG)" "Debug"


OutputPath=..\..\..\stvd\cosmic
ProjectSFile=stm8af_discover
TargetSName=$(ProjectSFile)
TargetFName=$(ProjectSFile).elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +modsl0 +debug -pxp -pp -l -dSTM8AF52Ax -i..\..\..\..\libraries\stm8s_stdperiph_driver\inc -i..\..\inc $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  -xx -l $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) $(ProjectSFile).elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

..\..\..\stvd\cosmic\stm8s_exti.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_exti.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\stm8s_adc2.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_adc2.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\stm8s_can.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_can.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\stm8s_clk.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_clk.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\stm8s_gpio.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_gpio.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\stm8s_spi.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_spi.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\stm8s_tim4.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim4.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\stm8s_uart3.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_uart3.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\stm8_interrupt_vector.$(ObjectExt) : ..\..\src\stm8_interrupt_vector.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_it.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\appli.$(ObjectExt) : ..\..\src\appli.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\appli.h ..\..\inc\main.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\adc.$(ObjectExt) : ..\..\src\adc.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\adc.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\can.$(ObjectExt) : ..\..\src\can.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\can.h ..\..\inc\main.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\l99pm62drv.$(ObjectExt) : ..\..\src\l99pm62drv.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\l99pm62drv.h ..\..\inc\l99pm62drv_cfg.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\l99pm62drv_al.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\lin.$(ObjectExt) : ..\..\src\lin.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\lin.h ..\..\inc\main.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\main.$(ObjectExt) : ..\..\src\main.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\main.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\l99pm62drv.h ..\..\inc\l99pm62drv_cfg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

..\..\..\stvd\cosmic\stm8s_it.$(ObjectExt) : ..\..\src\stm8s_it.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_it.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\main.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

$(ProjectSFile).elf :  $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_adc2.o $(OutputPath)\stm8s_can.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_spi.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart3.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\appli.o $(OutputPath)\adc.o $(OutputPath)\can.o $(OutputPath)\l99pm62drv.o $(OutputPath)\lin.o $(OutputPath)\main.o $(OutputPath)\stm8s_it.o $(OutputPath)\stm8af_discover.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 -m$(OutputPath)\$(TargetSName).map $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_adc2.o
	-@erase $(OutputPath)\stm8s_can.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart3.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\appli.o
	-@erase $(OutputPath)\adc.o
	-@erase $(OutputPath)\can.o
	-@erase $(OutputPath)\l99pm62drv.o
	-@erase $(OutputPath)\lin.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\stm8af_discover.elf
	-@erase $(OutputPath)\stm8af_discover.elf
	-@erase $(OutputPath)\stm8af_discover.map
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_adc2.ls
	-@erase $(OutputPath)\stm8s_can.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart3.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\appli.ls
	-@erase $(OutputPath)\adc.ls
	-@erase $(OutputPath)\can.ls
	-@erase $(OutputPath)\l99pm62drv.ls
	-@erase $(OutputPath)\lin.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8s_it.ls
endif

# 
# Release
# 
ifeq "$(CFG)" "Release"


OutputPath=Release
ProjectSFile=stm8af_discover
TargetSName=stm8af_discover
TargetFName=stm8af_discover.elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  -i..\..\..\..\libraries\stm8s_stdperiph_driver\inc -i..\..\inc +mods0 -pp $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) stm8af_discover.elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Release\stm8s_exti.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_exti.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_adc2.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_adc2.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc2.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_can.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_can.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_can.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_clk.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_clk.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_gpio.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_gpio.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_spi.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_spi.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim4.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim4.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_uart3.$(ObjectExt) : ..\..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_uart3.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart3.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8_interrupt_vector.$(ObjectExt) : ..\..\src\stm8_interrupt_vector.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\inc\stm8s_it.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\appli.$(ObjectExt) : ..\..\src\appli.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\appli.h ..\..\inc\main.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\adc.$(ObjectExt) : ..\..\src\adc.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\adc.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\can.$(ObjectExt) : ..\..\src\can.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\can.h ..\..\inc\main.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\l99pm62drv.$(ObjectExt) : ..\..\src\l99pm62drv.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\inc\l99pm62drv.h ..\..\inc\l99pm62drv_cfg.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\l99pm62drv_al.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\lin.$(ObjectExt) : ..\..\src\lin.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\lin.h ..\..\inc\main.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\main.$(ObjectExt) : ..\..\src\main.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\inc\main.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\l99pm62drv.h ..\..\inc\l99pm62drv_cfg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_it.$(ObjectExt) : ..\..\src\stm8s_it.c ..\..\..\..\..\..\..\..\..\..\PROGRA~2\cosmic\FSE_CO~1\cxstm8\hstm8\mods0.h ..\..\inc\stm8s_it.h ..\..\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\main.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

stm8af_discover.elf :  $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_adc2.o $(OutputPath)\stm8s_can.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_spi.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart3.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\appli.o $(OutputPath)\adc.o $(OutputPath)\can.o $(OutputPath)\l99pm62drv.o $(OutputPath)\lin.o $(OutputPath)\main.o $(OutputPath)\stm8s_it.o $(OutputPath)\stm8af_discover.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_adc2.o
	-@erase $(OutputPath)\stm8s_can.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart3.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\appli.o
	-@erase $(OutputPath)\adc.o
	-@erase $(OutputPath)\can.o
	-@erase $(OutputPath)\l99pm62drv.o
	-@erase $(OutputPath)\lin.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\stm8af_discover.elf
	-@erase $(OutputPath)\stm8af_discover.map
	-@erase $(OutputPath)\stm8af_discover.st7
	-@erase $(OutputPath)\stm8af_discover.s19
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_adc2.ls
	-@erase $(OutputPath)\stm8s_can.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart3.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\appli.ls
	-@erase $(OutputPath)\adc.ls
	-@erase $(OutputPath)\can.ls
	-@erase $(OutputPath)\l99pm62drv.ls
	-@erase $(OutputPath)\lin.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8s_it.ls
endif
