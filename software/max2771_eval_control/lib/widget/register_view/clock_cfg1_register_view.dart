import 'package:flutter/material.dart';
import 'package:max2771_eval_control/domain/models/max_register.dart';
import 'package:max2771_eval_control/widget/reg_value_edit/int_value_edit.dart';

class ClockCfg1RegisterView extends StatelessWidget {
  const ClockCfg1RegisterView({super.key, required this.reg});

  final ClockCfg1MaxRegister reg;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.black54,
        width: 1,
        style: BorderStyle.solid,
      ),
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: Colors.greenAccent.shade100,
          ),
          children: [
            const Text('Clock Configuration 1'),
            Text(reg.value.toRadixString(16)),
            Text(reg.adr.toRadixString(16)),
          ],
        ),
        TableRow(
          children: [
            const Text('MODE'),
            IntValueEdit(
                value: reg.reg.MODE,
                onSubmitted: (v) {
                  reg.reg.MODE = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('ADCCLK'),
            IntValueEdit(
                value: reg.reg.ADCCLK,
                onSubmitted: (v) {
                  reg.reg.ADCCLK = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('FCLKIN'),
            IntValueEdit(
                value: reg.reg.FCLKIN,
                onSubmitted: (v) {
                  reg.reg.FCLKIN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('REFCLK_M_CNT'),
            IntValueEdit(
                value: reg.reg.REFCLK_M_CNT,
                onSubmitted: (v) {
                  reg.reg.REFCLK_M_CNT = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('REFCLK_L_CNT'),
            IntValueEdit(
                value: reg.reg.REFCLK_L_CNT,
                onSubmitted: (v) {
                  reg.reg.REFCLK_L_CNT = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('EXTADCCLK'),
            IntValueEdit(
                value: reg.reg.EXTADCCLK,
                onSubmitted: (v) {
                  reg.reg.EXTADCCLK = v;
                }),
            const Text(''),
          ],
        ),
      ],
    );
  }
}
