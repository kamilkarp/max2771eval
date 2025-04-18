#include <Arduino.h>
#include "wiring_digital.h"
#include "wiring_analog.h"
#include "wiring_time.h"
#include "max2771_driver_bit_bang.h"

static constexpr int kClkDelayUs = 20;  // 25kHz bitrate

Max2771DriverBitBang::Max2771DriverBitBang(uint32_t pin_sclk, uint32_t pin_sdata, uint32_t pin_csn, uint32_t pin_ld, uint32_t pin_shdn)
  : pin_sclk_(pin_sclk), pin_sdata_(pin_sdata), pin_csn_(pin_csn), pin_ld_(pin_ld), pin_shdn_(pin_shdn) {}

void Max2771DriverBitBang::setup() {
  pinMode(pin_sclk_, OUTPUT);
  pinMode(pin_csn_, OUTPUT);
  pinMode(pin_sdata_, INPUT_FLOATING);
  pinMode(pin_ld_, INPUT_FLOATING);
  pinMode(pin_shdn_, OUTPUT);

  digitalWrite(pin_sclk_, LOW);
  digitalWrite(pin_csn_, HIGH);
}

void Max2771DriverBitBang::setShutdown(bool isShutdown) {
  digitalWrite(pin_shdn_, !isShutdown);
}

bool Max2771DriverBitBang::isShutdown() {
  return !digitalRead(pin_shdn_);
}

bool Max2771DriverBitBang::isLocked() {
  return digitalRead(pin_ld_);
}


uint32_t Max2771DriverBitBang::readReg(uint32_t address) {
  uint32_t data = 0;
  pinMode(pin_sdata_, OUTPUT);
  digitalWrite(pin_csn_, LOW);

  for (int i = 11; i >= 0; i--) {
    digitalWrite(pin_sdata_, (address >> i) & 0x1);
    delayMicroseconds(kClkDelayUs);
    digitalWrite(pin_sclk_, HIGH);
    delayMicroseconds(kClkDelayUs);
    digitalWrite(pin_sclk_, LOW);
  }

  digitalWrite(pin_sdata_, HIGH);  // READ OP
  delayMicroseconds(kClkDelayUs);
  digitalWrite(pin_sclk_, HIGH);
  delayMicroseconds(kClkDelayUs);
  digitalWrite(pin_sclk_, LOW);
  digitalWrite(pin_sdata_, LOW);
  pinMode(pin_sdata_, INPUT_FLOATING);
  delayMicroseconds(kClkDelayUs);


  for (int i = 0; i < 3; i++) {
    digitalWrite(pin_sclk_, HIGH);
    delayMicroseconds(kClkDelayUs);
    digitalWrite(pin_sclk_, LOW);
    delayMicroseconds(kClkDelayUs);
  }

  for (int i = 31; i >= 0; i--) {
    int bit = digitalRead(pin_sdata_);
    data = (bit << i) | data;
    digitalWrite(pin_sclk_, HIGH);
    delayMicroseconds(kClkDelayUs);
    digitalWrite(pin_sclk_, LOW);
    delayMicroseconds(kClkDelayUs);
  }

  digitalWrite(pin_csn_, HIGH);
  delayMicroseconds(kClkDelayUs * 3);

  return data;
}

bool Max2771DriverBitBang::writeReg(uint32_t address, uint32_t data) {
  pinMode(pin_sdata_, OUTPUT);
  digitalWrite(pin_csn_, LOW);

  for (int i = 11; i >= 0; i--) {
    digitalWrite(pin_sdata_, (address >> i) & 0x1);
    delayMicroseconds(kClkDelayUs);
    digitalWrite(pin_sclk_, HIGH);
    delayMicroseconds(kClkDelayUs);
    digitalWrite(pin_sclk_, LOW);
  }

  digitalWrite(pin_sdata_, LOW);  // WRITE OP
  delayMicroseconds(kClkDelayUs);
  digitalWrite(pin_sclk_, HIGH);
  delayMicroseconds(kClkDelayUs);
  digitalWrite(pin_sclk_, LOW);
  delayMicroseconds(kClkDelayUs);


  for (int i = 0; i < 3; i++) {
    digitalWrite(pin_sclk_, HIGH);
    delayMicroseconds(kClkDelayUs);
    digitalWrite(pin_sclk_, LOW);
    delayMicroseconds(kClkDelayUs);
  }

  for (int i = 31; i >= 0; i--) {
    digitalWrite(pin_sdata_, (data >> i) & 0x1);
    delayMicroseconds(kClkDelayUs);
    digitalWrite(pin_sclk_, HIGH);
    delayMicroseconds(kClkDelayUs);
    digitalWrite(pin_sclk_, LOW);
  }

  pinMode(pin_sdata_, INPUT_FLOATING);
  digitalWrite(pin_csn_, HIGH);
  delayMicroseconds(kClkDelayUs * 3);

  return true;
}
