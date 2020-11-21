# ZyX-20x4
A repository containing the firmware for a modern Z80 based PC.

### Output ports specifications
| Port | Specification |
|------|---------------|
| 0x01 | Text output |
| 0x41 | Set timer prescaler to 2 to the power of output data |
| 0x42 | Set timer compare register to data |
| 0x43 | Set timer interrupt vector to the data |
| 0x44 | Start the timer |
| 0x45 | Stop the timer |
| 0x46 | **INPUT** Get timer count via data |
| 0x47 | Timer init |


### Z80 Data pins
| Z80 pin | Arduino pin |
|-------|-------|
| D0 | 22 |
| D1 | 23 |
| D2 | 24 |
| D3 | 25 |
| D4 | 26 |
| D5 | 27 |
| D6 | 28 |
| D7 | 29 |
| AD0 | 30 |
| AD1 | 31 |
| AD2 | 32 |
| AD3 | 33 |
| AD4 | 34 |
| AD5 | 35 |
| AD6 | 36 |
| AD7 | 37 |
| AD8 | 38 |
| AD9 | 39 |
| AD10 | 40 |
| AD11 | 41 |
| AD12 | 42 |
| AD13 | 43 |
| AD14 | 44 |
| AD15 | 45 |
| INT_ | 48 |
| BUSACK_ | 51 |
| WAIT_ | 49 |
| WR_ | 53 |
| RD_ | 52 |
| MREQ_ | 46 |
| RESET_ | 5 |
| BUSREQ_ | 50 |
| CLK | 11 |
| WAIT_RES_ | 47 |
| USER_LED | 13 |
| M1_ | 15 |
| EXT_CLOCK | A5 |
| Screen | A0 |
| Screen | A1 |
| Screen | A2 |
| Screen | A3 |
| Screen | A4 |


