// ignore_for_file: non_constant_identifier_names

@BitFieldGen(runAfter: [BitFieldGen.addPartOfDirective])

import 'package:super_bit_field/super_bit_field.dart';

part 'conf1_register.g.dart';

/* Configuration 1 Register (0x00)
 *
 * This register configures key RF and IF sections.
 *
 * CHIPEN_CONF1 (bit 31):
 *   - Chip enable. 0: disable chip (except serial bus activity), 1: enable chip.
 *
 * IDLE_CONF1 (bit 30):
 *   - Idle mode enable. 0: normal operation, 1: idle mode.
 *
 * MIXPOLE_CONF1 (bit 17):
 *   - Mixer pole selection. 0: uses a 13MHz filter pole, 1: uses a 36MHz filter pole.
 *
 * LNAMODE_CONF1 (bits 15-14):
 *   - LNA mode selection.
 *     0x0: High band LNA active (L1 band).
 *     0x1: Low band LNA active (L2/L5 band).
 *     0x2: Both LNAs disabled.
 *     0x3: Reserved.
 *
 * MIXERMODE_CONF1 (bits 13-12):
 *   - Mixer mode selection.
 *     0x0: High band mixer enabled.
 *     0x1: Low band mixer enabled.
 *     0x2: Both mixers disabled.
 *     0x3: Reserved.
 *
 * FCEN_CONF1 (bits 12-6):
 *   - IF filter center frequency setting (7-bit value).
 *     Determines the center frequency of the complex bandpass filter when FCENX is 1.
 *
 * FBW_CONF1 (bits 5-3):
 *   - IF filter bandwidth selection.
 *     Selects one of the predefined bandwidths (e.g., 2.5MHz, 4.2MHz, 8.7MHz, 16.4MHz, 23.4MHz, 36MHz).
 *
 * F3OR5_CONF1 (bit 2):
 *   - Filter order selection.
 *     0: 5th order filter (steeper rejection).
 *     1: 3rd order filter (lower group delay).
 *
 * FCENX_CONF1 (bit 1):
 *   - Filter type selection.
 *     0: Lowpass filter mode (ignores FCEN).
 *     1: Complex bandpass filter mode (uses FCEN for center frequency).
 *
 * FGAIN_CONF1 (bit 0):
 *   - IF filter gain selection.
 *     0: Reduced gain (approximately 6dB less).
 *     1: Normal gain.
 *
 */
@BitField(32)
class Conf1Register {
  @Bits(1)
  late int FGAIN; // bit 0

  @Bits(1)
  late int FCENX; // bit 1

  @Bits(1)
  late int F3OR5; // bit 2

  @Bits(3)
  late int FBW; // bits 3–5

  @Bits(7)
  late int FCEN; // bits 6–12

  @Bits(2)
  late int MIXERMODE; // bits 13–14

  @Bits(2)
  late int LNAMODE; // bits 15–16

  @Bits(1)
  late int MIXPOLE; // bit 17

  @Bits(12)
  late int _reserved; // bits 18–29 (not used/reserved)

  @Bits(1)
  late int IDLE; // bit 30

  @Bits(1)
  late int CHIPEN; // bit 31

  late int value;

  factory Conf1Register(int value, [GetSetHook<int> hook]) = _Conf1Register;
}
