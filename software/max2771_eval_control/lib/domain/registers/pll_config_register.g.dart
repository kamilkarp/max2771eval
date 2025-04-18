part of 'pll_config_register.dart';

class _PLLConfigRegister implements PLLConfigRegister {
  _PLLConfigRegister(
    int value, [
    GetSetHook<int>? hook,
  ])  : _value = value,
        _hook = hook;

  static const int length = 32;

  static const int musk = ((0x01 << length) - 1);

  int _value = 0;

  final GetSetHook<int>? _hook;

  static const int PWRSAVBits = 1;

  static const int INT_PLLBits = 1;

  static const int _reserved0Bits = 5;

  static const int ICPBits = 1;

  static const int _reserved1Bits = 9;

  static const int IXTALBits = 2;

  static const int _reserved2Bits = 3;

  static const int REFOUTENBits = 1;

  static const int _reserved3Bits = 3;

  static const int LOBANDBits = 1;

  static const int REFDIVBits = 3;

  static const int PWRSAVOffset = 0;

  static const int INT_PLLOffset = 1;

  static const int _reserved0Offset = 2;

  static const int ICPOffset = 7;

  static const int _reserved1Offset = 8;

  static const int IXTALOffset = 17;

  static const int _reserved2Offset = 19;

  static const int REFOUTENOffset = 22;

  static const int _reserved3Offset = 23;

  static const int LOBANDOffset = 26;

  static const int REFDIVOffset = 27;

  static const int PWRSAVMask = ((0x01 << PWRSAVBits) - 1) << PWRSAVOffset;

  static const int INT_PLLMask = ((0x01 << INT_PLLBits) - 1) << INT_PLLOffset;

  static const int _reserved0Mask =
      ((0x01 << _reserved0Bits) - 1) << _reserved0Offset;

  static const int ICPMask = ((0x01 << ICPBits) - 1) << ICPOffset;

  static const int _reserved1Mask =
      ((0x01 << _reserved1Bits) - 1) << _reserved1Offset;

  static const int IXTALMask = ((0x01 << IXTALBits) - 1) << IXTALOffset;

  static const int _reserved2Mask =
      ((0x01 << _reserved2Bits) - 1) << _reserved2Offset;

  static const int REFOUTENMask =
      ((0x01 << REFOUTENBits) - 1) << REFOUTENOffset;

  static const int _reserved3Mask =
      ((0x01 << _reserved3Bits) - 1) << _reserved3Offset;

  static const int LOBANDMask = ((0x01 << LOBANDBits) - 1) << LOBANDOffset;

  static const int REFDIVMask = ((0x01 << REFDIVBits) - 1) << REFDIVOffset;

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
  int get PWRSAV => ((value & PWRSAVMask) >> PWRSAVOffset);

  @override
  int get INT_PLL => ((value & INT_PLLMask) >> INT_PLLOffset);

  @override
  int get _reserved0 => ((value & _reserved0Mask) >> _reserved0Offset);

  @override
  int get ICP => ((value & ICPMask) >> ICPOffset);

  @override
  int get _reserved1 => ((value & _reserved1Mask) >> _reserved1Offset);

  @override
  int get IXTAL => ((value & IXTALMask) >> IXTALOffset);

  @override
  int get _reserved2 => ((value & _reserved2Mask) >> _reserved2Offset);

  @override
  int get REFOUTEN => ((value & REFOUTENMask) >> REFOUTENOffset);

  @override
  int get _reserved3 => ((value & _reserved3Mask) >> _reserved3Offset);

  @override
  int get LOBAND => ((value & LOBANDMask) >> LOBANDOffset);

  @override
  int get REFDIV => ((value & REFDIVMask) >> REFDIVOffset);

  @override
  set PWRSAV(int v) =>
      value = (value & ~PWRSAVMask) | ((v << PWRSAVOffset) & PWRSAVMask);

  @override
  set INT_PLL(int v) =>
      value = (value & ~INT_PLLMask) | ((v << INT_PLLOffset) & INT_PLLMask);

  @override
  set _reserved0(int v) => value =
      (value & ~_reserved0Mask) | ((v << _reserved0Offset) & _reserved0Mask);

  @override
  set ICP(int v) => value = (value & ~ICPMask) | ((v << ICPOffset) & ICPMask);

  @override
  set _reserved1(int v) => value =
      (value & ~_reserved1Mask) | ((v << _reserved1Offset) & _reserved1Mask);

  @override
  set IXTAL(int v) =>
      value = (value & ~IXTALMask) | ((v << IXTALOffset) & IXTALMask);

  @override
  set _reserved2(int v) => value =
      (value & ~_reserved2Mask) | ((v << _reserved2Offset) & _reserved2Mask);

  @override
  set REFOUTEN(int v) =>
      value = (value & ~REFOUTENMask) | ((v << REFOUTENOffset) & REFOUTENMask);

  @override
  set _reserved3(int v) => value =
      (value & ~_reserved3Mask) | ((v << _reserved3Offset) & _reserved3Mask);

  @override
  set LOBAND(int v) =>
      value = (value & ~LOBANDMask) | ((v << LOBANDOffset) & LOBANDMask);

  @override
  set REFDIV(int v) =>
      value = (value & ~REFDIVMask) | ((v << REFDIVOffset) & REFDIVMask);
}
