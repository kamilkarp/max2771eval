import 'package:flutter/material.dart';
import 'package:max2771_eval_control/domain/models/max_register.dart';
import 'package:max2771_eval_control/widget/reg_value_edit/int_value_edit.dart';

class PllIntDivRegisterView extends StatelessWidget {
  const PllIntDivRegisterView({super.key, required this.reg});

  final PLLIntDivMaxRegister reg;

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
            const Text('PLL Integer Divider'),
            Text(reg.value.toRadixString(16)),
            Text(reg.adr.toRadixString(16)),
          ],
        ),
        TableRow(
          children: [
            const Text('RDIV'),
            IntValueEdit(
                value: reg.reg.RDIV,
                onSubmitted: (v) {
                  reg.reg.RDIV = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('NDIV'),
            IntValueEdit(
                value: reg.reg.NDIV,
                onSubmitted: (v) {
                  reg.reg.NDIV = v;
                }),
            const Text(''),
          ],
        ),
      ],
    );
  }
}
