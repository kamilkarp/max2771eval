part of 'conf3_register.dart';

class _Conf3Register implements Conf3Register {
  _Conf3Register(
    int value, [
    GetSetHook<int>? hook,
  ])  : _value = value,
        _hook = hook;

  static const int length = 32;

  static const int musk = ((0x01 << length) - 1);

  int _value = 0;

  final GetSetHook<int>? _hook;

  static const int STRMRSTBits = 1;

  static const int DATA_SYNCENBits = 1;

  static const int TIME_SYNCENBits = 1;

  static const int STAMPENBits = 1;

  static const int STRMBITSBits = 2;

  static const int STRMSTOPBits = 1;

  static const int STRMSTARTBits = 1;

  static const int STRMENBits = 1;

  static const int PGAQENBits = 1;

  static const int PGAIENBits = 1;

  static const int _reserved0Bits = 1;

  static const int FHIPENBits = 1;

  static const int _reserved1Bits = 4;

  static const int HILOADENBits = 1;

  static const int _reserved2Bits = 2;

  static const int GAININBits = 6;

  static const int _reserved3Bits = 4;

  static const int STRMRSTOffset = 0;

  static const int DATA_SYNCENOffset = 1;

  static const int TIME_SYNCENOffset = 2;

  static const int STAMPENOffset = 3;

  static const int STRMBITSOffset = 4;

  static const int STRMSTOPOffset = 6;

  static const int STRMSTARTOffset = 7;

  static const int STRMENOffset = 8;

  static const int PGAQENOffset = 9;

  static const int PGAIENOffset = 10;

  static const int _reserved0Offset = 11;

  static const int FHIPENOffset = 12;

  static const int _reserved1Offset = 13;

  static const int HILOADENOffset = 17;

  static const int _reserved2Offset = 18;

  static const int GAININOffset = 20;

  static const int _reserved3Offset = 26;

  static const int STRMRSTMask = ((0x01 << STRMRSTBits) - 1) << STRMRSTOffset;

  static const int DATA_SYNCENMask =
      ((0x01 << DATA_SYNCENBits) - 1) << DATA_SYNCENOffset;

  static const int TIME_SYNCENMask =
      ((0x01 << TIME_SYNCENBits) - 1) << TIME_SYNCENOffset;

  static const int STAMPENMask = ((0x01 << STAMPENBits) - 1) << STAMPENOffset;

  static const int STRMBITSMask =
      ((0x01 << STRMBITSBits) - 1) << STRMBITSOffset;

  static const int STRMSTOPMask =
      ((0x01 << STRMSTOPBits) - 1) << STRMSTOPOffset;

  static const int STRMSTARTMask =
      ((0x01 << STRMSTARTBits) - 1) << STRMSTARTOffset;

  static const int STRMENMask = ((0x01 << STRMENBits) - 1) << STRMENOffset;

  static const int PGAQENMask = ((0x01 << PGAQENBits) - 1) << PGAQENOffset;

  static const int PGAIENMask = ((0x01 << PGAIENBits) - 1) << PGAIENOffset;

  static const int _reserved0Mask =
      ((0x01 << _reserved0Bits) - 1) << _reserved0Offset;

  static const int FHIPENMask = ((0x01 << FHIPENBits) - 1) << FHIPENOffset;

  static const int _reserved1Mask =
      ((0x01 << _reserved1Bits) - 1) << _reserved1Offset;

  static const int HILOADENMask =
      ((0x01 << HILOADENBits) - 1) << HILOADENOffset;

  static const int _reserved2Mask =
      ((0x01 << _reserved2Bits) - 1) << _reserved2Offset;

  static const int GAININMask = ((0x01 << GAININBits) - 1) << GAININOffset;

  static const int _reserved3Mask =
      ((0x01 << _reserved3Bits) - 1) << _reserved3Offset;

  @override
  int get value {
    if (_hook != null && _hook.onGet != null) {
      _value = _hook.onGet!() & musk;
    }
    return _value & musk;
  }

  @override
  set value(value) {
    _value = value & musk;
    if (_hook != null && _hook.onSet != null) {
      _hook.onSet!(_value);
    }
  }

  @override
  int get STRMRST => ((value & STRMRSTMask) >> STRMRSTOffset);

  @override
  int get DATA_SYNCEN => ((value & DATA_SYNCENMask) >> DATA_SYNCENOffset);

  @override
  int get TIME_SYNCEN => ((value & TIME_SYNCENMask) >> TIME_SYNCENOffset);

  @override
  int get STAMPEN => ((value & STAMPENMask) >> STAMPENOffset);

  @override
  int get STRMBITS => ((value & STRMBITSMask) >> STRMBITSOffset);

  @override
  int get STRMSTOP => ((value & STRMSTOPMask) >> STRMSTOPOffset);

  @override
  int get STRMSTART => ((value & STRMSTARTMask) >> STRMSTARTOffset);

  @override
  int get STRMEN => ((value & STRMENMask) >> STRMENOffset);

  @override
  int get PGAQEN => ((value & PGAQENMask) >> PGAQENOffset);

  @override
  int get PGAIEN => ((value & PGAIENMask) >> PGAIENOffset);

  @override
  int get _reserved0 => ((value & _reserved0Mask) >> _reserved0Offset);

  @override
  int get FHIPEN => ((value & FHIPENMask) >> FHIPENOffset);

  @override
  int get _reserved1 => ((value & _reserved1Mask) >> _reserved1Offset);

  @override
  int get HILOADEN => ((value & HILOADENMask) >> HILOADENOffset);

  @override
  int get _reserved2 => ((value & _reserved2Mask) >> _reserved2Offset);

  @override
  int get GAININ => ((value & GAININMask) >> GAININOffset);

  @override
  int get _reserved3 => ((value & _reserved3Mask) >> _reserved3Offset);

  @override
  set STRMRST(int v) =>
      value = (value & ~STRMRSTMask) | ((v << STRMRSTOffset) & STRMRSTMask);

  @override
  set DATA_SYNCEN(int v) => value =
      (value & ~DATA_SYNCENMask) | ((v << DATA_SYNCENOffset) & DATA_SYNCENMask);

  @override
  set TIME_SYNCEN(int v) => value =
      (value & ~TIME_SYNCENMask) | ((v << TIME_SYNCENOffset) & TIME_SYNCENMask);

  @override
  set STAMPEN(int v) =>
      value = (value & ~STAMPENMask) | ((v << STAMPENOffset) & STAMPENMask);

  @override
  set STRMBITS(int v) =>
      value = (value & ~STRMBITSMask) | ((v << STRMBITSOffset) & STRMBITSMask);

  @override
  set STRMSTOP(int v) =>
      value = (value & ~STRMSTOPMask) | ((v << STRMSTOPOffset) & STRMSTOPMask);

  @override
  set STRMSTART(int v) => value =
      (value & ~STRMSTARTMask) | ((v << STRMSTARTOffset) & STRMSTARTMask);

  @override
  set STRMEN(int v) =>
      value = (value & ~STRMENMask) | ((v << STRMENOffset) & STRMENMask);

  @override
  set PGAQEN(int v) =>
      value = (value & ~PGAQENMask) | ((v << PGAQENOffset) & PGAQENMask);

  @override
  set PGAIEN(int v) =>
      value = (value & ~PGAIENMask) | ((v << PGAIENOffset) & PGAIENMask);

  @override
  set _reserved0(int v) => value =
      (value & ~_reserved0Mask) | ((v << _reserved0Offset) & _reserved0Mask);

  @override
  set FHIPEN(int v) =>
      value = (value & ~FHIPENMask) | ((v << FHIPENOffset) & FHIPENMask);

  @override
  set _reserved1(int v) => value =
      (value & ~_reserved1Mask) | ((v << _reserved1Offset) & _reserved1Mask);

  @override
  set HILOADEN(int v) =>
      value = (value & ~HILOADENMask) | ((v << HILOADENOffset) & HILOADENMask);

  @override
  set _reserved2(int v) => value =
      (value & ~_reserved2Mask) | ((v << _reserved2Offset) & _reserved2Mask);

  @override
  set GAININ(int v) =>
      value = (value & ~GAININMask) | ((v << GAININOffset) & GAININMask);

  @override
  set _reserved3(int v) => value =
      (value & ~_reserved3Mask) | ((v << _reserved3Offset) & _reserved3Mask);
}
