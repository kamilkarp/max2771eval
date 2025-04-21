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
  clkconf1 |= (2048 << MAX2771_REFCLK_L_CNT_CLKCFG1_POS);
  clkconf1 |= (0 << MAX2771_REFCLK_M_CNT_CLKCFG1_POS);
  clkconf1 |= (0 << MAX2771_FCLKIN_CLKCFG1_POS);          // bypass ADC clock divider
  clkconf1 |= (0 << MAX2771_ADCCLK_CLKCFG1_POS);          // use output of ref clock divider for ADC
  clkconf1 |= (1 << MAX2771_EXTADCCLK_CLKCFG1_POS);       // external ADC clock
  // ADC clock = 8 MHz
  clkconf1Mask |= (MAX2771_REFCLK_L_CNT_CLKCFG1 | MAX2771_REFCLK_M_CNT_CLKCFG1 | MAX2771_FCLKIN_CLKCFG1 | MAX2771_ADCCLK_CLKCFG1 | MAX2771_EXTADCCLK_CLKCFG1);
  writeRegMasked(MAX2771_CLKCFG1_ADR, clkconf1, clkconf1Mask);

  uint32_t clkconf2 = 0;
  uint32_t clkconf2Mask = 0;
  clkconf2 |= (0 << MAX2771_ADCCLK_L_CNT_CLKCFG2_POS);
  clkconf2 |= (0 << MAX2771_ADCCLK_M_CNT_CLKCFG2_POS);
  clkconf2 |= (1 << MAX2771_PRE_FRACDIV_SEL_CLKCFG2_POS);   // use ref divider for ADC
  clkconf2 |= (1 << MAX2771_CLKOUT_SEL_CLKCFG2_POS);        // ADC clock output for CLKOUT pin
  clkconf2Mask |= (MAX2771_ADCCLK_L_CNT_CLKCFG2 | MAX2771_ADCCLK_M_CNT_CLKCFG2 | MAX2771_PRE_FRACDIV_SEL_CLKCFG2 | MAX2771_CLKOUT_SEL_CLKCFG2);
  writeRegMasked(MAX2771_CLKCFG2_ADR, clkconf2, clkconf2Mask);

  uint32_t conf1 = 0;
  uint32_t conf1mask = 0;
  conf1 |= (0 << MAX2771_LNAMODE_CONF1_POS);  // HIGH BAND LNA ACTIVE
  conf1mask |= MAX2771_LNAMODE_CONF1;
  conf1 |= (0 << MAX2771_MIXERMODE_CONF1_POS);  // HIGH BAND MIXER ACTIVE
  conf1mask |= MAX2771_MIXERMODE_CONF1;
  conf1 |= (0 << MAX2771_FCENX_CONF1_POS);  // lowpass filter mode
  conf1mask |= MAX2771_FCENX_CONF1;
  conf1 |= (0x2 << MAX2771_FBW_CONF1_POS);  // 4.2 MHz filter BW
  conf1mask |= MAX2771_FBW_CONF1;
  writeRegMasked(MAX2771_CONF1_ADR, conf1, conf1mask);

  uint32_t conf2 = 0;
  uint32_t conf2mask = 0;
  conf2 |= (1 << MAX2771_AGCMODE_CONF2_POS); // Independent I and Q channel AGC
  conf2mask |= MAX2771_AGCMODE_CONF2;
  conf2 |= (170 << MAX2771_GAINREF_CONF2_POS); // AGC bit density optimal for 2 bits data
  conf2mask |= MAX2771_GAINREF_CONF2;
  conf2 |= (0x2 << MAX2771_BITS_CONF2_POS);  // 2 bits per sample
  conf2mask |= MAX2771_BITS_CONF2;
  conf2 |= (0x0 << MAX2771_DRVCFG_CONF2_POS);  // CMOS logic levels
  conf2mask |= MAX2771_DRVCFG_CONF2;
  conf2 |= (1 << MAX2771_IQEN_CONF2_POS);  // I and Q channel enable
  conf2mask |= MAX2771_IQEN_CONF2;
  conf2 |= (0x2 << MAX2771_FORMAT_CONF2_POS);  // two's complement format
  conf2mask |= MAX2771_FORMAT_CONF2;
  writeRegMasked(MAX2771_CONF2_ADR, conf2, conf2mask);

  uint32_t conf3 = 0;
  uint32_t conf3mask = 0;
  conf3 |= (0 << MAX2771_STRMEN_CONF3_POS);  // DSP interface disabled
  conf3mask |= MAX2771_STRMEN_CONF3;
  conf3 |= (1 << MAX2771_PGAIEN_CONF3_POS);  // I channel PGA enabled
  conf3mask |= MAX2771_PGAIEN_CONF3;
  conf3 |= (1 << MAX2771_PGAQEN_CONF3_POS);  // Q channel PGA enabled
  conf3mask |= MAX2771_PGAQEN_CONF3;
  writeRegMasked(MAX2771_CONF3_ADR, conf3, conf3mask);

  uint32_t fracPll = 0;
  uint32_t fracPllMask = 0;
  fracPll |= (0 << MAX2771_FDIV_PLLFRACDIV_POS); // fractional part -> 0
  fracPllMask |= MAX2771_FDIV_PLLFRACDIV;
  writeRegMasked(MAX2771_PLLFRACDIV_ADR, fracPll, fracPllMask);

  uint32_t pll = 0;
  uint32_t pllMask = 0;
  pll |= (3 << MAX2771_REFDIV_PLLCFG_POS);    // xtal clock (0: x2, 1: /4, 2: /2, 3: xtal, 4: x4)
  pll |= (0 << MAX2771_LOBAND_PLLCFG_POS);    // L1 band
  pll |= (1 << MAX2771_REFOUTEN_PLLCFG_POS);  // enable clock buffer
  pll |= (1 << MAX2771_INT_PLL_PLLCFG_POS);   // integer-n PLL
  pllMask |= (MAX2771_REFDIV_PLLCFG | MAX2771_LOBAND_PLLCFG | MAX2771_REFOUTEN_PLLCFG | MAX2771_INT_PLL_PLLCFG);
  writeRegMasked(MAX2771_PLLCFG_ADR, pll, pllMask);

  uint32_t pllInt = 0;
  uint32_t pllIntMask = 0;
  pllInt |= (400 << MAX2771_RDIV_PLLINTDIV_POS);  // 24 MHz divided by 400 -> 60 kHz
  // required LO frequency divider: 1575.42MHz/0.06MHz = 26257
  pllInt |= (26257 << MAX2771_NDIV_PLLINTDIV_POS);  // integer part
  pllIntMask |= ( MAX2771_RDIV_PLLINTDIV | MAX2771_NDIV_PLLINTDIV);
  writeRegMasked(MAX2771_PLLINTDIV_ADR, pllInt, pllIntMask);
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