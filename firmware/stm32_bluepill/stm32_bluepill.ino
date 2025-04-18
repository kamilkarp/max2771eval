#include <Arduino.h>
#include "max2771.h"
#include "max2771_driver_bit_bang.h"

#define MAX_SHDN_PIN PB0
#define MAX_LD_PIN PB1
#define MAX_SDATA_PIN PA7
#define MAX_SCLK_PIN PA5
#define MAX_CSN_PIN PA4
#define USER_LED_PIN PB8

static Max2771DriverBitBang max2771_driver(MAX_SCLK_PIN, MAX_SDATA_PIN, MAX_CSN_PIN, MAX_LD_PIN, MAX_SHDN_PIN);
static Max2771 max2771(&max2771_driver);

void setup() {
  pinMode(USER_LED_PIN, OUTPUT);
  delay(100);
  max2771.setup();

  Serial.begin();
}

void loop() {
  String command = Serial.readStringUntil('\n');
  auto length = command.length();

  if (length <= 0) {
    return;
  }

  String substrings[5];
  size_t currentIndex = 0;
  size_t lastIndex = 0;
  size_t numberOfSubstrings = 0;


  while (currentIndex < length) {
    if ((command.charAt(currentIndex) != ':')) {
      currentIndex++;
      continue;
    }

    if (numberOfSubstrings >= 4) {
      break;
    }

    substrings[numberOfSubstrings] = command.substring(lastIndex, currentIndex);

    lastIndex = currentIndex + 1;
    numberOfSubstrings++;
    currentIndex++;
  }

  if (numberOfSubstrings < 4) {
    substrings[numberOfSubstrings] = command.substring(lastIndex);
    numberOfSubstrings++;
  }

  if (numberOfSubstrings == 2) {
    if (substrings[0] == "READ") {
      uint8_t address = substrings[1].toInt();
      auto value = max2771.readReg(address);
      Serial.println("REG:" + String(address) + ":" + String(value));
    }
  } else if (numberOfSubstrings == 3) {
    if (substrings[0] == "WRITE") {
      uint8_t address = substrings[1].toInt();
      uint32_t value = (uint32_t)(std::atoll(substrings[2].c_str()));
      max2771.writeReg(address, value);
      auto result = max2771.readReg(address);
      Serial.println("REG:" + String(address) + ":" + String(result));
    }
  }
}
