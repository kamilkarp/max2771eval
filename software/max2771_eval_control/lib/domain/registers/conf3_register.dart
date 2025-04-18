// ignore_for_file: non_constant_identifier_names
@BitFieldGen(runAfter: [BitFieldGen.addPartOfDirective])

import 'package:super_bit_field/super_bit_field.dart';

part 'conf3_register.g.dart';

/* Configuration 3 Register (0x02)
 *
 * This register sets the parameters for the PGA and streaming interface.
 *
 * GAININ_CONF3 (bits 31-26):
 *   - Programmable gain for the front-end PGA (~1dB per LSB).
 *
 * HILOADEN_CONF3 (bit 20):
 *   - High load enable for the output driver.
 *     0: disabled; 1: enabled (useful for heavy load conditions).
 *
 * FHIPEN_CONF3 (bit 15):
 *   - High-pass coupling enable: 0 to disable the HP filter, 1 to enable it.
 *
 * PGAIEN_CONF3 (bit 13):
 *   - Enable the I-channel PGA.
 *
 * PGAQEN_CONF3 (bit 12):
 *   - Enable the Q-channel PGA.
 *
 * STRMEN_CONF3 (bit 11):
 *   - DSP interface/streaming enable.
 *
 * STRMSTART_CONF3 (bit 10):
 *   - Streaming start command; rising edge triggers start of data streaming.
 *
 * STRMSTOP_CONF3 (bit 9):
 *   - Streaming stop command; rising edge stops data streaming.
 *
 * STRMBITS_CONF3 (bits 5-4):
 *   - Selects the number of bits from the ADC data to be streamed.
 *
 * STAMPEN_CONF3 (bit 3):
 *   - Frame stamping enable; when set, a frame counter is inserted into the data stream.
 *
 * TIME_SYNCEN_CONF3 (bit 2):
 *   - Time synchronization pulse enable.
 *     0: sync pulses during active streaming only; 1: continuous output.
 *
 * DATA_SYNCEN_CONF3 (bit 1):
 *   - Data synchronization pulse enable; triggers a sync pulse at each data word.
 *
 * STRMRST_CONF3 (bit 0):
 *   - Streaming reset; resets streaming counters when asserted.
 */
@BitField(32)
class Conf3Register {
  @Bits(1)
  late int STRMRST; // bit 0

  @Bits(1)
  late int DATA_SYNCEN; // bit 1

  @Bits(1)
  late int TIME_SYNCEN; // bit 2

  @Bits(1)
  late int STAMPEN; // bit 3

  @Bits(2)
  late int STRMBITS; // bits 4–5

  @Bits(1)
  late int STRMSTOP; // bit 9

  @Bits(1)
  late int STRMSTART; // bit 10

  @Bits(1)
  late int STRMEN; // bit 11

  @Bits(1)
  late int PGAQEN; // bit 12

  @Bits(1)
  late int PGAIEN; // bit 13

  @Bits(1)
  late int _reserved0; // bit 14 (reserved / unused)

  @Bits(1)
  late int FHIPEN; // bit 15

  @Bits(4)
  late int _reserved1; // bits 16–19 (reserved / unused)

  @Bits(1)
  late int HILOADEN; // bit 20

  @Bits(2)
  late int _reserved2; // bits 21–21 (reserved / unused)

  @Bits(6)
  late int GAININ; // bits 22–27

  @Bits(4)
  late int _reserved3; // bits 28–31 (reserved / unused)

  late int value;

  factory Conf3Register(int value, [GetSetHook<int> hook]) = _Conf3Register;
}
