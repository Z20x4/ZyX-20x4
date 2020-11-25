/* Arduino SdFat Library
   Copyright (C) 2010 by William Greiman

   This file is part of the Arduino SdFat Library

   This Library is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with the Arduino SdFat Library.  If not, see
   <http://www.gnu.org/licenses/>.
*/
// Warning this file was generated by a program.
#ifndef Sd2PinMap_h
#define Sd2PinMap_h
#include <avr/io.h>

//------------------------------------------------------------------------------
/** struct for mapping digital pins */
struct pin_map_t {
  volatile uint8_t* ddr;
  volatile uint8_t* pin;
  volatile uint8_t* port;
  uint8_t bit;
};


// Two Wire (aka I2C) ports
uint8_t const SDA_PIN = 20;
uint8_t const SCL_PIN = 21;

// SPI port


static const pin_map_t digitalPinMap[] = {
  {&DDRE, &PINE, &PORTE, 0},  // E0  0
  {&DDRE, &PINE, &PORTE, 1},  // E1  1
  {&DDRE, &PINE, &PORTE, 4},  // E4  2
  {&DDRE, &PINE, &PORTE, 5},  // E5  3
  {&DDRG, &PING, &PORTG, 5},  // G5  4
  {&DDRE, &PINE, &PORTE, 3},  // E3  5
  {&DDRH, &PINH, &PORTH, 3},  // H3  6
  {&DDRH, &PINH, &PORTH, 4},  // H4  7
  {&DDRH, &PINH, &PORTH, 5},  // H5  8
  {&DDRH, &PINH, &PORTH, 6},  // H6  9
  {&DDRB, &PINB, &PORTB, 4},  // B4 10
  {&DDRB, &PINB, &PORTB, 5},  // B5 11
  {&DDRB, &PINB, &PORTB, 6},  // B6 12
  {&DDRB, &PINB, &PORTB, 7},  // B7 13
  {&DDRJ, &PINJ, &PORTJ, 1},  // J1 14
  {&DDRJ, &PINJ, &PORTJ, 0},  // J0 15
  {&DDRH, &PINH, &PORTH, 1},  // H1 16
  {&DDRH, &PINH, &PORTH, 0},  // H0 17
  {&DDRD, &PIND, &PORTD, 3},  // D3 18
  {&DDRD, &PIND, &PORTD, 2},  // D2 19
  {&DDRD, &PIND, &PORTD, 1},  // D1 20
  {&DDRD, &PIND, &PORTD, 0},  // D0 21
  {&DDRA, &PINA, &PORTA, 0},  // A0 22
  {&DDRA, &PINA, &PORTA, 1},  // A1 23
  {&DDRA, &PINA, &PORTA, 2},  // A2 24
  {&DDRA, &PINA, &PORTA, 3},  // A3 25
  {&DDRA, &PINA, &PORTA, 4},  // A4 26
  {&DDRA, &PINA, &PORTA, 5},  // A5 27
  {&DDRA, &PINA, &PORTA, 6},  // A6 28
  {&DDRA, &PINA, &PORTA, 7},  // A7 29
  {&DDRC, &PINC, &PORTC, 7},  // C7 30
  {&DDRC, &PINC, &PORTC, 6},  // C6 31
  {&DDRC, &PINC, &PORTC, 5},  // C5 32
  {&DDRC, &PINC, &PORTC, 4},  // C4 33
  {&DDRC, &PINC, &PORTC, 3},  // C3 34
  {&DDRC, &PINC, &PORTC, 2},  // C2 35
  {&DDRC, &PINC, &PORTC, 1},  // C1 36
  {&DDRC, &PINC, &PORTC, 0},  // C0 37
  {&DDRD, &PIND, &PORTD, 7},  // D7 38
  {&DDRG, &PING, &PORTG, 2},  // G2 39
  {&DDRG, &PING, &PORTG, 1},  // G1 40
  {&DDRG, &PING, &PORTG, 0},  // G0 41
  {&DDRL, &PINL, &PORTL, 7},  // L7 42
  {&DDRL, &PINL, &PORTL, 6},  // L6 43
  {&DDRL, &PINL, &PORTL, 5},  // L5 44
  {&DDRL, &PINL, &PORTL, 4},  // L4 45
  {&DDRL, &PINL, &PORTL, 3},  // L3 46
  {&DDRL, &PINL, &PORTL, 2},  // L2 47
  {&DDRL, &PINL, &PORTL, 1},  // L1 48
  {&DDRL, &PINL, &PORTL, 0},  // L0 49
  {&DDRB, &PINB, &PORTB, 3},  // B3 50
  {&DDRB, &PINB, &PORTB, 2},  // B2 51
  {&DDRB, &PINB, &PORTB, 1},  // B1 52
  {&DDRB, &PINB, &PORTB, 0},  // B0 53
  {&DDRF, &PINF, &PORTF, 0},  // F0 54
  {&DDRF, &PINF, &PORTF, 1},  // F1 55
  {&DDRF, &PINF, &PORTF, 2},  // F2 56
  {&DDRF, &PINF, &PORTF, 3},  // F3 57
  {&DDRF, &PINF, &PORTF, 4},  // F4 58
  {&DDRF, &PINF, &PORTF, 5},  // F5 59
  {&DDRF, &PINF, &PORTF, 6},  // F6 60
  {&DDRF, &PINF, &PORTF, 7},  // F7 61
  {&DDRK, &PINK, &PORTK, 0},  // K0 62
  {&DDRK, &PINK, &PORTK, 1},  // K1 63
  {&DDRK, &PINK, &PORTK, 2},  // K2 64
  {&DDRK, &PINK, &PORTK, 3},  // K3 65
  {&DDRK, &PINK, &PORTK, 4},  // K4 66
  {&DDRK, &PINK, &PORTK, 5},  // K5 67
  {&DDRK, &PINK, &PORTK, 6},  // K6 68
  {&DDRK, &PINK, &PORTK, 7}   // K7 69
};





//------------------------------------------------------------------------------
static const uint8_t digitalPinCount = sizeof(digitalPinMap) / sizeof(pin_map_t);

uint8_t badPinNumber(void)
__attribute__((error("Pin number is too large or not a constant")));

static inline __attribute__((always_inline))
uint8_t getPinMode(uint8_t pin) {
  if (__builtin_constant_p(pin) && pin < digitalPinCount) {
    return (*digitalPinMap[pin].ddr >> digitalPinMap[pin].bit) & 1;
  } else {
    return badPinNumber();
  }
}

static inline __attribute__((always_inline))
void setPinMode(uint8_t pin, uint8_t mode) {
  if (__builtin_constant_p(pin) && pin < digitalPinCount) {
    if (mode) {
      *digitalPinMap[pin].ddr |= 1 << digitalPinMap[pin].bit;
    } else {
      *digitalPinMap[pin].ddr &= ~(1 << digitalPinMap[pin].bit);
    }
  } else {
    badPinNumber();
  }
}
static inline __attribute__((always_inline))
uint8_t fastDigitalRead(uint8_t pin) {
  if (__builtin_constant_p(pin) && pin < digitalPinCount) {
    return (*digitalPinMap[pin].pin >> digitalPinMap[pin].bit) & 1;
  } else {
    return badPinNumber();
  }
}
static inline __attribute__((always_inline))
void fastDigitalWrite(uint8_t pin, uint8_t value) {
  if (__builtin_constant_p(pin) && pin < digitalPinCount) {
    if (value) {
      *digitalPinMap[pin].port |= 1 << digitalPinMap[pin].bit;
    } else {
      *digitalPinMap[pin].port &= ~(1 << digitalPinMap[pin].bit);
    }
  } else {
    badPinNumber();
  }
}




#else
#error Architecture or board not supported.
#endif
