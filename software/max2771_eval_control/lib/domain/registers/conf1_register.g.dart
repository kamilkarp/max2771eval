part of 'conf1_register.dart';

class _Conf1Register implements Conf1Register {
  _Conf1Register(
    int value, [
    GetSetHook<int>? hook,
  ])  : _value = value,
        _hook = hook;

  static const int length = 32;

  static const int musk = ((0x01 << length) - 1);

  int _value = 0;

  final GetSetHook<int>? _hook;

  static const int FGAINBits = 1;

  static const int FCENXBits = 1;

  static const int F3OR5Bits = 1;

  static const int FBWBits = 3;

  static const int FCENBits = 7;

  static const int MIXERMODEBits = 2;

  static const int LNAMODEBits = 2;

  static const int MIXPOLEBits = 1;

  static const int _reservedBits = 12;

  static const int IDLEBits = 1;

  static const int CHIPENBits = 1;

  static const int FGAINOffset = 0;

  static const int FCENXOffset = 1;

  static const int F3OR5Offset = 2;

  static const int FBWOffset = 3;

  static const int FCENOffset = 6;

  static const int MIXERMODEOffset = 13;

  static const int LNAMODEOffset = 15;

  static const int MIXPOLEOffset = 17;

  static const int _reservedOffset = 18;

  static const int IDLEOffset = 30;

  static const int CHIPENOffset = 31;

  static const int FGAINMask = ((0x01 << FGAINBits) - 1) << FGAINOffset;

  static const int FCENXMask = ((0x01 << FCENXBits) - 1) << FCENXOffset;

  static const int F3OR5Mask = ((0x01 << F3OR5Bits) - 1) << F3OR5Offset;

  static const int FBWMask = ((0x01 << FBWBits) - 1) << FBWOffset;

  static const int FCENMask = ((0x01 << FCENBits) - 1) << FCENOffset;

  static const int MIXERMODEMask =
      ((0x01 << MIXERMODEBits) - 1) << MIXERMODEOffset;

  static const int LNAMODEMask = ((0x01 << LNAMODEBits) - 1) << LNAMODEOffset;

  static const int MIXPOLEMask = ((0x01 << MIXPOLEBits) - 1) << MIXPOLEOffset;

  static const int _reservedMask =
      ((0x01 << _reservedBits) - 1) << _reservedOffset;

  static const int IDLEMask = ((0x01 << IDLEBits) - 1) << IDLEOffset;

  static const int CHIPENMask = ((0x01 << CHIPENBits) - 1) << CHIPENOffset;

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
  int get FGAIN => ((value & FGAINMask) >> FGAINOffset);

  @override
  int get FCENX => ((value & FCENXMask) >> FCENXOffset);

  @override
  int get F3OR5 => ((value & F3OR5Mask) >> F3OR5Offset);

  @override
  int get FBW => ((value & FBWMask) >> FBWOffset);

  @override
  int get FCEN => ((value & FCENMask) >> FCENOffset);

  @override
  int get MIXERMODE => ((value & MIXERMODEMask) >> MIXERMODEOffset);

  @override
  int get LNAMODE => ((value & LNAMODEMask) >> LNAMODEOffset);

  @override
  int get MIXPOLE => ((value & MIXPOLEMask) >> MIXPOLEOffset);

  @override
  int get _reserved => ((value & _reservedMask) >> _reservedOffset);

  @override
  int get IDLE => ((value & IDLEMask) >> IDLEOffset);

  @override
  int get CHIPEN => ((value & CHIPENMask) >> CHIPENOffset);

  @override
  set FGAIN(int v) =>
      value = (value & ~FGAINMask) | ((v << FGAINOffset) & FGAINMask);

  @override
  set FCENX(int v) =>
      value = (value & ~FCENXMask) | ((v << FCENXOffset) & FCENXMask);

  @override
  set F3OR5(int v) =>
      value = (value & ~F3OR5Mask) | ((v << F3OR5Offset) & F3OR5Mask);

  @override
  set FBW(int v) => value = (value & ~FBWMask) | ((v << FBWOffset) & FBWMask);

  @override
  set FCEN(int v) =>
      value = (value & ~FCENMask) | ((v << FCENOffset) & FCENMask);

  @override
  set MIXERMODE(int v) => value =
      (value & ~MIXERMODEMask) | ((v << MIXERMODEOffset) & MIXERMODEMask);

  @override
  set LNAMODE(int v) =>
      value = (value & ~LNAMODEMask) | ((v << LNAMODEOffset) & LNAMODEMask);

  @override
  set MIXPOLE(int v) =>
      value = (value & ~MIXPOLEMask) | ((v << MIXPOLEOffset) & MIXPOLEMask);

  @override
  set _reserved(int v) => value =
      (value & ~_reservedMask) | ((v << _reservedOffset) & _reservedMask);

  @override
  set IDLE(int v) =>
      value = (value & ~IDLEMask) | ((v << IDLEOffset) & IDLEMask);

  @override
  set CHIPEN(int v) =>
      value = (value & ~CHIPENMask) | ((v << CHIPENOffset) & CHIPENMask);
}
