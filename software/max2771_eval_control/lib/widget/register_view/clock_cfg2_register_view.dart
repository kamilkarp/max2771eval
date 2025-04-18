import 'package:flutter/material.dart';
import 'package:max2771_eval_control/domain/models/max_register.dart';
import 'package:max2771_eval_control/widget/reg_value_edit/int_value_edit.dart';

class ClockCfg2RegisterView extends StatelessWidget {
  const ClockCfg2RegisterView({super.key, required this.reg});

  final ClockCfg2MaxRegister reg;

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
            const Text('Clock Configuration 2'),
            Text(reg.value.toRadixString(16)),
            Text(reg.adr.toRadixString(16)),
          ],
        ),
        TableRow(
          children: [
            const Text('CLKOUT_SEL'),
            IntValueEdit(
                value: reg.reg.CLKOUT_SEL,
                onSubmitted: (v) {
                  reg.reg.CLKOUT_SEL = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('PRE_FRACDIV_SEL'),
            IntValueEdit(
                value: reg.reg.PRE_FRACDIV_SEL,
                onSubmitted: (v) {
                  reg.reg.PRE_FRACDIV_SEL = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('ADCCLK_M_CNT'),
            IntValueEdit(
                value: reg.reg.ADCCLK_M_CNT,
                onSubmitted: (v) {
                  reg.reg.ADCCLK_M_CNT = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('ADCCLK_L_CNT'),
            IntValueEdit(
                value: reg.reg.ADCCLK_L_CNT,
                onSubmitted: (v) {
                  reg.reg.ADCCLK_L_CNT = v;
                }),
            const Text(''),
          ],
        ),
      ],
    );
  }
}
