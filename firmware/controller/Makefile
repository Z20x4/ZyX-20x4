
all:upload

build:embed_asm
	platformio run

upload:embed_asm
	platformio run --target upload


embed_asm:
ifdef ASM_FILE
	$(MAKE) -C $(dir $(ASM_FILE)) $(addsuffix .bin, $(basename $(notdir $(ASM_FILE))))
	py hexify.py  $(addsuffix .bin, $(basename $(ASM_FILE))) > program.h
endif