// ignore_for_file: non_constant_identifier_names
@BitFieldGen(runAfter: [BitFieldGen.addPartOfDirective])

import 'package:super_bit_field/super_bit_field.dart';

part 'clock_cfg1_register.g.dart';

/* Clock Configuration 1 (0x07)
 *
 * Controls ADC and system clocking.
 *
 * REFCLK_L_CNT_CLKCFG1 (bits 27-16):
 *   - 12-bit counter for the reference clock (low counter).
 *
 * REFCLK_M_CNT_CLKCFG1 (bits 15-4):
 *   - 12-bit counter for the reference clock (mid counter).
 *
 * EXTADCCLK_CLKCFG1 (bit 28):
 *   - If set to 1, the ADC clock is sourced externally via the ADC_CLKIN pin.
 *
 * FCLKIN_CLKCFG1 (bit 3):
 *   - FCLKIN source selection.
 *
 * ADCCLK_CLKCFG1 (bit 2):
 *   - ADC clock selection.
 *
 * MODE_CLKCFG1 (bit 0):
 *   - Operating mode for clock configuration.
 */
@BitField(32)
class ClockCfg1Register {
  @Bits(1)
  late int MODE; // bit 0

  @Bits(1)
  late int _reserved0; // bit 1 (reserved / unused)

  @Bits(1)
  late int ADCCLK; // bit 2

  @Bits(1)
  late int FCLKIN; // bit 3

  @Bits(12)
  late int REFCLK_M_CNT; // bits 4–15

  @Bits(12)
  late int REFCLK_L_CNT; // bits 16–27

  @Bits(1)
  late int EXTADCCLK; // bit 28

  @Bits(3)
  late int _reserved1; // bits 29–31 (reserved / unused)

  late int value;

  factory ClockCfg1Register(int value, [GetSetHook<int> hook]) =
      _ClockCfg1Register;
}
