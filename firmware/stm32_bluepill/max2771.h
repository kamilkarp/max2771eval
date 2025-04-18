#ifndef MAX2771_H_
#define MAX2771_H_

#include <stdint.h>
#include "max2771_reg.h"
#include "max2771_driver_interface.h"


class Max2771 {
public:
  Max2771(Max2771DriverInterface* driver);
  virtual ~Max2771() = default;

  virtual void setup();
  virtual uint32_t readReg(uint8_t address);
  virtual bool writeReg(uint8_t address, uint32_t data);
  virtual bool writeRegMasked(uint8_t address, uint32_t data, uint32_t mask);
private:
  Max2771DriverInterface* driver_;
};

#endif  // MAX2771_H_