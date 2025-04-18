import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max2771_eval_control/data/connection_manager.dart';
import 'package:rxdart/rxdart.dart';

class ConnectionState {
  final List<String> availablePorts;
  final String? connectedPort;

  const ConnectionState({
    this.availablePorts = const [],
    this.connectedPort,
  });
}

class ConnectionCubit extends Cubit<ConnectionState> {
  ConnectionCubit({ConnectionManager? manager})
      : _connectionManager = manager ?? ConnectionManager(),
        super(ConnectionState()) {
    _init();
  }

  final ConnectionManager _connectionManager;
  late StreamSubscription _sub;

  @override
  Future<void> close() async {
    await _sub.cancel();
    super.close();
  }

  void _init() {
    _sub = Rx.combineLatest2(
            _connectionManager.observeConnectedPort(),
            _connectionManager.observeAvailablePorts(),
            (connectedPort, availablePorts) => ConnectionState(
                  connectedPort: connectedPort,
                  availablePorts: availablePorts,
                )) //
        .listen(emit, onError: (e, st) => addError(e, st));
  }

  Future<void> connect(String portName) async {
    await _connectionManager.connect(portName);
  }

  Future<void> disconnect() async {
    await _connectionManager.disconnect();
  }
}
