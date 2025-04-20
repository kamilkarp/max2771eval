import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdcClockCalc extends StatefulWidget {
  const AdcClockCalc({super.key});

  @override
  State<AdcClockCalc> createState() => _AdcClockCalcState();
}

class _AdcClockCalcState extends State<AdcClockCalc> {
  final TextEditingController _refValue = TextEditingController(text: "24");

  final TextEditingController _mValue = TextEditingController(text: "0");
  final TextEditingController _lValue = TextEditingController(text: "0");
  double _result = 0;

  @override
  void initState() {
    super.initState();
    _mValue.addListener(() {
      _calculate();
    });
    _lValue.addListener(() {
      _calculate();
    });
    _refValue.addListener(() {
      _calculate();
    });
  }

  @override
  void dispose() {
    _refValue.dispose();
    _mValue.dispose();
    _lValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _refValue,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(label: Text('REF_CLK')),
        ),
        TextField(
          controller: _lValue,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(label: Text('L_CNT')),
        ),
        TextField(
          controller: _mValue,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(label: Text('M_CNT')),
        ),
        Text('f_out/f_in = $_result'),
        Text(
            'f_out =  ${_result * (double.tryParse(_refValue.text) ?? 0)} MHz'),
      ],
    );
  }

  void _calculate() {
    int m = int.tryParse(_mValue.text) ?? 0;
    int l = int.tryParse(_lValue.text) ?? 0;
    // LCOUNT/(4096 - MCOUNT + LCOUNT)
    _result = l / (4096 - m + l);

    if (mounted) {
      setState(() {});
    }
  }
}
