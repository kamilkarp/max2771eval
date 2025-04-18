import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max2771_eval_control/bloc/connection_cubit.dart';

class ConnectionDropdown extends StatelessWidget {
  const ConnectionDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final connectionState = context.watch<ConnectionCubit>().state;
    final availablePorts = connectionState.availablePorts;
    final connectedPort = connectionState.connectedPort;

    return AbsorbPointer(
      absorbing: connectedPort != null,
      child: DropdownButton<String>(
        value: connectedPort,
        items: [
          for (final port in availablePorts)
            DropdownMenuItem<String>(
              value: port,
              child: Text(port),
            ),
        ],
        onChanged: (connectedPort) {
          if (connectedPort != null) {
            context.read<ConnectionCubit>().connect(connectedPort);
          } else {
            context.read<ConnectionCubit>().disconnect();
          }
        },
      ),
    );
  }
}
