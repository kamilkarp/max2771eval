part of 'conf2_register.dart';

class _Conf2Register implements Conf2Register {
  _Conf2Register(
    int value, [
    GetSetHook<int>? hook,
  ])  : _value = value,
        _hook = hook;

  static const int length = 32;

  static const int musk = ((0x01 << length) - 1);

  int _value = 0;

  final GetSetHook<int>? _hook;

  static const int DIEIDBits = 2;

  static const int _reserved0Bits = 2;

  static const int DRVCFGBits = 2;

  static const int BITSBits = 3;

  static const int FORMATBits = 2;

  static const int AGCMODEBits = 2;

  static const int SPI_SDIO_CONFIGBits = 2;

  static const int GAINREFBits = 12;

  static const int IQENBits = 1;

  static const int ANAIMONBits = 1;

  static const int _reservedBits = 3;

  static const int DIEIDOffset = 0;

  static const int _reserved0Offset = 2;

  static const int DRVCFGOffset = 4;

  static const int BITSOffset = 6;

  static const int FORMATOffset = 9;

  static const int AGCMODEOffset = 11;

  static const int SPI_SDIO_CONFIGOffset = 13;

  static const int GAINREFOffset = 15;

  static const int IQENOffset = 27;

  static const int ANAIMONOffset = 28;

  static const int _reservedOffset = 29;

  static const int DIEIDMask = ((0x01 << DIEIDBits) - 1) << DIEIDOffset;

  static const int _reserved0Mask =
      ((0x01 << _reserved0Bits) - 1) << _reserved0Offset;

  static const int DRVCFGMask = ((0x01 << DRVCFGBits) - 1) << DRVCFGOffset;

  static const int BITSMask = ((0x01 << BITSBits) - 1) << BITSOffset;

  static const int FORMATMask = ((0x01 << FORMATBits) - 1) << FORMATOffset;

  static const int AGCMODEMask = ((0x01 << AGCMODEBits) - 1) << AGCMODEOffset;

  static const int SPI_SDIO_CONFIGMask =
      ((0x01 << SPI_SDIO_CONFIGBits) - 1) << SPI_SDIO_CONFIGOffset;

  static const int GAINREFMask = ((0x01 << GAINREFBits) - 1) << GAINREFOffset;

  static const int IQENMask = ((0x01 << IQENBits) - 1) << IQENOffset;

  static const int ANAIMONMask = ((0x01 << ANAIMONBits) - 1) << ANAIMONOffset;

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
  int get DIEID => ((value & DIEIDMask) >> DIEIDOffset);

  @override
  int get _reserved0 => ((value & _reserved0Mask) >> _reserved0Offset);

  @override
  int get DRVCFG => ((value & DRVCFGMask) >> DRVCFGOffset);

  @override
  int get BITS => ((value & BITSMask) >> BITSOffset);

  @override
  int get FORMAT => ((value & FORMATMask) >> FORMATOffset);

  @override
  int get AGCMODE => ((value & AGCMODEMask) >> AGCMODEOffset);

  @override
  int get SPI_SDIO_CONFIG =>
      ((value & SPI_SDIO_CONFIGMask) >> SPI_SDIO_CONFIGOffset);

  @override
  int get GAINREF => ((value & GAINREFMask) >> GAINREFOffset);

  @override
  int get IQEN => ((value & IQENMask) >> IQENOffset);

  @override
  int get ANAIMON => ((value & ANAIMONMask) >> ANAIMONOffset);

  @override
  int get _reserved => ((value & _reservedMask) >> _reservedOffset);

  @override
  set DIEID(int v) =>
      value = (value & ~DIEIDMask) | ((v << DIEIDOffset) & DIEIDMask);

  @override
  set _reserved0(int v) => value =
      (value & ~_reserved0Mask) | ((v << _reserved0Offset) & _reserved0Mask);

  @override
  set DRVCFG(int v) =>
      value = (value & ~DRVCFGMask) | ((v << DRVCFGOffset) & DRVCFGMask);

  @override
  set BITS(int v) =>
      value = (value & ~BITSMask) | ((v << BITSOffset) & BITSMask);

  @override
  set FORMAT(int v) =>
      value = (value & ~FORMATMask) | ((v << FORMATOffset) & FORMATMask);

  @override
  set AGCMODE(int v) =>
      value = (value & ~AGCMODEMask) | ((v << AGCMODEOffset) & AGCMODEMask);

  @override
  set SPI_SDIO_CONFIG(int v) => value = (value & ~SPI_SDIO_CONFIGMask) |
      ((v << SPI_SDIO_CONFIGOffset) & SPI_SDIO_CONFIGMask);

  @override
  set GAINREF(int v) =>
      value = (value & ~GAINREFMask) | ((v << GAINREFOffset) & GAINREFMask);

  @override
  set IQEN(int v) =>
      value = (value & ~IQENMask) | ((v << IQENOffset) & IQENMask);

  @override
  set ANAIMON(int v) =>
      value = (value & ~ANAIMONMask) | ((v << ANAIMONOffset) & ANAIMONMask);

  @override
  set _reserved(int v) => value =
      (value & ~_reservedMask) | ((v << _reservedOffset) & _reservedMask);
}
