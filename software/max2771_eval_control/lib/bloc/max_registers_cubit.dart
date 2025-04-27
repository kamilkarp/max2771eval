import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max2771_eval_control/data/connection_manager.dart';
import 'package:max2771_eval_control/domain/models/max_register.dart';
import 'package:max2771_eval_control/domain/preset/max_preset.dart';

class RegistersState {
  RegistersState({
    Conf1MaxRegister? config1,
    Conf2MaxRegister? config2,
    Conf3MaxRegister? config3,
    PLLConfigMaxRegister? pllConfig,
    PLLIntDivMaxRegister? pllIntDiv,
    PLLFracDivMaxRegister? pllFracDiv,
    ClockCfg1MaxRegister? clockCfg1,
    ClockCfg2MaxRegister? clockCfg2,
    this.loading = false,
  }) {
    conf1 = config1 ?? Conf1MaxRegister.zero();
    conf2 = config2 ?? Conf2MaxRegister.zero();
    conf3 = config3 ?? Conf3MaxRegister.zero();
    this.pllConfig = pllConfig ?? PLLConfigMaxRegister.zero();
    this.pllIntDiv = pllIntDiv ?? PLLIntDivMaxRegister.zero();
    this.pllFracDiv = pllFracDiv ?? PLLFracDivMaxRegister.zero();
    this.clockCfg1 = clockCfg1 ?? ClockCfg1MaxRegister.zero();
    this.clockCfg2 = clockCfg2 ?? ClockCfg2MaxRegister.zero();
  }

  late Conf1MaxRegister conf1;
  late Conf2MaxRegister conf2;
  late Conf3MaxRegister conf3;
  late PLLConfigMaxRegister pllConfig;
  late PLLIntDivMaxRegister pllIntDiv;
  late PLLFracDivMaxRegister pllFracDiv;
  late ClockCfg1MaxRegister clockCfg1;
  late ClockCfg2MaxRegister clockCfg2;
  final bool loading;

  RegistersState copyWith({
    Conf1MaxRegister? config1,
    Conf2MaxRegister? config2,
    Conf3MaxRegister? config3,
    PLLConfigMaxRegister? pllConfig,
    PLLIntDivMaxRegister? pllIntDiv,
    PLLFracDivMaxRegister? pllFracDiv,
    ClockCfg1MaxRegister? clockCfg1,
    ClockCfg2MaxRegister? clockCfg2,
    bool loading = false,
  }) {
    return RegistersState(
      config1: config1 ?? conf1,
      config2: config2 ?? conf2,
      config3: config3 ?? conf3,
      pllConfig: pllConfig ?? this.pllConfig,
      pllIntDiv: pllIntDiv ?? this.pllIntDiv,
      pllFracDiv: pllFracDiv ?? this.pllFracDiv,
      clockCfg1: clockCfg1 ?? this.clockCfg1,
      clockCfg2: clockCfg2 ?? this.clockCfg2,
      loading: loading,
    );
  }
}

class MaxRegistersCubit extends Cubit<RegistersState> {
  MaxRegistersCubit({ConnectionManager? manager})
      : _connectionManager = manager ?? ConnectionManager(),
        super(RegistersState()) {
    _refreshSub =
        Stream.periodic(Duration(milliseconds: 2000), (_) {}).listen((_) {
      emit(state.copyWith());
    });
  }
  final ConnectionManager _connectionManager;
  late StreamSubscription<void> _refreshSub;
  StreamSubscription? _operationSub;

  @override
  Future<void> close() async {
    await _operationSub?.cancel();
    await _refreshSub.cancel();
    super.close();
  }

  Future<void> resetDevice() async {
    if (state.loading) throw Exception("Operation in progress");
    emit(state.copyWith(loading: true));

    try {
      await _writeRegister(Conf1MaxRegister.def());
      await _writeRegister(Conf2MaxRegister.def());
      await _writeRegister(Conf3MaxRegister.def());
      await _writeRegister(PLLConfigMaxRegister.def());
      await _writeRegister(PLLIntDivMaxRegister.def());
      await _writeRegister(PLLFracDivMaxRegister.def());
      await _writeRegister(ClockCfg1MaxRegister.def());
      await _writeRegister(ClockCfg2MaxRegister.def());
      emit(state.copyWith(loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false));
      rethrow;
    }
  }

  Future<void> writeAll() async {
    if (state.loading) throw Exception("Operation in progress");
    emit(state.copyWith(loading: true));

    try {
      await _writeRegister(state.conf1);
      await _writeRegister(state.conf2);
      await _writeRegister(state.conf3);
      await _writeRegister(state.pllConfig);
      await _writeRegister(state.pllIntDiv);
      await _writeRegister(state.pllFracDiv);
      await _writeRegister(state.clockCfg1);
      await _writeRegister(state.clockCfg2);
      emit(state.copyWith(loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false));
      rethrow;
    }
  }

  Future<void> writePreset(MaxPreset preset) async {
    if (state.loading) throw Exception("Operation in progress");
    emit(state.copyWith(loading: true));

    try {
      await _writeRegister(preset.config1);
      await _writeRegister(preset.config2);
      await _writeRegister(preset.config3);
      await _writeRegister(preset.pllConfig);
      await _writeRegister(preset.pllIntDiv);
      await _writeRegister(preset.pllFracDiv);
      await _writeRegister(preset.clockCfg1);
      await _writeRegister(preset.clockCfg2);
      emit(state.copyWith(loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false));
      rethrow;
    }
  }

  Future<void> readAll() async {
    if (state.loading) throw Exception("Operation in progress");
    emit(state.copyWith(loading: true));

    try {
      emit(RegistersState(
        config1:
            await _readRegister(Conf1MaxRegister.adress) as Conf1MaxRegister,
        config2:
            await _readRegister(Conf2MaxRegister.adress) as Conf2MaxRegister,
        config3:
            await _readRegister(Conf3MaxRegister.adress) as Conf3MaxRegister,
        pllConfig: await _readRegister(PLLConfigMaxRegister.adress)
            as PLLConfigMaxRegister,
        pllIntDiv: await _readRegister(PLLIntDivMaxRegister.adress)
            as PLLIntDivMaxRegister,
        pllFracDiv: await _readRegister(PLLFracDivMaxRegister.adress)
            as PLLFracDivMaxRegister,
        clockCfg1: await _readRegister(ClockCfg1MaxRegister.adress)
            as ClockCfg1MaxRegister,
        clockCfg2: await _readRegister(ClockCfg2MaxRegister.adress)
            as ClockCfg2MaxRegister,
        loading: false,
      ));
    } catch (e) {
      emit(state.copyWith(loading: false));
      rethrow;
    }
  }

  Future<MaxRegister> readRegister(int address) async {
    if (state.loading) throw Exception("Operation in progress");
    emit(state.copyWith(loading: true));

    await Future.delayed(const Duration(milliseconds: 200));

    try {
      final register = await _readRegister(address);
      emit(state.copyWith(loading: false));
      return register;
    } catch (e) {
      emit(state.copyWith(loading: false));
      rethrow;
    }
  }

  Future<void> _writeRegister(MaxRegister register) async {
    await _connectionManager
        .sendData(utf8.encode('WRITE:${register.adr}:${register.value}\n'));
    final response = await _readUntil('\n');
    final responseString = utf8.decode(response);
    print(responseString);
  }

  Future<MaxRegister> _readRegister(int address) async {
    await _connectionManager.sendData(utf8.encode('READ:$address\n'));
    final response = await _readUntil('\n');
    final responseString = utf8.decode(response);
    print(responseString);
    // regex for "REG:<address>:<value>"
    final regex = RegExp(r'REG:(\d+):(\d+)');
    final match = regex.firstMatch(responseString);
    if (match == null) {
      emit(state.copyWith(loading: false));
      throw Exception("Invalid response format");
    }
    final adr = int.parse(match.group(1)!);
    final value = int.parse(match.group(2)!);
    emit(state.copyWith(loading: false));

    return switch (adr) {
      Conf1MaxRegister.adress => Conf1MaxRegister(value),
      Conf2MaxRegister.adress => Conf2MaxRegister(value),
      Conf3MaxRegister.adress => Conf3MaxRegister(value),
      PLLConfigMaxRegister.adress => PLLConfigMaxRegister(value),
      PLLIntDivMaxRegister.adress => PLLIntDivMaxRegister(value),
      PLLFracDivMaxRegister.adress => PLLFracDivMaxRegister(value),
      ClockCfg1MaxRegister.adress => ClockCfg1MaxRegister(value),
      ClockCfg2MaxRegister.adress => ClockCfg2MaxRegister(value),
      _ => throw Exception("Invalid register type")
    };
  }

  Future<Uint8List> _readUntil(
    String terminator, {
    Duration timeout = const Duration(seconds: 5),
  }) {
    if (!_connectionManager.isConnected) {
      throw Exception("Not connected");
    }

    final completer = Completer<Uint8List>();
    var bytesRead = BytesBuilder();

    _operationSub = _connectionManager.observeData().listen((data) {
      final terminatorIndex = data.indexOf(terminator.codeUnitAt(0));

      if (terminatorIndex < 0) {
        bytesRead.add(data);
      } else {
        final terminatorData = data.sublist(0, terminatorIndex);
        bytesRead.add(terminatorData);

        _operationSub?.cancel();
        completer.complete(bytesRead.toBytes());
      }
    }, onError: (e, st) {
      completer.completeError(e, st);
    });

    return completer.future.timeout(timeout, onTimeout: () {
      _operationSub?.cancel();
      throw TimeoutException("Timeout while reading data");
    });
  }
}
