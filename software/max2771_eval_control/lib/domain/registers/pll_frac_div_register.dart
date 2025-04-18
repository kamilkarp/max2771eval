// ignore_for_file: non_constant_identifier_names
@BitFieldGen(runAfter: [BitFieldGen.addPartOfDirective])

import 'package:super_bit_field/super_bit_field.dart';

part 'pll_frac_div_register.g.dart';

/* PLL Fractional Division Ratio (0x05)
 *
 * Contains the 20-bit fractional divider (FDIV_PLLFRACDIV) which provides fine frequency resolution.
 */
@BitField(32)
class PLLFracDivRegister {
  @Bits(8)
  late int _reserved0; // bits 0–7 (reserved / unused)

  @Bits(20)
  late int FDIV; // bits 8–27

  @Bits(4)
  late int _reserved1; // bits 28–31 (reserved / unused)

  late int value;

  factory PLLFracDivRegister(int value, [GetSetHook<int> hook]) =
      _PLLFracDivRegister;
}
