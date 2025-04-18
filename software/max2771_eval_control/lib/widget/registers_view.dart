import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max2771_eval_control/bloc/max_registers_cubit.dart';
import 'package:max2771_eval_control/widget/register_view/register_viewer_builder.dart';

class RegistersView extends StatelessWidget {
  const RegistersView({super.key});

  @override
  Widget build(BuildContext context) {
    final registers = context.watch<MaxRegistersCubit>().state;
    final conf1 = registers.conf1;
    final conf2 = registers.conf2;
    final conf3 = registers.conf3;
    final pllConfig = registers.pllConfig;
    final pllIntDiv = registers.pllIntDiv;
    final pllFracDiv = registers.pllFracDiv;
    final clockCfg1 = registers.clockCfg1;
    final clockCfg2 = registers.clockCfg2;

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            spacing: 30,
            runSpacing: 30,
            children: [
              RegisterViewerBuilder(register: conf1),
              RegisterViewerBuilder(register: conf2),
              RegisterViewerBuilder(register: conf3),
              RegisterViewerBuilder(register: pllConfig),
              RegisterViewerBuilder(register: pllIntDiv),
              RegisterViewerBuilder(register: pllFracDiv),
              RegisterViewerBuilder(register: clockCfg1),
              RegisterViewerBuilder(register: clockCfg2),
            ],
          ),
        ),
      ),
    );
  }
}
