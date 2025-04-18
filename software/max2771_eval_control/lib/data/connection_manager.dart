import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:rxdart/rxdart.dart';

class ConnectionManager {
  final _connectedPort = BehaviorSubject<SerialPort?>.seeded(null);
  final _readerSubject = PublishSubject<Uint8List>();

  SerialPortReader? _reader;
  StreamSubscription<Uint8List>? _readerSub;

  bool get isConnected => _connectedPort.value != null;

  Stream<List<String>> observeAvailablePorts() {
    return Rx.concat([
      Stream.value(SerialPort.availablePorts),
      Stream.periodic(const Duration(seconds: 1), (_) {
        return SerialPort.availablePorts;
      }),
    ]);
  }

  Stream<Uint8List> observeData() {
    return _readerSubject.stream;
  }

  Future<void> sendData(Uint8List data) async {
    if (_connectedPort.value == null) return;
    _connectedPort.value!.write(data, timeout: 8000);
  }

  Stream<String?> observeConnectedPort() {
    return _connectedPort.map((e) => e?.name);
  }

  Future<void> connect(String portName) async {
    if (_connectedPort.value != null) {
      await disconnect();
    }

    _connectedPort.add(SerialPort(portName));
    if (!_connectedPort.value!.openReadWrite()) {
      _connectedPort.value!.dispose();
      _connectedPort.add(null);
      throw Exception('Failed to open port: $portName');
    }

    _reader = SerialPortReader(_connectedPort.value!);
    _readerSub = _reader!.stream.listen((data) {
      _readerSubject.add(data);
      print('Received data: $data');
    });
  }

  Future<void> disconnect() async {
    if (_connectedPort.value == null) return;

    await _closeReader();
    _connectedPort.value!.close();
    _connectedPort.value!.dispose();
    _connectedPort.add(null);
  }

  Future<void> _closeReader() async {
    await _readerSub?.cancel();
    _readerSub = null;
    _reader?.close();
    _reader = null;
  }
}
