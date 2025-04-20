part of 'clock_cfg2_register.dart';

class _ClockCfg2Register implements ClockCfg2Register {
  _ClockCfg2Register(
    int value, [
    GetSetHook<int>? hook,
  ])  : _value = value,
        _hook = hook;

  static const int length = 32;

  static const int musk = ((0x01 << length) - 1);

  int _value = 0;

  final GetSetHook<int>? _hook;

  static const int _reserved0Bits = 2;

  static const int CLKOUT_SELBits = 1;

  static const int PRE_FRACDIV_SELBits = 1;

  static const int ADCCLK_M_CNTBits = 12;

  static const int ADCCLK_L_CNTBits = 12;

  static const int _reservedBits = 4;

  static const int _reserved0Offset = 0;

  static const int CLKOUT_SELOffset = 2;

  static const int PRE_FRACDIV_SELOffset = 3;

  static const int ADCCLK_M_CNTOffset = 4;

  static const int ADCCLK_L_CNTOffset = 16;

  static const int _reservedOffset = 28;

  static const int _reserved0Mask =
      ((0x01 << _reserved0Bits) - 1) << _reserved0Offset;

  static const int CLKOUT_SELMask =
      ((0x01 << CLKOUT_SELBits) - 1) << CLKOUT_SELOffset;

  static const int PRE_FRACDIV_SELMask =
      ((0x01 << PRE_FRACDIV_SELBits) - 1) << PRE_FRACDIV_SELOffset;

  static const int ADCCLK_M_CNTMask =
      ((0x01 << ADCCLK_M_CNTBits) - 1) << ADCCLK_M_CNTOffset;

  static const int ADCCLK_L_CNTMask =
      ((0x01 << ADCCLK_L_CNTBits) - 1) << ADCCLK_L_CNTOffset;

  static const int _reservedMask =
      ((0x01 << _reservedBits) - 1) << _reservedOffset;

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
  int get CLKOUT_SEL => ((value & CLKOUT_SELMask) >> CLKOUT_SELOffset);

  @override
  int get PRE_FRACDIV_SEL =>
      ((value & PRE_FRACDIV_SELMask) >> PRE_FRACDIV_SELOffset);

  @override
  int get ADCCLK_M_CNT => ((value & ADCCLK_M_CNTMask) >> ADCCLK_M_CNTOffset);

  @override
  int get ADCCLK_L_CNT => ((value & ADCCLK_L_CNTMask) >> ADCCLK_L_CNTOffset);

  @override
  int get _reserved => ((value & _reservedMask) >> _reservedOffset);

  @override
  set _reserved0(int v) => value =
      (value & ~_reserved0Mask) | ((v << _reserved0Offset) & _reserved0Mask);

  @override
  set CLKOUT_SEL(int v) => value =
      (value & ~CLKOUT_SELMask) | ((v << CLKOUT_SELOffset) & CLKOUT_SELMask);

  @override
  set PRE_FRACDIV_SEL(int v) => value = (value & ~PRE_FRACDIV_SELMask) |
      ((v << PRE_FRACDIV_SELOffset) & PRE_FRACDIV_SELMask);

  @override
  set ADCCLK_M_CNT(int v) => value = (value & ~ADCCLK_M_CNTMask) |
      ((v << ADCCLK_M_CNTOffset) & ADCCLK_M_CNTMask);

  @override
  set ADCCLK_L_CNT(int v) => value = (value & ~ADCCLK_L_CNTMask) |
      ((v << ADCCLK_L_CNTOffset) & ADCCLK_L_CNTMask);

  @override
  set _reserved(int v) => value =
      (value & ~_reservedMask) | ((v << _reservedOffset) & _reservedMask);
}
