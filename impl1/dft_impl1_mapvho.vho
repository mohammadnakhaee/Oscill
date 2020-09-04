
-- VHDL netlist produced by program ldbanno, Version Diamond (64-bit) 3.11.0.396.4

-- ldbanno -n VHDL -o dft_impl1_mapvho.vho -w -neg -gui -msgset C:/Users/mohammad/Documents/FPGA/DFT/promote.xml dft_impl1_map.ncd 
-- Netlist created on Tue Jun 23 11:13:09 2020
-- Netlist written on Tue Jun 23 11:13:21 2020
-- Design is for device LFE5UM5G-85F
-- Design is for package CABGA381
-- Design is for performance grade 8

-- entity sapiobuf
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity sapiobuf is
    port (I: in Std_logic; PAD: out Std_logic);

    ATTRIBUTE Vital_Level0 OF sapiobuf : ENTITY IS TRUE;

  end sapiobuf;

  architecture Structure of sapiobuf is
  begin
    INST5: OB
      port map (I=>I, O=>PAD);
  end Structure;

-- entity LED_0_B
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity LED_0_B is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "LED_0_B";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_LED0	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; LED0: out Std_logic);

    ATTRIBUTE Vital_Level0 OF LED_0_B : ENTITY IS TRUE;

  end LED_0_B;

  architecture Structure of LED_0_B is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal LED0_out 	: std_logic := 'X';

    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    LED_pad_0: sapiobuf
      port map (I=>PADDO_ipd, PAD=>LED0_out);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, LED0_out)
    VARIABLE LED0_zd         	: std_logic := 'X';
    VARIABLE LED0_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    LED0_zd 	:= LED0_out;

    VitalPathDelay01 (
      OutSignal => LED0, OutSignalName => "LED0", OutTemp => LED0_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_LED0,
                           PathCondition => TRUE)),
      GlitchData => LED0_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity sapiobuf0001
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity sapiobuf0001 is
    port (Z: out Std_logic; PAD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF sapiobuf0001 : ENTITY IS TRUE;

  end sapiobuf0001;

  architecture Structure of sapiobuf0001 is
  begin
    INST1: IBPD
      port map (I=>PAD, O=>Z);
  end Structure;

-- entity clk12MB
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity clk12MB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "clk12MB";

      tipd_clk12MS  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_clk12MS_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_clk12MS 	: VitalDelayType := 0 ns;
      tpw_clk12MS_posedge	: VitalDelayType := 0 ns;
      tpw_clk12MS_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; clk12MS: in Std_logic);

    ATTRIBUTE Vital_Level0 OF clk12MB : ENTITY IS TRUE;

  end clk12MB;

  architecture Structure of clk12MB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal clk12MS_ipd 	: std_logic := 'X';

    component sapiobuf0001
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    clk12M_pad: sapiobuf0001
      port map (Z=>PADDI_out, PAD=>clk12MS_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(clk12MS_ipd, clk12MS, tipd_clk12MS);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, clk12MS_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_clk12MS_clk12MS          	: x01 := '0';
    VARIABLE periodcheckinfo_clk12MS	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => clk12MS_ipd,
        TestSignalName => "clk12MS",
        Period => tperiod_clk12MS,
        PulseWidthHigh => tpw_clk12MS_posedge,
        PulseWidthLow => tpw_clk12MS_negedge,
        PeriodData => periodcheckinfo_clk12MS,
        Violation => tviol_clk12MS_clk12MS,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => clk12MS_ipd'last_event,
                           PathDelay => tpd_clk12MS_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity gnd
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity gnd is
    port (PWR0: out Std_logic);

    ATTRIBUTE Vital_Level0 OF gnd : ENTITY IS TRUE;

  end gnd;

  architecture Structure of gnd is
  begin
    INST1: VLO
      port map (Z=>PWR0);
  end Structure;

-- entity LED_7_B
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity LED_7_B is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "LED_7_B");

    port (LED7: out Std_logic);

    ATTRIBUTE Vital_Level0 OF LED_7_B : ENTITY IS TRUE;

  end LED_7_B;

  architecture Structure of LED_7_B is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal LED7_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
    component gnd
      port (PWR0: out Std_logic);
    end component;
  begin
    LED_pad_7: sapiobuf
      port map (I=>GNDI, PAD=>LED7_out);
    DRIVEGND: gnd
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
    END BLOCK;

    VitalBehavior : PROCESS (LED7_out)


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    LED7 	<= LED7_out;


    END PROCESS;

  end Structure;

-- entity vcc
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity vcc is
    port (PWR1: out Std_logic);

    ATTRIBUTE Vital_Level0 OF vcc : ENTITY IS TRUE;

  end vcc;

  architecture Structure of vcc is
  begin
    INST1: VHI
      port map (Z=>PWR1);
  end Structure;

-- entity LED_6_B
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity LED_6_B is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "LED_6_B");

    port (LED6: out Std_logic);

    ATTRIBUTE Vital_Level0 OF LED_6_B : ENTITY IS TRUE;

  end LED_6_B;

  architecture Structure of LED_6_B is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal LED6_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    LED_pad_6: sapiobuf
      port map (I=>VCCI, PAD=>LED6_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
    END BLOCK;

    VitalBehavior : PROCESS (LED6_out)


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    LED6 	<= LED6_out;


    END PROCESS;

  end Structure;

-- entity LED_5_B
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity LED_5_B is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "LED_5_B";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_LED5	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; LED5: out Std_logic);

    ATTRIBUTE Vital_Level0 OF LED_5_B : ENTITY IS TRUE;

  end LED_5_B;

  architecture Structure of LED_5_B is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal LED5_out 	: std_logic := 'X';

    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    LED_pad_5: sapiobuf
      port map (I=>PADDO_ipd, PAD=>LED5_out);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, LED5_out)
    VARIABLE LED5_zd         	: std_logic := 'X';
    VARIABLE LED5_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    LED5_zd 	:= LED5_out;

    VitalPathDelay01 (
      OutSignal => LED5, OutSignalName => "LED5", OutTemp => LED5_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_LED5,
                           PathCondition => TRUE)),
      GlitchData => LED5_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity LED_4_B
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity LED_4_B is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "LED_4_B");

    port (LED4: out Std_logic);

    ATTRIBUTE Vital_Level0 OF LED_4_B : ENTITY IS TRUE;

  end LED_4_B;

  architecture Structure of LED_4_B is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal LED4_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    LED_pad_4: sapiobuf
      port map (I=>VCCI, PAD=>LED4_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
    END BLOCK;

    VitalBehavior : PROCESS (LED4_out)


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    LED4 	<= LED4_out;


    END PROCESS;

  end Structure;

-- entity LED_3_B
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity LED_3_B is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "LED_3_B";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_LED3	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; LED3: out Std_logic);

    ATTRIBUTE Vital_Level0 OF LED_3_B : ENTITY IS TRUE;

  end LED_3_B;

  architecture Structure of LED_3_B is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal LED3_out 	: std_logic := 'X';

    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    LED_pad_3: sapiobuf
      port map (I=>PADDO_ipd, PAD=>LED3_out);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, LED3_out)
    VARIABLE LED3_zd         	: std_logic := 'X';
    VARIABLE LED3_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    LED3_zd 	:= LED3_out;

    VitalPathDelay01 (
      OutSignal => LED3, OutSignalName => "LED3", OutTemp => LED3_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_LED3,
                           PathCondition => TRUE)),
      GlitchData => LED3_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity LED_2_B
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity LED_2_B is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "LED_2_B");

    port (LED2: out Std_logic);

    ATTRIBUTE Vital_Level0 OF LED_2_B : ENTITY IS TRUE;

  end LED_2_B;

  architecture Structure of LED_2_B is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal LED2_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    LED_pad_2: sapiobuf
      port map (I=>VCCI, PAD=>LED2_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
    END BLOCK;

    VitalBehavior : PROCESS (LED2_out)


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    LED2 	<= LED2_out;


    END PROCESS;

  end Structure;

-- entity LED_1_B
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity LED_1_B is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "LED_1_B";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_LED1	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; LED1: out Std_logic);

    ATTRIBUTE Vital_Level0 OF LED_1_B : ENTITY IS TRUE;

  end LED_1_B;

  architecture Structure of LED_1_B is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal LED1_out 	: std_logic := 'X';

    component sapiobuf
      port (I: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    LED_pad_1: sapiobuf
      port map (I=>PADDO_ipd, PAD=>LED1_out);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, LED1_out)
    VARIABLE LED1_zd         	: std_logic := 'X';
    VARIABLE LED1_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    LED1_zd 	:= LED1_out;

    VitalPathDelay01 (
      OutSignal => LED1, OutSignalName => "LED1", OutTemp => LED1_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_LED1,
                           PathCondition => TRUE)),
      GlitchData => LED1_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity sapiobuf0002
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity sapiobuf0002 is
    port (Z: out Std_logic; PAD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF sapiobuf0002 : ENTITY IS TRUE;

  end sapiobuf0002;

  architecture Structure of sapiobuf0002 is
  begin
    INST1: IBPD
      port map (I=>PAD, O=>Z);
  end Structure;

-- entity selectClockB
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity selectClockB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "selectClockB";

      tipd_selectClockS  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_selectClockS_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_selectClockS 	: VitalDelayType := 0 ns;
      tpw_selectClockS_posedge	: VitalDelayType := 0 ns;
      tpw_selectClockS_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; selectClockS: in Std_logic);

    ATTRIBUTE Vital_Level0 OF selectClockB : ENTITY IS TRUE;

  end selectClockB;

  architecture Structure of selectClockB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal selectClockS_ipd 	: std_logic := 'X';

    component sapiobuf0002
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    selectClock_pad: sapiobuf0002
      port map (Z=>PADDI_out, PAD=>selectClockS_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(selectClockS_ipd, selectClockS, tipd_selectClockS);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, selectClockS_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_selectClockS_selectClockS          	: x01 := '0';
    VARIABLE periodcheckinfo_selectClockS	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => selectClockS_ipd,
        TestSignalName => "selectClockS",
        Period => tperiod_selectClockS,
        PulseWidthHigh => tpw_selectClockS_posedge,
        PulseWidthLow => tpw_selectClockS_negedge,
        PeriodData => periodcheckinfo_selectClockS,
        Violation => tviol_selectClockS_selectClockS,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => selectClockS_ipd'last_event,
                           PathDelay => tpd_selectClockS_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity OSCGB
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity OSCGB is
    port (OSC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF OSCGB : ENTITY IS TRUE;

  end OSCGB;

  architecture Structure of OSCGB is
  begin
    INST10: OSCG
      generic map (DIV => 128)
      port map (OSC=>OSC);
  end Structure;

-- entity OSCI1
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity OSCI1 is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "OSCI1");

    port (OSC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF OSCI1 : ENTITY IS TRUE;

  end OSCI1;

  architecture Structure of OSCI1 is
    signal OSC_out 	: std_logic := 'X';

    component OSCGB
      port (OSC: out Std_logic);
    end component;
  begin
    OSCI1_OSCG: OSCGB
      port map (OSC=>OSC_out);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
    END BLOCK;

    VitalBehavior : PROCESS (OSC_out)


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    OSC 	<= OSC_out;


    END PROCESS;

  end Structure;

-- entity top
  library IEEE, vital2000, ECP5UM;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use ECP5UM.COMPONENTS.ALL;

  entity top is
    port (clk12M: in Std_logic; rstn: in Std_logic; selectClock: in Std_logic; 
          LED: out Std_logic_vector (7 downto 0));



  end top;

  architecture Structure of top is
    signal baudcounter_24: Std_logic;
    signal baudcounter_23: Std_logic;
    signal un2_baudcounter_1_cry_23_0_S0: Std_logic;
    signal baudcounter11: Std_logic;
    signal clk: Std_logic;
    signal un2_baudcounter_1_cry_22: Std_logic;
    signal un2_baudcounter_1_cry_23_0_S1: Std_logic;
    signal baudcounter_0: Std_logic;
    signal un2_baudcounter_1_cry_0: Std_logic;
    signal baudcounter_2: Std_logic;
    signal baudcounter_1: Std_logic;
    signal un2_baudcounter_1_cry_1_0_S1: Std_logic;
    signal un2_baudcounter_1_cry_1_0_S0: Std_logic;
    signal un2_baudcounter_1_cry_2: Std_logic;
    signal baudcounter_4: Std_logic;
    signal baudcounter_3: Std_logic;
    signal un2_baudcounter_1_cry_3_0_S1: Std_logic;
    signal un2_baudcounter_1_cry_3_0_S0: Std_logic;
    signal un2_baudcounter_1_cry_4: Std_logic;
    signal baudcounter_6: Std_logic;
    signal baudcounter_5: Std_logic;
    signal un2_baudcounter_1_cry_5_0_S1: Std_logic;
    signal un2_baudcounter_1_cry_5_0_S0: Std_logic;
    signal un2_baudcounter_1_cry_6: Std_logic;
    signal baudcounter_8: Std_logic;
    signal baudcounter_7: Std_logic;
    signal un2_baudcounter_1_cry_7_0_S0: Std_logic;
    signal un2_baudcounter_1_cry_7_0_S1: Std_logic;
    signal un2_baudcounter_1_cry_8: Std_logic;
    signal baudcounter_10: Std_logic;
    signal baudcounter_9: Std_logic;
    signal un2_baudcounter_1_cry_9_0_S0: Std_logic;
    signal un2_baudcounter_1_cry_9_0_S1: Std_logic;
    signal un2_baudcounter_1_cry_10: Std_logic;
    signal baudcounter_12: Std_logic;
    signal baudcounter_11: Std_logic;
    signal un2_baudcounter_1_cry_11_0_S1: Std_logic;
    signal un2_baudcounter_1_cry_11_0_S0: Std_logic;
    signal un2_baudcounter_1_cry_12: Std_logic;
    signal baudcounter_14: Std_logic;
    signal baudcounter_13: Std_logic;
    signal un2_baudcounter_1_cry_13_0_S1: Std_logic;
    signal un2_baudcounter_1_cry_13_0_S0: Std_logic;
    signal un2_baudcounter_1_cry_14: Std_logic;
    signal baudcounter_16: Std_logic;
    signal baudcounter_15: Std_logic;
    signal un2_baudcounter_1_cry_15_0_S0: Std_logic;
    signal un2_baudcounter_1_cry_15_0_S1: Std_logic;
    signal un2_baudcounter_1_cry_16: Std_logic;
    signal baudcounter_18: Std_logic;
    signal baudcounter_17: Std_logic;
    signal un2_baudcounter_1_cry_17_0_S1: Std_logic;
    signal un2_baudcounter_1_cry_17_0_S0: Std_logic;
    signal un2_baudcounter_1_cry_18: Std_logic;
    signal baudcounter_20: Std_logic;
    signal baudcounter_19: Std_logic;
    signal un2_baudcounter_1_cry_19_0_S0: Std_logic;
    signal un2_baudcounter_1_cry_19_0_S1: Std_logic;
    signal un2_baudcounter_1_cry_20: Std_logic;
    signal baudcounter_22: Std_logic;
    signal baudcounter_21: Std_logic;
    signal un2_baudcounter_1_cry_21_0_S0: Std_logic;
    signal un2_baudcounter_1_cry_21_0_S1: Std_logic;
    signal baudcounter11_21: Std_logic;
    signal baudcounter11_20: Std_logic;
    signal baudcounter11_14: Std_logic;
    signal baudcounter11_13: Std_logic;
    signal LED_c_0: Std_logic;
    signal baudclock_0: Std_logic;
    signal baudcounter_i_0: Std_logic;
    signal baudcounter11_16: Std_logic;
    signal baudcounter11_6: Std_logic;
    signal baudcounter11_17: Std_logic;
    signal baudcounter11_12: Std_logic;
    signal selectClock_c: Std_logic;
    signal osc_clk: Std_logic;
    signal clk12M_c: Std_logic;
    signal LED_c_i_0: Std_logic;
    signal VCCI: Std_logic;
    component LED_0_B
      port (PADDO: in Std_logic; LED0: out Std_logic);
    end component;
    component clk12MB
      port (PADDI: out Std_logic; clk12MS: in Std_logic);
    end component;
    component LED_7_B
      port (LED7: out Std_logic);
    end component;
    component LED_6_B
      port (LED6: out Std_logic);
    end component;
    component LED_5_B
      port (PADDO: in Std_logic; LED5: out Std_logic);
    end component;
    component LED_4_B
      port (LED4: out Std_logic);
    end component;
    component LED_3_B
      port (PADDO: in Std_logic; LED3: out Std_logic);
    end component;
    component LED_2_B
      port (LED2: out Std_logic);
    end component;
    component LED_1_B
      port (PADDO: in Std_logic; LED1: out Std_logic);
    end component;
    component selectClockB
      port (PADDI: out Std_logic; selectClockS: in Std_logic);
    end component;
    component OSCI1
      port (OSC: out Std_logic);
    end component;
  begin
    SLICE_0I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"a003", INIT1_INITVAL=>X"a003", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>baudcounter_24, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>'X', DI0=>un2_baudcounter_1_cry_23_0_S0, 
                A0=>baudcounter_23, B0=>'1', C0=>'1', D0=>'1', 
                FCI=>un2_baudcounter_1_cry_22, M0=>'X', CE=>'X', CLK=>clk, 
                LSR=>baudcounter11, FCO=>open, 
                F1=>un2_baudcounter_1_cry_23_0_S1, Q1=>open, 
                F0=>un2_baudcounter_1_cry_23_0_S0, Q0=>baudcounter_23);
    SLICE_1I: SCCU2C
      generic map (CCU2_INJECT1_0=>"NO", INIT0_INITVAL=>X"500c", 
                   INIT1_INITVAL=>X"a003")
      port map (M1=>'X', A1=>baudcounter_0, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>'X', DI0=>'X', A0=>'1', B0=>'1', C0=>'1', D0=>'1', 
                FCI=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                FCO=>un2_baudcounter_1_cry_0, F1=>open, Q1=>open, F0=>open, 
                Q0=>open);
    SLICE_2I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", CCU2_INJECT1_0=>"NO", 
                   CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", SRMODE=>"ASYNC", 
                   INIT0_INITVAL=>X"a003", INIT1_INITVAL=>X"a003", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE)
      port map (M1=>'X', A1=>baudcounter_2, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>un2_baudcounter_1_cry_1_0_S1, 
                DI0=>un2_baudcounter_1_cry_1_0_S0, A0=>baudcounter_1, B0=>'1', 
                C0=>'1', D0=>'1', FCI=>un2_baudcounter_1_cry_0, M0=>'X', 
                CE=>'X', CLK=>clk, LSR=>'X', FCO=>un2_baudcounter_1_cry_2, 
                F1=>un2_baudcounter_1_cry_1_0_S1, Q1=>baudcounter_2, 
                F0=>un2_baudcounter_1_cry_1_0_S0, Q0=>baudcounter_1);
    SLICE_3I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", CCU2_INJECT1_0=>"NO", 
                   CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", SRMODE=>"ASYNC", 
                   INIT0_INITVAL=>X"a003", INIT1_INITVAL=>X"a003", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE)
      port map (M1=>'X', A1=>baudcounter_4, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>un2_baudcounter_1_cry_3_0_S1, 
                DI0=>un2_baudcounter_1_cry_3_0_S0, A0=>baudcounter_3, B0=>'1', 
                C0=>'1', D0=>'1', FCI=>un2_baudcounter_1_cry_2, M0=>'X', 
                CE=>'X', CLK=>clk, LSR=>'X', FCO=>un2_baudcounter_1_cry_4, 
                F1=>un2_baudcounter_1_cry_3_0_S1, Q1=>baudcounter_4, 
                F0=>un2_baudcounter_1_cry_3_0_S0, Q0=>baudcounter_3);
    SLICE_4I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", CCU2_INJECT1_0=>"NO", 
                   CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", SRMODE=>"ASYNC", 
                   INIT0_INITVAL=>X"a003", INIT1_INITVAL=>X"a003", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE)
      port map (M1=>'X', A1=>baudcounter_6, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>un2_baudcounter_1_cry_5_0_S1, 
                DI0=>un2_baudcounter_1_cry_5_0_S0, A0=>baudcounter_5, B0=>'1', 
                C0=>'1', D0=>'1', FCI=>un2_baudcounter_1_cry_4, M0=>'X', 
                CE=>'X', CLK=>clk, LSR=>'X', FCO=>un2_baudcounter_1_cry_6, 
                F1=>un2_baudcounter_1_cry_5_0_S1, Q1=>baudcounter_6, 
                F0=>un2_baudcounter_1_cry_5_0_S0, Q0=>baudcounter_5);
    SLICE_5I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", CCU2_INJECT1_0=>"NO", 
                   CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", SRMODE=>"ASYNC", 
                   INIT0_INITVAL=>X"a003", INIT1_INITVAL=>X"a003", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE)
      port map (M1=>'X', A1=>baudcounter_8, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>'X', DI0=>un2_baudcounter_1_cry_7_0_S0, A0=>baudcounter_7, 
                B0=>'1', C0=>'1', D0=>'1', FCI=>un2_baudcounter_1_cry_6, 
                M0=>'X', CE=>'X', CLK=>clk, LSR=>'X', 
                FCO=>un2_baudcounter_1_cry_8, F1=>un2_baudcounter_1_cry_7_0_S1, 
                Q1=>open, F0=>un2_baudcounter_1_cry_7_0_S0, Q0=>baudcounter_7);
    SLICE_6I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"a003", INIT1_INITVAL=>X"a003", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>baudcounter_10, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>'X', DI0=>un2_baudcounter_1_cry_9_0_S0, A0=>baudcounter_9, 
                B0=>'1', C0=>'1', D0=>'1', FCI=>un2_baudcounter_1_cry_8, 
                M0=>'X', CE=>'X', CLK=>clk, LSR=>baudcounter11, 
                FCO=>un2_baudcounter_1_cry_10, 
                F1=>un2_baudcounter_1_cry_9_0_S1, Q1=>open, 
                F0=>un2_baudcounter_1_cry_9_0_S0, Q0=>baudcounter_9);
    SLICE_7I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"a003", INIT1_INITVAL=>X"a003", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>baudcounter_12, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>un2_baudcounter_1_cry_11_0_S1, 
                DI0=>un2_baudcounter_1_cry_11_0_S0, A0=>baudcounter_11, 
                B0=>'1', C0=>'1', D0=>'1', FCI=>un2_baudcounter_1_cry_10, 
                M0=>'X', CE=>'X', CLK=>clk, LSR=>baudcounter11, 
                FCO=>un2_baudcounter_1_cry_12, 
                F1=>un2_baudcounter_1_cry_11_0_S1, Q1=>baudcounter_12, 
                F0=>un2_baudcounter_1_cry_11_0_S0, Q0=>baudcounter_11);
    SLICE_8I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", CCU2_INJECT1_0=>"NO", 
                   CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", SRMODE=>"ASYNC", 
                   INIT0_INITVAL=>X"a003", INIT1_INITVAL=>X"a003", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE)
      port map (M1=>'X', A1=>baudcounter_14, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>un2_baudcounter_1_cry_13_0_S1, 
                DI0=>un2_baudcounter_1_cry_13_0_S0, A0=>baudcounter_13, 
                B0=>'1', C0=>'1', D0=>'1', FCI=>un2_baudcounter_1_cry_12, 
                M0=>'X', CE=>'X', CLK=>clk, LSR=>'X', 
                FCO=>un2_baudcounter_1_cry_14, 
                F1=>un2_baudcounter_1_cry_13_0_S1, Q1=>baudcounter_14, 
                F0=>un2_baudcounter_1_cry_13_0_S0, Q0=>baudcounter_13);
    SLICE_9I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", CCU2_INJECT1_0=>"NO", 
                   CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", SRMODE=>"ASYNC", 
                   INIT0_INITVAL=>X"a003", INIT1_INITVAL=>X"a003", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE)
      port map (M1=>'X', A1=>baudcounter_16, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>'X', DI0=>un2_baudcounter_1_cry_15_0_S0, 
                A0=>baudcounter_15, B0=>'1', C0=>'1', D0=>'1', 
                FCI=>un2_baudcounter_1_cry_14, M0=>'X', CE=>'X', CLK=>clk, 
                LSR=>'X', FCO=>un2_baudcounter_1_cry_16, 
                F1=>un2_baudcounter_1_cry_15_0_S1, Q1=>open, 
                F0=>un2_baudcounter_1_cry_15_0_S0, Q0=>baudcounter_15);
    SLICE_10I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"a003", INIT1_INITVAL=>X"a003", 
                   REG1_SD=>"VHI", REG0_SD=>"VHI", CHECK_DI1=>TRUE, 
                   CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>baudcounter_18, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>un2_baudcounter_1_cry_17_0_S1, 
                DI0=>un2_baudcounter_1_cry_17_0_S0, A0=>baudcounter_17, 
                B0=>'1', C0=>'1', D0=>'1', FCI=>un2_baudcounter_1_cry_16, 
                M0=>'X', CE=>'X', CLK=>clk, LSR=>baudcounter11, 
                FCO=>un2_baudcounter_1_cry_18, 
                F1=>un2_baudcounter_1_cry_17_0_S1, Q1=>baudcounter_18, 
                F0=>un2_baudcounter_1_cry_17_0_S0, Q0=>baudcounter_17);
    SLICE_11I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", CCU2_INJECT1_0=>"NO", 
                   CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", SRMODE=>"ASYNC", 
                   INIT0_INITVAL=>X"a003", INIT1_INITVAL=>X"a003", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE)
      port map (M1=>'X', A1=>baudcounter_20, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>'X', DI0=>un2_baudcounter_1_cry_19_0_S0, 
                A0=>baudcounter_19, B0=>'1', C0=>'1', D0=>'1', 
                FCI=>un2_baudcounter_1_cry_18, M0=>'X', CE=>'X', CLK=>clk, 
                LSR=>'X', FCO=>un2_baudcounter_1_cry_20, 
                F1=>un2_baudcounter_1_cry_19_0_S1, Q1=>open, 
                F0=>un2_baudcounter_1_cry_19_0_S0, Q0=>baudcounter_19);
    SLICE_12I: SCCU2C
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   CCU2_INJECT1_0=>"NO", CCU2_INJECT1_1=>"NO", GSR=>"DISABLED", 
                   INIT0_INITVAL=>X"a003", INIT1_INITVAL=>X"a003", 
                   REG0_SD=>"VHI", CHECK_DI0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>'X', A1=>baudcounter_22, B1=>'1', C1=>'1', D1=>'1', 
                DI1=>'X', DI0=>un2_baudcounter_1_cry_21_0_S0, 
                A0=>baudcounter_21, B0=>'1', C0=>'1', D0=>'1', 
                FCI=>un2_baudcounter_1_cry_20, M0=>'X', CE=>'X', CLK=>clk, 
                LSR=>baudcounter11, FCO=>un2_baudcounter_1_cry_22, 
                F1=>un2_baudcounter_1_cry_21_0_S1, Q1=>open, 
                F0=>un2_baudcounter_1_cry_21_0_S0, Q0=>baudcounter_21);
    SLICE_13I: SLOGICB
      generic map (CLKMUX=>"SIG", CEMUX=>"VHI", GSR=>"DISABLED", 
                   SRMODE=>"ASYNC", LUT0_INITVAL=>X"6666", 
                   LUT1_INITVAL=>X"8000", REG0_SD=>"VHI", CHECK_DI0=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>baudcounter11_13, 
                B1=>baudcounter11_14, C1=>baudcounter11_20, 
                D1=>baudcounter11_21, DI1=>'X', DI0=>baudclock_0, A0=>LED_c_0, 
                B0=>baudcounter11, C0=>'X', D0=>'X', M0=>'X', CE=>'X', 
                CLK=>clk, LSR=>'X', OFX1=>open, F1=>baudcounter11, Q1=>open, 
                OFX0=>open, F0=>baudclock_0, Q0=>LED_c_0);
    SLICE_14I: SLOGICB
      generic map (M1MUX=>"SIG", CLKMUX=>"SIG", CEMUX=>"VHI", LSRMUX=>"SIG", 
                   GSR=>"DISABLED", LUT0_INITVAL=>X"5555", REG0_SD=>"VHI", 
                   CHECK_DI0=>TRUE, CHECK_M1=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>un2_baudcounter_1_cry_7_0_S1, FXA=>'X', FXB=>'X', A1=>'X', 
                B1=>'X', C1=>'X', D1=>'X', DI1=>'X', DI0=>baudcounter_i_0, 
                A0=>baudcounter_0, B0=>'X', C0=>'X', D0=>'X', M0=>'X', CE=>'X', 
                CLK=>clk, LSR=>baudcounter11, OFX1=>open, F1=>open, 
                Q1=>baudcounter_8, OFX0=>open, F0=>baudcounter_i_0, 
                Q0=>baudcounter_0);
    SLICE_16I: SLOGICB
      generic map (M0MUX=>"SIG", M1MUX=>"SIG", CLKMUX=>"SIG", CEMUX=>"VHI", 
                   LSRMUX=>"SIG", GSR=>"DISABLED", CHECK_M1=>TRUE, 
                   CHECK_M0=>TRUE, CHECK_LSR=>TRUE)
      port map (M1=>un2_baudcounter_1_cry_19_0_S1, FXA=>'X', FXB=>'X', A1=>'X', 
                B1=>'X', C1=>'X', D1=>'X', DI1=>'X', DI0=>'X', A0=>'X', 
                B0=>'X', C0=>'X', D0=>'X', M0=>un2_baudcounter_1_cry_15_0_S1, 
                CE=>'X', CLK=>clk, LSR=>baudcounter11, OFX1=>open, F1=>open, 
                Q1=>baudcounter_20, OFX0=>open, F0=>open, Q0=>baudcounter_16);
    SLICE_17I: SLOGICB
      generic map (M0MUX=>"SIG", M1MUX=>"SIG", CLKMUX=>"SIG", CEMUX=>"VHI", 
                   GSR=>"DISABLED", SRMODE=>"ASYNC", CHECK_M1=>TRUE, 
                   CHECK_M0=>TRUE)
      port map (M1=>un2_baudcounter_1_cry_23_0_S1, FXA=>'X', FXB=>'X', A1=>'X', 
                B1=>'X', C1=>'X', D1=>'X', DI1=>'X', DI0=>'X', A0=>'X', 
                B0=>'X', C0=>'X', D0=>'X', M0=>un2_baudcounter_1_cry_21_0_S1, 
                CE=>'X', CLK=>clk, LSR=>'X', OFX1=>open, F1=>open, 
                Q1=>baudcounter_24, OFX0=>open, F0=>open, Q0=>baudcounter_22);
    SLICE_18I: SLOGICB
      generic map (LUT0_INITVAL=>X"1111", LUT1_INITVAL=>X"0008")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>baudcounter11_6, 
                B1=>baudcounter11_16, C1=>baudcounter_1, D1=>baudcounter_2, 
                DI1=>'X', DI0=>'X', A0=>baudcounter_3, B0=>baudcounter_4, 
                C0=>'X', D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', 
                OFX1=>open, F1=>baudcounter11_20, Q1=>open, OFX0=>open, 
                F0=>baudcounter11_6, Q0=>open);
    SLICE_19I: SLOGICB
      generic map (LUT0_INITVAL=>X"0008", LUT1_INITVAL=>X"0001")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>baudcounter_13, 
                B1=>baudcounter_14, C1=>baudcounter_15, D1=>baudcounter_19, 
                DI1=>'X', DI0=>'X', A0=>baudcounter11_12, B0=>baudcounter11_17, 
                C0=>baudcounter_22, D0=>baudcounter_24, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>baudcounter11_17, Q1=>open, 
                OFX0=>open, F0=>baudcounter11_21, Q0=>open);
    SLICE_20I: SLOGICB
      generic map (LUT0_INITVAL=>X"8000", LUT1_INITVAL=>X"8000")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>baudcounter_11, 
                B1=>baudcounter_12, C1=>baudcounter_16, D1=>baudcounter_17, 
                DI1=>'X', DI0=>'X', A0=>baudcounter_18, B0=>baudcounter_20, 
                C0=>baudcounter_21, D0=>baudcounter_23, M0=>'X', CE=>'X', 
                CLK=>'X', LSR=>'X', OFX1=>open, F1=>baudcounter11_13, Q1=>open, 
                OFX0=>open, F0=>baudcounter11_14, Q0=>open);
    SLICE_21I: SLOGICB
      generic map (LUT0_INITVAL=>X"4040")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>baudcounter_0, 
                B0=>baudcounter_8, C0=>baudcounter_9, D0=>'X', M0=>'X', 
                CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, F1=>open, Q1=>open, 
                OFX0=>open, F0=>baudcounter11_12, Q0=>open);
    SLICE_22I: SLOGICB
      generic map (M0MUX=>"SIG", CLKMUX=>"SIG", CEMUX=>"VHI", GSR=>"DISABLED", 
                   SRMODE=>"ASYNC", LUT0_INITVAL=>X"0001", CHECK_M0=>TRUE)
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>baudcounter_5, 
                B0=>baudcounter_6, C0=>baudcounter_7, D0=>baudcounter_10, 
                M0=>un2_baudcounter_1_cry_9_0_S1, CE=>'X', CLK=>clk, LSR=>'X', 
                OFX1=>open, F1=>open, Q1=>open, OFX0=>open, 
                F0=>baudcounter11_16, Q0=>baudcounter_10);
    SLICE_23I: SLOGICB
      generic map (LUT0_INITVAL=>X"CACA")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>clk12M_c, B0=>osc_clk, 
                C0=>selectClock_c, D0=>'X', M0=>'X', CE=>'X', CLK=>'X', 
                LSR=>'X', OFX1=>open, F1=>open, Q1=>open, OFX0=>open, F0=>clk, 
                Q0=>open);
    SLICE_24I: SLOGICB
      generic map (LUT0_INITVAL=>X"5555")
      port map (M1=>'X', FXA=>'X', FXB=>'X', A1=>'X', B1=>'X', C1=>'X', 
                D1=>'X', DI1=>'X', DI0=>'X', A0=>LED_c_0, B0=>'X', C0=>'X', 
                D0=>'X', M0=>'X', CE=>'X', CLK=>'X', LSR=>'X', OFX1=>open, 
                F1=>open, Q1=>open, OFX0=>open, F0=>LED_c_i_0, Q0=>open);
    LED_0_I: LED_0_B
      port map (PADDO=>LED_c_0, LED0=>LED(0));
    clk12MI: clk12MB
      port map (PADDI=>clk12M_c, clk12MS=>clk12M);
    LED_7_I: LED_7_B
      port map (LED7=>LED(7));
    LED_6_I: LED_6_B
      port map (LED6=>LED(6));
    LED_5_I: LED_5_B
      port map (PADDO=>LED_c_i_0, LED5=>LED(5));
    LED_4_I: LED_4_B
      port map (LED4=>LED(4));
    LED_3_I: LED_3_B
      port map (PADDO=>LED_c_i_0, LED3=>LED(3));
    LED_2_I: LED_2_B
      port map (LED2=>LED(2));
    LED_1_I: LED_1_B
      port map (PADDO=>LED_c_i_0, LED1=>LED(1));
    selectClockI: selectClockB
      port map (PADDI=>selectClock_c, selectClockS=>selectClock);
    OSCI1I: OSCI1
      port map (OSC=>osc_clk);
    VHI_INST: VHI
      port map (Z=>VCCI);
    PUR_INST: PUR
      port map (PUR=>VCCI);
    GSR_INST: GSR
      port map (GSR=>VCCI);
  end Structure;



  library IEEE, vital2000, ECP5UM;
  configuration Structure_CON of top is
    for Structure
    end for;
  end Structure_CON;


