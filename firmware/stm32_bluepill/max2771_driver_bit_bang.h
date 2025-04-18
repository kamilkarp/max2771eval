#ifndef MAX2771_DRIVER_BIT_BANG_H_
#define MAX2771_DRIVER_BIT_BANG_H_

#include "max2771_driver_interface.h"

class Max2771DriverBitBang : public Max2771DriverInterface {
  public:
    Max2771DriverBitBang(uint32_t pin_sclk, uint32_t pin_sdata, uint32_t pin_csn, uint32_t pin_ld, uint32_t pin_shdn);
    virtual void setup();
    virtual uint32_t readReg(uint32_t address);
    virtual bool writeReg(uint32_t address, uint32_t data);
    virtual void setShutdown(bool isShutdown);
    virtual bool isShutdown();
    virtual bool isLocked();
  private:
    uint32_t pin_sclk_;
    uint32_t pin_sdata_;
    uint32_t pin_csn_;
    uint32_t pin_ld_;
    uint32_t pin_shdn_;
};

#endif // MAX2771_DRIVER_BIT_BANG_H_
