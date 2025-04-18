#include <stdint.h>
#include "max2771.h"
#include "max2771_driver_bit_bang.h"
#include "max2771_driver_interface.h"

Max2771::Max2771(Max2771DriverInterface* driver)
  : driver_(driver) {}

void Max2771::setup() {
  driver_->setup();
  // required on power up
  writeRegMasked(0x0, (0b11111010 << 22), 0b11111111 << 22);
  writeRegMasked(0x9, (0b011 << 22), 0b111 << 22);

  uint32_t clkconf1 = 0;
  uint32_t clkconf1Mask = 0;
  clkconf1 |= (1 < MAX2771_ADCCLK_CLKCFG1_POS);      // BYPASS REF DIVIDER -> use XTAL freq
  clkconf1 |= (1 << MAX2771_EXTADCCLK_CLKCFG1_POS);  // USE EXTERNAL ADC CLOCK
  clkconf1Mask |= MAX2771_ADCCLK_CLKCFG1 | MAX2771_EXTADCCLK_CLKCFG1;

  writeRegMasked(MAX2771_CLKCFG1_ADR, clkconf1, clkconf1Mask);

  uint32_t clkconf2 = 0;
  uint32_t clkconf2Mask = 0;
  clkconf2 |= (1 < MAX2771_CLKOUT_SEL_CLKCFG2_POS);  // output internal adc clock
  clkconf2Mask |= MAX2771_CLKOUT_SEL_CLKCFG2;

  writeRegMasked(MAX2771_CLKCFG2_ADR, clkconf2, clkconf2Mask);


  uint32_t conf1 = 0;
  uint32_t conf1mask = 0;
  conf1 |= (0 < MAX2771_LNAMODE_CONF1_POS);  // HIGH BAND LNA ACTIVE
  conf1mask |= MAX2771_LNAMODE_CONF1;
  conf1 |= (0 < MAX2771_MIXERMODE_CONF1_POS);  // HIGH BAND MIXER ACTIVE
  conf1mask |= MAX2771_MIXERMODE_CONF1;
  conf1 |= (0 < MAX2771_FCENX_CONF1_POS);  // lowpass filter mode
  conf1mask |= MAX2771_FCENX_CONF1;
  conf1 |= (0x3 < MAX2771_FBW_CONF1_POS);  // 23.4 MHz filter BW
  conf1mask |= MAX2771_FBW_CONF1;

  writeRegMasked(MAX2771_CONF1_ADR, conf1, conf1mask);


  uint32_t conf2 = 0;
  uint32_t conf2mask = 0;
  conf2 |= (1 << MAX2771_IQEN_CONF2_POS);  // I and Q channel enable
  conf2mask |= MAX2771_IQEN_CONF2;
  conf2 |= (0x2 << MAX2771_FORMAT_CONF2_POS);  // two's complement format
  conf2mask |= MAX2771_FORMAT_CONF2;

  writeRegMasked(MAX2771_CONF2_ADR, conf2, conf2mask);

  uint32_t fracPll = 0;
  uint32_t fracPllMask = 0;
  fracPll |= (0 << MAX2771_FDIV_PLLFRACDIV_POS); // fractional part -> 0
  fracPllMask |= MAX2771_FDIV_PLLFRACDIV;

  writeRegMasked(MAX2771_PLLFRACDIV_ADR, fracPll, fracPllMask);

  uint32_t pll = 0;
  uint32_t pllMask = 0;
  pll |= (1 << MAX2771_REFDIV_PLLCFG_POS);     // divide xtal by 4 => 24/4 = 6 MHz
  pll |= (600 << MAX2771_RDIV_PLLINTDIV_POS);  // 6 MHz divided by 600 = 0.06 MHz
  // required LO frequency divider: 1575.42MHz/0.06MHz = 157542
  pll |= (157542 << MAX2771_NDIV_PLLINTDIV_POS);  // integer part

  pllMask |= (MAX2771_REFDIV_PLLCFG | MAX2771_RDIV_PLLINTDIV | MAX2771_NDIV_PLLINTDIV);

  writeRegMasked(MAX2771_PLLCFG_ADR, pll, pllMask);
}

uint32_t Max2771::readReg(uint8_t address) {
  return driver_->readReg(address);
}

bool Max2771::writeReg(uint8_t address, uint32_t data) {
  return driver_->writeReg(address, data);
}

bool Max2771::writeRegMasked(uint8_t address, uint32_t data, uint32_t mask) {
  uint32_t value = driver_->readReg(address);
  value &= ~mask;
  value |= data;

  return driver_->writeReg(address, value);
}