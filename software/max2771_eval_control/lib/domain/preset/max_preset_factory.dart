// ignore_for_file: non_constant_identifier_names

import 'package:max2771_eval_control/domain/models/max_register.dart';
import 'package:max2771_eval_control/domain/preset/max_preset.dart';

class MaxPresetFactory {
  MaxPresetFactory._();

  static MaxPreset GPS_L1_2MHzBW_WithIF() {
    final config1 = Conf1MaxRegister.def()
      ..reg.FBW = 0 // 2.5MHz BW
      ..reg.FCENX = 1 // bandpass mode
      ..reg.FCEN = 64; // 6.24MHz IF center frequency

    final config2 = Conf2MaxRegister.def();
    final config3 = Conf3MaxRegister.def();
    final pllConfig = PLLConfigMaxRegister.def();
    final pllIntDiv = PLLIntDivMaxRegister.def()
      // 1575,42 - 6.24 = 1569,18 MHz
      ..reg.NDIV = 26153
      ..reg.RDIV = 400;
    final pllFracDiv = PLLFracDivMaxRegister.def();
    final clockCfg1 = ClockCfg1MaxRegister.def();
    final clockCfg2 = ClockCfg2MaxRegister.def();

    return MaxPreset(
      config1: config1,
      config2: config2,
      config3: config3,
      pllConfig: pllConfig,
      pllIntDiv: pllIntDiv,
      pllFracDiv: pllFracDiv,
      clockCfg1: clockCfg1,
      clockCfg2: clockCfg2,
    );
  }
}
