import 'package:flutter/material.dart';
import 'package:max2771_eval_control/domain/models/max_register.dart';
import 'package:max2771_eval_control/widget/reg_value_edit/int_value_edit.dart';

class PllFracDivRegisterView extends StatelessWidget {
  const PllFracDivRegisterView({super.key, required this.reg});

  final PLLFracDivMaxRegister reg;

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
            const Text('PLL Fractional Divider'),
            Text(reg.value.toRadixString(16)),
            Text(reg.adr.toRadixString(16)),
          ],
        ),
        TableRow(
          children: [
            const Text('FDIV'),
            IntValueEdit(
                value: reg.reg.FDIV,
                onSubmitted: (v) {
                  reg.reg.FDIV = v;
                }),
            const Text(''),
          ],
        ),
      ],
    );
  }
}
