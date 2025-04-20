import 'package:flutter/material.dart';
import 'package:max2771_eval_control/widget/connection_appbar.dart';
import 'package:max2771_eval_control/widget/registers_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: ConnectionAppbar(),
      ),
      body: SelectionArea(child: RegistersView()),
    );
  }
}
