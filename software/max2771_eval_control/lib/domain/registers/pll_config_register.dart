// ignore_for_file: non_constant_identifier_names
@BitFieldGen(runAfter: [BitFieldGen.addPartOfDirective])

import 'package:super_bit_field/super_bit_field.dart';

part 'pll_config_register.g.dart';

/* PLL Configuration Register (0x03)
 *
 * Configures PLL and clock functions.
 *
 * REFDIV_PLLCFG (bits 31-29):
 *   - Reference divider (3-bit field) for setting up the PLL.
 *
 * LOBAND_PLLCFG (bit 28):
 *   - LO band selection: 0 for L1 band, 1 for L2/L5 band.
 *
 * REFOUTEN_PLLCFG (bit 24):
 *   - Reference output enable; 0: disable, 1: enable.
 *
 * IXTAL_PLLCFG (bits 19-18):
 *   - XTAL configuration; adjusts divider/multiplier for the crystal oscillator.
 *
 * ICP_PLLCFG (bit 9):
 *   - Charge pump current select; typically 0 for 0.5 mA and 1 for 1 mA.
 *
 * INT_PLL_PLLCFG (bit 3):
 *   - Internal PLL configuration for fine tuning.
 *
 * PWRSAV_PLLCFG (bit 2):
 *   - Power saving mode for the PLL; enables reduced power consumption when active.
 */
@BitField(32)
class PLLConfigRegister {
  @Bits(1)
  late int PWRSAV; // bit 2

  @Bits(1)
  late int INT_PLL; // bit 3

  @Bits(5)
  late int _reserved0; // bits 4–8 (reserved / unused)

  @Bits(1)
  late int ICP; // bit 9

  @Bits(9)
  late int _reserved1; // bits 10–18 (reserved / unused)

  @Bits(2)
  late int IXTAL; // bits 19–20

  @Bits(3)
  late int _reserved2; // bits 21–23 (reserved / unused)

  @Bits(1)
  late int REFOUTEN; // bit 24

  @Bits(3)
  late int _reserved3; // bits 25–27 (reserved / unused)

  @Bits(1)
  late int LOBAND; // bit 28

  @Bits(3)
  late int REFDIV; // bits 29–31

  late int value;

  factory PLLConfigRegister(int value, [GetSetHook<int> hook]) =
      _PLLConfigRegister;
}
