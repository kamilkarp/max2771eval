import 'package:max2771_eval_control/domain/registers/clock_cfg2_register.dart';
import 'package:max2771_eval_control/domain/registers/clock_cfg1_register.dart';
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
}
