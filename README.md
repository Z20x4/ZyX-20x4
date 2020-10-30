# ZyX-20x4
A modernized and easy to build Z80 based homebrew PC with suppport for virtual memory. Can also be used to showcase principles of computer organization to students and beginner computer enthusiasts.
*****
## This repository
This repository contains the **firmware** for the system controller and scripts/makefiles used to assemble, compile and upload said firmware to the system controller. The default target system controller is **Arduino Atmega 2560**. The ZyX-20x4 projects consists of multiple other parts, all in their respective repositories, listed below

## Other repositories
* [**ZyX-20x4 PCB and schematic**](https://github.com/Z20x4/PCB)
* [**ZyXOS - custom operating system**](https://github.com/Z20x4/ZyXOS)
* [**FPGA based memory Controller**](https://github.com/Z20x4/FPGA)

## Repository structure

```
.
└── Firmware                        # All the neccessary files to set up the system 
    ├── bios                        # BIOS assembler source code
    ├── controller                  # C source code for main system controller
    │   ├── asm_demo                # Assmebler demo programs source code
    │   │   ├── basic               # Z80 BASIC interpreter source code
    │   ├── src                     # 
    │   └── ZPC_lib                 # C library with key controller functions
    │       ├── ZPC_funcs           # 
    │       └── ZPC_visualisation   #
    └── video_device                # C source code for video controller
        └── src                     # 

```

## Building

### Used components

- **Zilog Z84C0008PEG**
[Documentation](https://www.zilog.com/index.php?option=com_product&Itemid=26&task=docs&businessLine=&parent_id=139&familyId=20&productId=Z84C00)
- **Samsung K6T1008C2C-DB70**
[Documentation](https://datasheet.ciiva.com/26786/k6t1008c2c-db70-26786234.pdf)
- **Arduino Atmel ATMEGA2560-16AU**
[Documentation](http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega640-1280-1281-2560-2561-Datasheet-DS40002211A.pdf)
- switch 1825057 (2 pins)
- SN74HC00N
- switch 1825255-1 x2
- SN74LVC157APWR
- D-trig x4 74 series (Maybe, SN74174N). Same schematic with SN74LS174, SN74S174 N or D series
- Nokia LCD
- Yageo CC1206KKX7R0BB104 x8 (10) 100nF
- resistor SFR2500001002JA500 (10K) x52
- button x2
- LED x40
- TE Connectivity 5749231-1
- TE Connectivity 5747872-4
- 1 header x15
- 2 header x3
- 5 header x1
- 20 header x2
- 2x3 header x1
- 2*18 header x2
- 20 connector x2
- 2x3 connector x1
