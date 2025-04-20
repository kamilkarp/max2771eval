// ignore_for_file: non_constant_identifier_names
@BitFieldGen(runAfter: [BitFieldGen.addPartOfDirective])

import 'package:super_bit_field/super_bit_field.dart';

part 'pll_int_div_register.g.dart';

/* PLL Integer Division Ratio (0x04)
 *
 * Contains:
 *   NDIV_PLLINTDIV (bits 31-17): 15-bit integer divider.
 *   RDIV_PLLINTDIV (bits 12-3): 10-bit reference divider.
 */
@BitField(32)
class PLLIntDivRegister {
  @Bits(3)
  late int _reserved0; // bits 0–2 (reserved / unused)

  @Bits(10)
  late int RDIV; // bits 3–12

  @Bits(15)
  late int NDIV; // bits 12–27

  @Bits(4)
  late int _reserved1; // bits 28–31 (reserved / unused)

  late int value;

  factory PLLIntDivRegister(int value, [GetSetHook<int> hook]) =
      _PLLIntDivRegister;
}
