import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max2771_eval_control/bloc/connection_cubit.dart';

class DisconnectButton extends StatelessWidget {
  const DisconnectButton({super.key});

  @override
  Widget build(BuildContext context) {
    final connectedPort =
        context.select<ConnectionCubit, String?>((e) => e.state.connectedPort);

    if (connectedPort == null) {
      return const SizedBox.shrink();
    }

    return TextButton(
        onPressed: () {
          context.read<ConnectionCubit>().disconnect();
        },
        child: const Text("Disconnect"));
  }
}
