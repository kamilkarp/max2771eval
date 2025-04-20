import 'package:flutter/material.dart';
import 'package:max2771_eval_control/widget/connection_dropdown.dart';
import 'package:max2771_eval_control/widget/disconnect_button.dart';
import 'package:max2771_eval_control/widget/read_all_button.dart';
import 'package:max2771_eval_control/widget/reset_device_button.dart';
import 'package:max2771_eval_control/widget/write_all_button.dart';

class ConnectionAppbar extends StatelessWidget {
  const ConnectionAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          ConnectionDropdown(),
          const SizedBox(width: 8),
          DisconnectButton(),
          Spacer(),
          ResetDeviceButton(),
          const SizedBox(width: 8),
          ReadAllButton(),
          const SizedBox(width: 8),
          WriteAllButton(),
        ],
      ),
    );
  }
}
