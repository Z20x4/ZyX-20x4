#include "ZPC_storage.h"
#include "ZPC_funcs.h"
#include "../sd2card/Sd2Card.h"

uint32_t st_current_address;

Sd2Card SD{};

int ZPC_st_size() {
    return SD.cardSize();
}


void ZPC_st_init() {
    if (!SD.init()) {
        status = 1;
    } else {
        status = 0;
    }
    st_current_address = 0; 

}

void ZPC_st_save_address_byte(int byte_number, uint8_t byte){
    st_current_address &= ~(7 << (1 << byte_number));
    st_current_address |= byte << (1 << byte_number);
    status = 0;
}

void ZPC_st_read_block(uint8_t destination_first_page){
    if (destination_first_page == 256) {
        status = ST_WRONG_ADDRESS;
        return;
    }
    uint8_t* data = new uint8_t[512];

    if (SD.readBlock(st_current_address, data) == false) {
        status = ST_READ_ERROR;
        delete[] data;
        return;
    }

    ZPC_MemWriteBlock(destination_first_page * 256, data, 512);
    status = 0;
    delete[] data;
}

void ZPC_st_write_block(uint8_t source_first_page){
    uint8_t* data = new uint8_t[512];
    ZPC_MemReadBlock(data, source_first_page * 256, 512);

    if (SD.writeBlock(st_current_address, data) == false) {
        status = ST_WRITE_ERROR;
        delete[] data;
        return;
    }

    status = 0;
    delete[] data;
}
