# ZyX-20x4
A modern Z80 based PC with its own ecosystem.

Also see:
* [ZyX-20x4 PCB](https://github.com/Z20x4/PCB)
* [ZyXOS - Operating System ](https://github.com/Z20x4/ZyXOS)
* [MMU](https://github.com/Z20x4/FPGA)

## Repository structure

```
.
└── Firmware                        # All the neccessary files to set up the system 
    ├── bios                        # BIOS assembler source code
    ├── controller                  # C source code for main system controller
    │   ├── asm_demo                # Assmebler demo programs source code
    │   │   ├── basic               # Z80 BASIC interpreter source code
    │   ├── src                     # 
    │   └── ZPC_lib                 # C linbrary with key controller functions
    │       ├── ZPC_funcs           # 
    │       └── ZPC_visualisation   #
    └── video_device                # C source code for video controller
        └── src                     # 

```

## Building

## 
