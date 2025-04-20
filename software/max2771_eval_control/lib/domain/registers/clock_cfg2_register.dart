// ignore_for_file: non_constant_identifier_names
@BitFieldGen(runAfter: [BitFieldGen.addPartOfDirective])

import 'package:super_bit_field/super_bit_field.dart';

part 'clock_cfg2_register.g.dart';

/* Clock Configuration 2 (0x0A)
 *
 * Further controls ADC clock division.
 *
 * ADCCLK_L_CNT_CLKCFG2 (bits 27-16):
 *   - 12-bit counter (L counter) for ADC clock divider.
 *
 * ADCCLK_M_CNT_CLKCFG2 (bits 15-4):
 *   - 12-bit counter (M counter) for ADC clock divider.
 *
 * PRE_FRACDIV_SEL_CLKCFG2 (bit 3):
 *   - Fractional divider select. 0: bypass; 1: enable.
 *
 * CLKOUT_SEL_CLKCFG2 (bit 2):
 *   - Clock output selection.
 */
@BitField(32)
class ClockCfg2Register {
  @Bits(2)
  late int _reserved0; // bits 0–1 (reserved / unused)

  @Bits(1)
  late int CLKOUT_SEL; // bit 2

  @Bits(1)
  late int PRE_FRACDIV_SEL; // bit 3

  @Bits(12)
  late int ADCCLK_M_CNT; // bits 4–15

  @Bits(12)
  late int ADCCLK_L_CNT; // bits 16–27

  @Bits(4)
  late int _reserved; // bits 28–31 (reserved / unused)

  late int value;

  factory ClockCfg2Register(int value, [GetSetHook<int> hook]) =
      _ClockCfg2Register;
}
