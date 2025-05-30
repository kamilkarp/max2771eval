import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max2771_eval_control/bloc/connection_cubit.dart';
import 'package:max2771_eval_control/bloc/max_registers_cubit.dart';

class ReadAllButton extends StatelessWidget {
  const ReadAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    final connectedPort =
        context.select<ConnectionCubit, String?>((e) => e.state.connectedPort);

    final isLoading =
        context.select<MaxRegistersCubit, bool>((e) => e.state.loading);

    if (connectedPort == null) {
      return const SizedBox.shrink();
    }

    return TextButton(
        onPressed: isLoading
            ? null
            : () {
                context.read<MaxRegistersCubit>().readAll();
              },
        child: const Text("Read all"));
  }
}
