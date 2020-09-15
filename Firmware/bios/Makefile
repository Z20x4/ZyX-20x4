ASM = SJASMPLUS
ASM_FLAGS = --lst


# %:
# 	@:

%.bin:%.asm
	$(ASM) $< 

.PHONY:clean
clean:
ifeq ($(OS),Windows_NT)
	del *.bin *.lst
else
	rm *.bin *.lst
endif

