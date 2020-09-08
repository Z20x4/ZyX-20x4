ASM = SJASMPLUS
ASM_FLAGS = --lst


# %:
# 	@:
basic.bin:S210718.o basic.o
	cat $^ > basic.bin

%.o:%.asm
	$(ASM) $< $(ASM_FLAGS)

.PHONY:clean
clean:
ifeq ($(OS),Windows_NT)
	del *.o *.bin *.lst
else
	rm *.o *.bin *.lst
endif

