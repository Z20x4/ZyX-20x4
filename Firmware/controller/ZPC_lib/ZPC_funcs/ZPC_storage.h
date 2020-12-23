#include <Arduino.h>

#define ST_SPI_CLK A6
#define ST_SPI_CS A7
#define ST_SPI_MISO A8
#define ST_SPI_MOSI A9


#define ST_WRONG_ADDRESS 1;
#define ST_READ_ERROR 2;
#define ST_WRITE_ERROR 3;



extern uint8_t status;

void ZPC_st_init();

void ZPC_st_save_address_byte(int byte_number, uint8_t byte);

void ZPC_st_read_block(uint8_t destination_fist_page);

void ZPC_st_write_block(uint8_t source_first_page);
