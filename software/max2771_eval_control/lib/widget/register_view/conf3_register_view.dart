import 'package:flutter/material.dart';
import 'package:max2771_eval_control/domain/models/max_register.dart';
import 'package:max2771_eval_control/widget/reg_value_edit/int_value_edit.dart';

class Conf3RegisterView extends StatelessWidget {
  const Conf3RegisterView({super.key, required this.reg});

  final Conf3MaxRegister reg;

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
            const Text('Configuration 3'),
            Text(reg.value.toRadixString(16)),
            Text(reg.adr.toRadixString(16)),
          ],
        ),
        TableRow(
          children: [
            const Text('STRMRST'),
            IntValueEdit(
                value: reg.reg.STRMRST,
                onSubmitted: (v) {
                  reg.reg.STRMRST = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('DATA_SYNCEN'),
            IntValueEdit(
                value: reg.reg.DATA_SYNCEN,
                onSubmitted: (v) {
                  reg.reg.DATA_SYNCEN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('TIME_SYNCEN'),
            IntValueEdit(
                value: reg.reg.TIME_SYNCEN,
                onSubmitted: (v) {
                  reg.reg.TIME_SYNCEN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('STAMPEN'),
            IntValueEdit(
                value: reg.reg.STAMPEN,
                onSubmitted: (v) {
                  reg.reg.STAMPEN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('STRMBITS'),
            IntValueEdit(
                value: reg.reg.STRMBITS,
                onSubmitted: (v) {
                  reg.reg.STRMBITS = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('STRMSTOP'),
            IntValueEdit(
                value: reg.reg.STRMSTOP,
                onSubmitted: (v) {
                  reg.reg.STRMSTOP = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('STRMSTART'),
            IntValueEdit(
                value: reg.reg.STRMSTART,
                onSubmitted: (v) {
                  reg.reg.STRMSTART = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('STRMEN'),
            IntValueEdit(
                value: reg.reg.STRMEN,
                onSubmitted: (v) {
                  reg.reg.STRMEN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('PGAQEN'),
            IntValueEdit(
                value: reg.reg.PGAQEN,
                onSubmitted: (v) {
                  reg.reg.PGAQEN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('PGAIEN'),
            IntValueEdit(
                value: reg.reg.PGAIEN,
                onSubmitted: (v) {
                  reg.reg.PGAIEN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('FHIPEN'),
            IntValueEdit(
                value: reg.reg.FHIPEN,
                onSubmitted: (v) {
                  reg.reg.FHIPEN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('HILOADEN'),
            IntValueEdit(
                value: reg.reg.HILOADEN,
                onSubmitted: (v) {
                  reg.reg.HILOADEN = v;
                }),
            const Text(''),
          ],
        ),
        TableRow(
          children: [
            const Text('GAININ'),
            IntValueEdit(
                value: reg.reg.GAININ,
                onSubmitted: (v) {
                  reg.reg.GAININ = v;
                }),
            const Text(''),
          ],
        ),
      ],
    );
  }
}
