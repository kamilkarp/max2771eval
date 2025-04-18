// ignore_for_file: non_constant_identifier_names

@BitFieldGen(runAfter: [BitFieldGen.addPartOfDirective])

import 'package:super_bit_field/super_bit_field.dart';

part 'conf2_register.g.dart';

/* Configuration 2 Register (0x01)
 *
 * This register configures AGC functions and ADC output.
 *
 * ANAIMON_CONF2 (bit 28):
 *   - Analog monitoring enable: routes analog I output to a dedicated pin when set.
 *
 * IQEN_CONF2 (bit 27):
 *   - IQ channel enable: 0 for I-channel only; 1 for both I and Q channel outputs.
 *
 * GAINREF_CONF2 (bits 26-15):
 *   - AGC gain reference value (12-bit field) that sets the target gain level.
 *
 * SPI_SDIO_CONFIG_CONF2 (bits 14-13):
 *   - SPI SDIO configuration.
 *     0x0: No pull configuration.
 *     0x1: Pull-down resistor.
 *     0x2: Pull-up resistor.
 *     0x3: Bus-hold configuration.
 *
 * AGCMODE_CONF2 (bits 12-11):
 *   - AGC mode selection.
 *     0x0: Independent operation for I and Q channels.
 *     0x2: Gain set via host programming (GAININ bits); other values are reserved.
 *
 * FORMAT_CONF2 (bits 10-9):
 *   - ADC output data format.
 *     0x0: Unsigned binary.
 *     0x1: Sign-magnitude.
 *     0x2/0x3: Two’s complement.
 *
 * BITS_CONF2 (bits 8-6):
 *   - ADC output bit width.
 *     Allowed values: 1, 2, or 3 bits.
 *
 * DRVCFG_CONF2 (bits 5-4):
 *   - Output driver configuration.
 *     0x0: CMOS logic levels.
 *     0x2 or 0x3: Analog output in ADC bypass mode.
 *
 * DIEID_CONF2 (bits 1-0):
 *   - Die ID, used to identify the version of the chip.
 */
@BitField(32)
class Conf2Register {
  @Bits(2)
  late int DIEID; // bits 0–1

  @Bits(2)
  late int DRVCFG; // bits 4–5

  @Bits(3)
  late int BITS; // bits 6–8

  @Bits(2)
  late int FORMAT; // bits 9–10

  @Bits(2)
  late int AGCMODE; // bits 11–12

  @Bits(2)
  late int SPI_SDIO_CONFIG; // bits 13–14

  @Bits(12)
  late int GAINREF; // bits 15–26

  @Bits(1)
  late int IQEN; // bit 27

  @Bits(1)
  late int ANAIMON; // bit 28

  @Bits(3)
  late int _reserved; // bits 29–31 (not used)

  late int value;

  factory Conf2Register(int value, [GetSetHook<int> hook]) = _Conf2Register;
}
