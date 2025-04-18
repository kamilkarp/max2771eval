import 'package:flutter/material.dart';
import 'package:max2771_eval_control/domain/models/max_register.dart';
import 'package:max2771_eval_control/widget/reg_value_edit/int_value_edit.dart';

class Conf1RegisterView extends StatelessWidget {
  const Conf1RegisterView({super.key, required this.reg});

  final Conf1MaxRegister reg;

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
            const Text('Configuration 1'),
            Text(reg.value.toRadixString(16)),
            Text(reg.adr.toRadixString(16)),
          ],
        ),
        TableRow(
          children: [
            const Text('CHIPEN'),
            IntValueEdit(
                value: reg.reg.CHIPEN,
                onSubmitted: (v) {
                  reg.reg.CHIPEN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('IDLE'),
            IntValueEdit(
                value: reg.reg.IDLE,
                onSubmitted: (v) {
                  reg.reg.IDLE = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('FGAIN'),
            IntValueEdit(
                value: reg.reg.FGAIN,
                onSubmitted: (v) {
                  reg.reg.FGAIN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            Text('FCENX'),
            IntValueEdit(
                value: reg.reg.FCENX,
                onSubmitted: (v) {
                  reg.reg.FCENX = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('F3OR5'),
            IntValueEdit(
                value: reg.reg.F3OR5,
                onSubmitted: (v) {
                  reg.reg.F3OR5 = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('FBW'),
            IntValueEdit(
                value: reg.reg.FBW,
                onSubmitted: (v) {
                  reg.reg.FBW = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('FCEN'),
            IntValueEdit(
                value: reg.reg.FCEN,
                onSubmitted: (v) {
                  reg.reg.FCEN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('MIXERMODE'),
            IntValueEdit(
                value: reg.reg.MIXERMODE,
                onSubmitted: (v) {
                  reg.reg.MIXERMODE = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('LNAMODE'),
            IntValueEdit(
                value: reg.reg.LNAMODE,
                onSubmitted: (v) {
                  reg.reg.LNAMODE = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('MIXPOLE'),
            IntValueEdit(
                value: reg.reg.MIXPOLE,
                onSubmitted: (v) {
                  reg.reg.MIXPOLE = v;
                }),
            const Text(''),
          ],
        ),
      ],
    );
  }
}
