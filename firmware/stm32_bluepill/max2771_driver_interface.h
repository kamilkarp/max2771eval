#ifndef MAX2771_DRIVER_INTERFACE_H_
#define MAX2771_DRIVER_INTERFACE_H_

#include <stdint.h>

class Max2771DriverInterface {
  public:
    Max2771DriverInterface() = default;
    virtual void setup() = 0;
    virtual uint32_t readReg(uint32_t address) = 0;
    virtual bool writeReg(uint32_t address, uint32_t data) = 0;
    virtual void setShutdown(bool isShutdown) = 0;
    virtual bool isShutdown() = 0;
    virtual bool isLocked() = 0;
};

#endif // MAX2771_DRIVER_INTERFACE_H_
