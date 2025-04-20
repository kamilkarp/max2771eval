import 'package:max2771_eval_control/domain/registers/clock_cfg1_register.dart';
import 'package:max2771_eval_control/domain/registers/clock_cfg2_register.dart';
import 'package:max2771_eval_control/domain/registers/conf1_register.dart';
import 'package:max2771_eval_control/domain/registers/conf2_register.dart';
import 'package:max2771_eval_control/domain/registers/conf3_register.dart';
import 'package:max2771_eval_control/domain/registers/pll_config_register.dart';
import 'package:max2771_eval_control/domain/registers/pll_frac_div_register.dart';
import 'package:max2771_eval_control/domain/registers/pll_int_div_register.dart';

sealed class MaxRegister {
  int get value;
  int get adr;
}

class Conf1MaxRegister extends MaxRegister {
  Conf1MaxRegister(int value) {
    reg = Conf1Register(value);
  }

  late Conf1Register reg;

  @override
  int get value => reg.value;

  @override
  int get adr => 0x0;

  static const int adress = 0x0;

  factory Conf1MaxRegister.zero() {
    return Conf1MaxRegister(0);
  }

  factory Conf1MaxRegister.def() {
    return Conf1MaxRegister(0xBEA41603)
      ..reg.LNAMODE = 0 // HIGH BAND
      ..reg.MIXERMODE = 0 // HIGH BAND MIXER
      ..reg.FCENX = 0 // lowpass filter mode
      // FBW: filter bandwidth
      // 0: 2.5MHz,
      // 1: 8.7 MHz,
      // 2: 4.2 MHz,
      // 3: 23.4 MHz (lowpass mode only)
      // 4: 36.0 MHz (lowpass mode only)
      // 7: 16.4 MHz (lowpass mode only)
      ..reg.FBW = 2;
  }
}

class Conf2MaxRegister extends MaxRegister {
  Conf2MaxRegister(int value) {
    reg = Conf2Register(value);
  }

  late Conf2Register reg;

  @override
  int get value => reg.value;

  @override
  int get adr => 0x1;

  static const int adress = 0x1;

  factory Conf2MaxRegister.zero() {
    return Conf2MaxRegister(0);
  }

  factory Conf2MaxRegister.def() {
    return Conf2MaxRegister(0x20550288)
          ..reg.AGCMODE = 0 // Independent I and Q channel AGC
          ..reg.GAINREF = 170 // AGC bit density optimal for 2 bits data
          ..reg.FORMAT = 2 // 2's complement format
          ..reg.IQEN = 1 // both I and Q channels enabled
          ..reg.BITS = 2 // 2 bits per sample
          ..reg.DRVCFG = 0 // CMOS logic
        ;
  }
}

class Conf3MaxRegister extends MaxRegister {
  Conf3MaxRegister(int value) {
    reg = Conf3Register(value);
  }

  late Conf3Register reg;

  @override
  int get value => reg.value;

  @override
  int get adr => 0x2;

  static const int adress = 0x2;

  factory Conf3MaxRegister.zero() {
    return Conf3MaxRegister(0);
  }

  factory Conf3MaxRegister.def() {
    return Conf3MaxRegister(0x0EAFA1DC)
          ..reg.STRMEN = 0 // DSP interface disabled
          ..reg.PGAIEN = 1 // I channel PGA enabled
          ..reg.PGAQEN = 1 // Q channel PGA enabled
        ;
  }
}

class PLLConfigMaxRegister extends MaxRegister {
  PLLConfigMaxRegister(int value) {
    reg = PLLConfigRegister(value);
  }

  late PLLConfigRegister reg;

  @override
  int get value => reg.value;

  @override
  int get adr => 0x3;

  static const int adress = 0x3;

  factory PLLConfigMaxRegister.zero() {
    return PLLConfigMaxRegister(0);
  }

  factory PLLConfigMaxRegister.def() {
    return PLLConfigMaxRegister(0x698C0008)
          ..reg.REFDIV = 3 // xtal clock (0: x2, 1: /4, 2: /2, 3: xtal, 4: x4)
          ..reg.LOBAND = 0 // L1 band
          ..reg.REFOUTEN = 1 // enable clock buffer
          ..reg.INT_PLL = 1 // integer-n PLL
        ;
  }
}

class PLLIntDivMaxRegister extends MaxRegister {
  PLLIntDivMaxRegister(int value) {
    reg = PLLIntDivRegister(value);
  }

  late PLLIntDivRegister reg;

  @override
  int get value => reg.value;

  @override
  int get adr => 0x4;

  static const int adress = 0x4;

  factory PLLIntDivMaxRegister.zero() {
    return PLLIntDivMaxRegister(0);
  }

  factory PLLIntDivMaxRegister.def() {
    return PLLIntDivMaxRegister(0x00C00080)
          ..reg.RDIV = 400 // ref clock (24MHz) / 400 = 60KHz
          ..reg.NDIV = 26257 // 26257 * 60KHz = 1575,42 MHz / L1 band
        ;
  }
}

class PLLFracDivMaxRegister extends MaxRegister {
  PLLFracDivMaxRegister(int value) {
    reg = PLLFracDivRegister(value);
  }

  late PLLFracDivRegister reg;

  @override
  int get value => reg.value;

  @override
  int get adr => 0x5;

  static const int adress = 0x5;

  factory PLLFracDivMaxRegister.zero() {
    return PLLFracDivMaxRegister(0);
  }

  factory PLLFracDivMaxRegister.def() {
    return PLLFracDivMaxRegister(0x08000070)..reg.FDIV = 0;
  }
}

class ClockCfg1MaxRegister extends MaxRegister {
  ClockCfg1MaxRegister(int value) {
    reg = ClockCfg1Register(value);
  }

  late ClockCfg1Register reg;

  @override
  int get value => reg.value;

  @override
  int get adr => 0x7;

  static const int adress = 0x7;

  factory ClockCfg1MaxRegister.zero() {
    return ClockCfg1MaxRegister(0);
  }

  factory ClockCfg1MaxRegister.def() {
    return ClockCfg1MaxRegister(0x010061B2)
          ..reg.EXTADCCLK = 1 // external ADC clock
          ..reg.ADCCLK = 0 // 0: use output of ref clock divider for ADC
          // ..reg.ADCCLK = 1 // bypass ref clock divider for ADC
          ..reg.FCLKIN = 0 // bypass ADC clock divider
          // ..reg.FCLKIN = 1 // use fractional divider for ADC
          ..reg.REFCLK_L_CNT = 2048
          ..reg.REFCLK_M_CNT = 0
        // ADC clock = 8 MHz
        ;
  }
}

class ClockCfg2MaxRegister extends MaxRegister {
  ClockCfg2MaxRegister(int value) {
    reg = ClockCfg2Register(value);
  }

  late ClockCfg2Register reg;

  @override
  int get value => reg.value;

  @override
  int get adr => 0x0A;

  static const int adress = 0x0A;

  factory ClockCfg2MaxRegister.zero() {
    return ClockCfg2MaxRegister(0);
  }

  factory ClockCfg2MaxRegister.def() {
    return ClockCfg2MaxRegister(0x010061B0)
      ..reg.CLKOUT_SEL = 1 // ADC clock output
      ..reg.PRE_FRACDIV_SEL = 1 // use ref divider for ADC
      ..reg.ADCCLK_L_CNT = 0
      ..reg.ADCCLK_M_CNT = 0;
  }
}
