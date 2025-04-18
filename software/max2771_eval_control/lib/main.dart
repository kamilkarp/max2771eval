import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max2771_eval_control/bloc/connection_cubit.dart';
import 'package:max2771_eval_control/bloc/max_registers_cubit.dart';
import 'package:max2771_eval_control/data/connection_manager.dart';
import 'package:max2771_eval_control/pages/home_page.dart';

void main() {
  runApp(const EvalApp());
}

class EvalApp extends StatelessWidget {
  const EvalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ConnectionManager>(
      create: (context) => ConnectionManager(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ConnectionCubit>(
            create: (context) => ConnectionCubit(
              manager: context.read<ConnectionManager>(),
            ),
          ),
          BlocProvider<MaxRegistersCubit>(
            create: (context) => MaxRegistersCubit(
              manager: context.read<ConnectionManager>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'MAX2771 eval',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
