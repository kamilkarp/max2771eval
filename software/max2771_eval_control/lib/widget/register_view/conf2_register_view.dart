import 'package:flutter/material.dart';
import 'package:max2771_eval_control/domain/models/max_register.dart';
import 'package:max2771_eval_control/widget/reg_value_edit/int_value_edit.dart';

class Conf2RegisterView extends StatelessWidget {
  const Conf2RegisterView({super.key, required this.reg});

  final Conf2MaxRegister reg;

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
            const Text('Configuration 2'),
            Text(reg.value.toRadixString(16)),
            Text(reg.adr.toRadixString(16)),
          ],
        ),
        TableRow(
          children: [
            const Text('DIEID'),
            IntValueEdit(
                value: reg.reg.DIEID,
                onSubmitted: (v) {
                  reg.reg.DIEID = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('DRVCFG'),
            IntValueEdit(
                value: reg.reg.DRVCFG,
                onSubmitted: (v) {
                  reg.reg.DRVCFG = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('BITS'),
            IntValueEdit(
                value: reg.reg.BITS,
                onSubmitted: (v) {
                  reg.reg.BITS = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('FORMAT'),
            IntValueEdit(
                value: reg.reg.FORMAT,
                onSubmitted: (v) {
                  reg.reg.FORMAT = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('AGCMODE'),
            IntValueEdit(
                value: reg.reg.AGCMODE,
                onSubmitted: (v) {
                  reg.reg.AGCMODE = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('SPI_SDIO_CONFIG'),
            IntValueEdit(
                value: reg.reg.SPI_SDIO_CONFIG,
                onSubmitted: (v) {
                  reg.reg.SPI_SDIO_CONFIG = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('GAINREF'),
            IntValueEdit(
                value: reg.reg.GAINREF,
                onSubmitted: (v) {
                  reg.reg.GAINREF = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('IQEN'),
            IntValueEdit(
                value: reg.reg.IQEN,
                onSubmitted: (v) {
                  reg.reg.IQEN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('ANAIMON'),
            IntValueEdit(
                value: reg.reg.ANAIMON,
                onSubmitted: (v) {
                  reg.reg.ANAIMON = v;
                }),
            const Text(''),
          ],
        ),
      ],
    );
  }
}
