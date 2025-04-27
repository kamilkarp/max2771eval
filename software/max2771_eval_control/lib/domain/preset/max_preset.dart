import 'package:max2771_eval_control/domain/models/max_register.dart';

class MaxPreset {
  MaxPreset({
    required this.config1,
    required this.config2,
    required this.config3,
    required this.pllConfig,
    required this.pllIntDiv,
    required this.pllFracDiv,
    required this.clockCfg1,
    required this.clockCfg2,
  });

  final Conf1MaxRegister config1;
  final Conf2MaxRegister config2;
  final Conf3MaxRegister config3;
  final PLLConfigMaxRegister pllConfig;
  final PLLIntDivMaxRegister pllIntDiv;
  final PLLFracDivMaxRegister pllFracDiv;
  final ClockCfg1MaxRegister clockCfg1;
  final ClockCfg2MaxRegister clockCfg2;
}
