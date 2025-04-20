part of 'pll_int_div_register.dart';

class _PLLIntDivRegister implements PLLIntDivRegister {
  _PLLIntDivRegister(
    int value, [
    GetSetHook<int>? hook,
  ])  : _value = value,
        _hook = hook;

  static const int length = 32;

  static const int musk = ((0x01 << length) - 1);

  int _value = 0;

  final GetSetHook<int>? _hook;

  static const int _reserved0Bits = 3;

  static const int RDIVBits = 10;

  static const int NDIVBits = 15;

  static const int _reserved1Bits = 4;

  static const int _reserved0Offset = 0;

  static const int RDIVOffset = 3;

  static const int NDIVOffset = 13;

  static const int _reserved1Offset = 28;

  static const int _reserved0Mask =
      ((0x01 << _reserved0Bits) - 1) << _reserved0Offset;

  static const int RDIVMask = ((0x01 << RDIVBits) - 1) << RDIVOffset;

  static const int NDIVMask = ((0x01 << NDIVBits) - 1) << NDIVOffset;

  static const int _reserved1Mask =
      ((0x01 << _reserved1Bits) - 1) << _reserved1Offset;

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
  int get _reserved0 => ((value & _reserved0Mask) >> _reserved0Offset);

  @override
  int get RDIV => ((value & RDIVMask) >> RDIVOffset);

  @override
  int get NDIV => ((value & NDIVMask) >> NDIVOffset);

  @override
  int get _reserved1 => ((value & _reserved1Mask) >> _reserved1Offset);

  @override
  set _reserved0(int v) => value =
      (value & ~_reserved0Mask) | ((v << _reserved0Offset) & _reserved0Mask);

  @override
  set RDIV(int v) =>
      value = (value & ~RDIVMask) | ((v << RDIVOffset) & RDIVMask);

  @override
  set NDIV(int v) =>
      value = (value & ~NDIVMask) | ((v << NDIVOffset) & NDIVMask);

  @override
  set _reserved1(int v) => value =
      (value & ~_reserved1Mask) | ((v << _reserved1Offset) & _reserved1Mask);
}
