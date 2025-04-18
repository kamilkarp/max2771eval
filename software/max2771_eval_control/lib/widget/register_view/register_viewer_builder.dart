import 'package:flutter/material.dart';
import 'package:max2771_eval_control/domain/models/max_register.dart';
import 'package:max2771_eval_control/widget/register_view/conf1_register_view.dart';
import 'package:max2771_eval_control/widget/register_view/conf2_register_view.dart';
import 'package:max2771_eval_control/widget/register_view/conf3_register_view.dart';
import 'package:max2771_eval_control/widget/register_view/pll_config_register_view.dart';
import 'package:max2771_eval_control/widget/register_view/pll_frac_div_register_view.dart';
import 'package:max2771_eval_control/widget/register_view/pll_int_div_register_view.dart';
import 'package:max2771_eval_control/widget/register_view/clock_cfg1_register_view.dart';
import 'package:max2771_eval_control/widget/register_view/clock_cfg2_register_view.dart';


class RegisterViewerBuilder extends StatelessWidget {
  const RegisterViewerBuilder({super.key, required this.register});

  final MaxRegister register;

  @override
  Widget build(BuildContext context) {
    final reg = register;
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 450,
      ),
      child: switch (reg) {
        Conf1MaxRegister() => Conf1RegisterView(reg: reg),
        Conf2MaxRegister() => Conf2RegisterView(reg: reg),
        Conf3MaxRegister() => Conf3RegisterView(reg: reg),
        PLLConfigMaxRegister() => PllConfigRegisterView(reg: reg),
        PLLFracDivMaxRegister() => PllFracDivRegisterView(reg: reg),
        PLLIntDivMaxRegister() => PllIntDivRegisterView(reg: reg),
        ClockCfg1MaxRegister() => ClockCfg1RegisterView(reg: reg),
        ClockCfg2MaxRegister() => ClockCfg2RegisterView(reg: reg),
      },
    );
  }
}
