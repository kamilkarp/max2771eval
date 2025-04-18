part of 'clock_cfg1_register.dart';

class _ClockCfg1Register implements ClockCfg1Register {
  _ClockCfg1Register(
    int value, [
    GetSetHook<int>? hook,
  ])  : _value = value,
        _hook = hook;

  static const int length = 32;

  static const int musk = ((0x01 << length) - 1);

  int _value = 0;

  final GetSetHook<int>? _hook;

  static const int MODEBits = 1;

  static const int _reserved0Bits = 1;

  static const int ADCCLKBits = 1;

  static const int FCLKINBits = 1;

  static const int REFCLK_M_CNTBits = 12;

  static const int REFCLK_L_CNTBits = 12;

  static const int EXTADCCLKBits = 1;

  static const int _reserved1Bits = 3;

  static const int MODEOffset = 0;

  static const int _reserved0Offset = 1;

  static const int ADCCLKOffset = 2;

  static const int FCLKINOffset = 3;

  static const int REFCLK_M_CNTOffset = 4;

  static const int REFCLK_L_CNTOffset = 16;

  static const int EXTADCCLKOffset = 28;

  static const int _reserved1Offset = 29;

  static const int MODEMask = ((0x01 << MODEBits) - 1) << MODEOffset;

  static const int _reserved0Mask =
      ((0x01 << _reserved0Bits) - 1) << _reserved0Offset;

  static const int ADCCLKMask = ((0x01 << ADCCLKBits) - 1) << ADCCLKOffset;

  static const int FCLKINMask = ((0x01 << FCLKINBits) - 1) << FCLKINOffset;

  static const int REFCLK_M_CNTMask =
      ((0x01 << REFCLK_M_CNTBits) - 1) << REFCLK_M_CNTOffset;

  static const int REFCLK_L_CNTMask =
      ((0x01 << REFCLK_L_CNTBits) - 1) << REFCLK_L_CNTOffset;

  static const int EXTADCCLKMask =
      ((0x01 << EXTADCCLKBits) - 1) << EXTADCCLKOffset;

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
  int get MODE => ((value & MODEMask) >> MODEOffset);

  @override
  int get _reserved0 => ((value & _reserved0Mask) >> _reserved0Offset);

  @override
  int get ADCCLK => ((value & ADCCLKMask) >> ADCCLKOffset);

  @override
  int get FCLKIN => ((value & FCLKINMask) >> FCLKINOffset);

  @override
  int get REFCLK_M_CNT => ((value & REFCLK_M_CNTMask) >> REFCLK_M_CNTOffset);

  @override
  int get REFCLK_L_CNT => ((value & REFCLK_L_CNTMask) >> REFCLK_L_CNTOffset);

  @override
  int get EXTADCCLK => ((value & EXTADCCLKMask) >> EXTADCCLKOffset);

  @override
  int get _reserved1 => ((value & _reserved1Mask) >> _reserved1Offset);

  @override
  set MODE(int v) =>
      value = (value & ~MODEMask) | ((v << MODEOffset) & MODEMask);

  @override
  set _reserved0(int v) => value =
      (value & ~_reserved0Mask) | ((v << _reserved0Offset) & _reserved0Mask);

  @override
  set ADCCLK(int v) =>
      value = (value & ~ADCCLKMask) | ((v << ADCCLKOffset) & ADCCLKMask);

  @override
  set FCLKIN(int v) =>
      value = (value & ~FCLKINMask) | ((v << FCLKINOffset) & FCLKINMask);

  @override
  set REFCLK_M_CNT(int v) => value = (value & ~REFCLK_M_CNTMask) |
      ((v << REFCLK_M_CNTOffset) & REFCLK_M_CNTMask);

  @override
  set REFCLK_L_CNT(int v) => value = (value & ~REFCLK_L_CNTMask) |
      ((v << REFCLK_L_CNTOffset) & REFCLK_L_CNTMask);

  @override
  set EXTADCCLK(int v) => value =
      (value & ~EXTADCCLKMask) | ((v << EXTADCCLKOffset) & EXTADCCLKMask);

  @override
  set _reserved1(int v) => value =
      (value & ~_reserved1Mask) | ((v << _reserved1Offset) & _reserved1Mask);
}
