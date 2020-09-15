ASM = sjasmplus
ASM_FLAGS = --lst


# %:
# 	@:

%.bin:%.asm
	$(ASM) $< $(ASM_FLAGS)

.PHONY:clean
clean:
ifeq ($(OS),Windows_NT)
	del *.bin *.lst
else
	rm *.bin *.lst
endif

