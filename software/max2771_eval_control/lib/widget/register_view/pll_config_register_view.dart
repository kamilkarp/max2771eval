import 'package:flutter/material.dart';
import 'package:max2771_eval_control/domain/models/max_register.dart';
import 'package:max2771_eval_control/widget/reg_value_edit/int_value_edit.dart';

class PllConfigRegisterView extends StatelessWidget {
  const PllConfigRegisterView({super.key, required this.reg});

  final PLLConfigMaxRegister reg;

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
            const Text('PLL Configuration'),
            Text(reg.value.toRadixString(16)),
            Text(reg.adr.toRadixString(16)),
          ],
        ),
        TableRow(
          children: [
            const Text('PWRSAV'),
            IntValueEdit(
                value: reg.reg.PWRSAV,
                onSubmitted: (v) {
                  reg.reg.PWRSAV = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('INT_PLL'),
            IntValueEdit(
                value: reg.reg.INT_PLL,
                onSubmitted: (v) {
                  reg.reg.INT_PLL = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('ICP'),
            IntValueEdit(
                value: reg.reg.ICP,
                onSubmitted: (v) {
                  reg.reg.ICP = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('IXTAL'),
            IntValueEdit(
                value: reg.reg.IXTAL,
                onSubmitted: (v) {
                  reg.reg.IXTAL = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('REFOUTEN'),
            IntValueEdit(
                value: reg.reg.REFOUTEN,
                onSubmitted: (v) {
                  reg.reg.REFOUTEN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('LOBAND'),
            IntValueEdit(
                value: reg.reg.LOBAND,
                onSubmitted: (v) {
                  reg.reg.LOBAND = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('REFDIV'),
            IntValueEdit(
                value: reg.reg.REFDIV,
                onSubmitted: (v) {
                  reg.reg.REFDIV = v;
                }),
            const Text(''),
          ],
        ),
      ],
    );
  }
}
