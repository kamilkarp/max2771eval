#ifndef MAX2771_REGISTERS_H
#define MAX2771_REGISTERS_H

#define MAX2771_CREATE_MASK(count, position) (((1U << (count)) - 1) << (position))

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
#define MAX2771_CONF1_ADR                     (0x00)
#define MAX2771_CHIPEN_CONF1_POS              (31U)
#define MAX2771_CHIPEN_CONF1                  (MAX2771_CREATE_MASK(1,31))
#define MAX2771_IDLE_CONF1_POS                (30U)
#define MAX2771_IDLE_CONF1                    (MAX2771_CREATE_MASK(1,30))
#define MAX2771_MIXPOLE_CONF1_POS             (17U)
#define MAX2771_MIXPOLE_CONF1                 (MAX2771_CREATE_MASK(1,17))
#define MAX2771_LNAMODE_CONF1_POS             (15U)
#define MAX2771_LNAMODE_CONF1                 (MAX2771_CREATE_MASK(2,15))
#define MAX2771_MIXERMODE_CONF1_POS           (13U)
#define MAX2771_MIXERMODE_CONF1               (MAX2771_CREATE_MASK(2,13))
#define MAX2771_FCEN_CONF1_POS                (6U)
#define MAX2771_FCEN_CONF1                    (MAX2771_CREATE_MASK(7,6))
#define MAX2771_FBW_CONF1_POS                 (3U)
#define MAX2771_FBW_CONF1                     (MAX2771_CREATE_MASK(3,3))
#define MAX2771_F3OR5_CONF1_POS               (2U)
#define MAX2771_F3OR5_CONF1                   (MAX2771_CREATE_MASK(1,2))
#define MAX2771_FCENX_CONF1_POS               (1U)
#define MAX2771_FCENX_CONF1                   (MAX2771_CREATE_MASK(1,1))
#define MAX2771_FGAIN_CONF1_POS               (0U)
#define MAX2771_FGAIN_CONF1                   (MAX2771_CREATE_MASK(1,0))

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
#define MAX2771_CONF2_ADR                     (0x01)
#define MAX2771_ANAIMON_CONF2_POS             (28U)
#define MAX2771_ANAIMON_CONF2                 (MAX2771_CREATE_MASK(1,28))
#define MAX2771_IQEN_CONF2_POS                (27U)
#define MAX2771_IQEN_CONF2                    (MAX2771_CREATE_MASK(1,27))
#define MAX2771_GAINREF_CONF2_POS             (15U)
#define MAX2771_GAINREF_CONF2                 (MAX2771_CREATE_MASK(12,15))
#define MAX2771_SPI_SDIO_CONFIG_CONF2_POS     (13U)
#define MAX2771_SPI_SDIO_CONFIG_CONF2         (MAX2771_CREATE_MASK(2,13))
#define MAX2771_AGCMODE_CONF2_POS             (11U)
#define MAX2771_AGCMODE_CONF2                 (MAX2771_CREATE_MASK(2,11))
#define MAX2771_FORMAT_CONF2_POS              (9U)
#define MAX2771_FORMAT_CONF2                  (MAX2771_CREATE_MASK(2,9))
#define MAX2771_BITS_CONF2_POS                (6U)
#define MAX2771_BITS_CONF2                    (MAX2771_CREATE_MASK(3,6))
#define MAX2771_DRVCFG_CONF2_POS              (4U)
#define MAX2771_DRVCFG_CONF2                  (MAX2771_CREATE_MASK(2,4))
#define MAX2771_DIEID_CONF2_POS               (0U)
#define MAX2771_DIEID_CONF2                   (MAX2771_CREATE_MASK(2,0))

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
#define MAX2771_CONF3_ADR                     (0x02)
#define MAX2771_GAININ_CONF3_POS              (22U)
#define MAX2771_GAININ_CONF3                  (MAX2771_CREATE_MASK(6,22))
#define MAX2771_HILOADEN_CONF3_POS            (20U)
#define MAX2771_HILOADEN_CONF3                (MAX2771_CREATE_MASK(1,20))
#define MAX2771_FHIPEN_CONF3_POS              (15U)
#define MAX2771_FHIPEN_CONF3                  (MAX2771_CREATE_MASK(1,15))
#define MAX2771_PGAIEN_CONF3_POS              (13U)
#define MAX2771_PGAIEN_CONF3                  (MAX2771_CREATE_MASK(1,13))
#define MAX2771_PGAQEN_CONF3_POS              (12U)
#define MAX2771_PGAQEN_CONF3                  (MAX2771_CREATE_MASK(1,12))
#define MAX2771_STRMEN_CONF3_POS              (11U)
#define MAX2771_STRMEN_CONF3                  (MAX2771_CREATE_MASK(1,11))
#define MAX2771_STRMSTART_CONF3_POS           (10U)
#define MAX2771_STRMSTART_CONF3               (MAX2771_CREATE_MASK(1,10))
#define MAX2771_STRMSTOP_CONF3_POS            (9U)
#define MAX2771_STRMSTOP_CONF3                (MAX2771_CREATE_MASK(1,9))
#define MAX2771_STRMBITS_CONF3_POS            (4U)
#define MAX2771_STRMBITS_CONF3                (MAX2771_CREATE_MASK(2,4))
#define MAX2771_STAMPEN_CONF3_POS             (3U)
#define MAX2771_STAMPEN_CONF3                 (MAX2771_CREATE_MASK(1,3))
#define MAX2771_TIME_SYNCEN_CONF3_POS         (2U)
#define MAX2771_TIME_SYNCEN_CONF3             (MAX2771_CREATE_MASK(1,2))
#define MAX2771_DATA_SYNCEN_CONF3_POS         (1U)
#define MAX2771_DATA_SYNCEN_CONF3             (MAX2771_CREATE_MASK(1,1))
#define MAX2771_STRMRST_CONF3_POS             (0U)
#define MAX2771_STRMRST_CONF3                 (MAX2771_CREATE_MASK(1,0))

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
#define MAX2771_PLLCFG_ADR                    (0x03)
#define MAX2771_REFDIV_PLLCFG_POS             (29U)
#define MAX2771_REFDIV_PLLCFG                 (MAX2771_CREATE_MASK(3,29))
#define MAX2771_LOBAND_PLLCFG_POS             (28U)
#define MAX2771_LOBAND_PLLCFG                 (MAX2771_CREATE_MASK(1,28))
#define MAX2771_REFOUTEN_PLLCFG_POS           (24U)
#define MAX2771_REFOUTEN_PLLCFG               (MAX2771_CREATE_MASK(1,24))
#define MAX2771_IXTAL_PLLCFG_POS              (19U)
#define MAX2771_IXTAL_PLLCFG                  (MAX2771_CREATE_MASK(2,19))
#define MAX2771_ICP_PLLCFG_POS                (9U)
#define MAX2771_ICP_PLLCFG                    (MAX2771_CREATE_MASK(1,9))
#define MAX2771_INT_PLL_PLLCFG_POS            (3U)
#define MAX2771_INT_PLL_PLLCFG                (MAX2771_CREATE_MASK(1,3))
#define MAX2771_PWRSAV_PLLCFG_POS             (2U)
#define MAX2771_PWRSAV_PLLCFG                 (MAX2771_CREATE_MASK(1,2))

/* PLL Integer Division Ratio (0x04)
 *
 * Contains:
 *   NDIV_PLLINTDIV (bits 31-17): 15-bit integer divider.
 *   RDIV_PLLINTDIV (bits 12-3): 10-bit reference divider.
 */
#define MAX2771_PLLINTDIV_ADR                 (0x04)
#define MAX2771_NDIV_PLLINTDIV_POS            (13U)
#define MAX2771_NDIV_PLLINTDIV                (MAX2771_CREATE_MASK(15,13))
#define MAX2771_RDIV_PLLINTDIV_POS            (3U)
#define MAX2771_RDIV_PLLINTDIV                (MAX2771_CREATE_MASK(10,3))

/* PLL Fractional Division Ratio (0x05)
 *
 * Contains the 20-bit fractional divider (FDIV_PLLFRACDIV) which provides fine frequency resolution.
 */
#define MAX2771_PLLFRACDIV_ADR                (0x05)
#define MAX2771_FDIV_PLLFRACDIV_POS           (8U)
#define MAX2771_FDIV_PLLFRACDIV               (MAX2771_CREATE_MASK(20,8))

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
#define MAX2771_CLKCFG1_ADR                   (0x07)
#define MAX2771_REFCLK_L_CNT_CLKCFG1_POS      (16U)
#define MAX2771_REFCLK_L_CNT_CLKCFG1          (MAX2771_CREATE_MASK(12,16))
#define MAX2771_REFCLK_M_CNT_CLKCFG1_POS      (4U)
#define MAX2771_REFCLK_M_CNT_CLKCFG1          (MAX2771_CREATE_MASK(12,4))
#define MAX2771_EXTADCCLK_CLKCFG1_POS         (28U)
#define MAX2771_EXTADCCLK_CLKCFG1             (MAX2771_CREATE_MASK(1,28))
#define MAX2771_FCLKIN_CLKCFG1_POS            (3U)
#define MAX2771_FCLKIN_CLKCFG1                (MAX2771_CREATE_MASK(1,3))
#define MAX2771_ADCCLK_CLKCFG1_POS            (2U)
#define MAX2771_ADCCLK_CLKCFG1                (MAX2771_CREATE_MASK(1,2))
#define MAX2771_MODE_CLKCFG1_POS              (0U)
#define MAX2771_MODE_CLKCFG1                  (MAX2771_CREATE_MASK(1,0))

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
#define MAX2771_CLKCFG2_ADR                   (0x0A)
#define MAX2771_ADCCLK_L_CNT_CLKCFG2_POS      (16U)
#define MAX2771_ADCCLK_L_CNT_CLKCFG2          (MAX2771_CREATE_MASK(12,16))
#define MAX2771_ADCCLK_M_CNT_CLKCFG2_POS      (4U)
#define MAX2771_ADCCLK_M_CNT_CLKCFG2          (MAX2771_CREATE_MASK(12,4))
#define MAX2771_PRE_FRACDIV_SEL_CLKCFG2_POS   (3U)
#define MAX2771_PRE_FRACDIV_SEL_CLKCFG2       (MAX2771_CREATE_MASK(1,3))
#define MAX2771_CLKOUT_SEL_CLKCFG2_POS        (2U)
#define MAX2771_CLKOUT_SEL_CLKCFG2            (MAX2771_CREATE_MASK(1,2))

#endif // MAX2771_REGISTERS_H
