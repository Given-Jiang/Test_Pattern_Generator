-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_single_pulse is
	generic (
		DELAY : positive := 1;
		SIGNAL_TYPE : string := "Impulse";
		IMPULSE_WIDTH : positive := 1
	);
	port (
		result : out std_logic;
		clock : in std_logic := '0';
		sclr : in std_logic := '0';
		aclr : in std_logic := '0';
		ena : in std_logic := '0'
	);
end entity alt_dspbuilder_single_pulse;

architecture rtl of alt_dspbuilder_single_pulse is

component alt_dspbuilder_single_pulse_GN2XGKTRR3 is
	generic (
		DELAY : positive := 1;
		SIGNAL_TYPE : string := "Step Down";
		IMPULSE_WIDTH : positive := 1
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		ena : in std_logic := '0';
		result : out std_logic;
		sclr : in std_logic := '0'
	);
end component alt_dspbuilder_single_pulse_GN2XGKTRR3;

begin

alt_dspbuilder_single_pulse_GN2XGKTRR3_0: if ((DELAY = 1) and (SIGNAL_TYPE = "Step Down") and (IMPULSE_WIDTH = 1)) generate
	inst_alt_dspbuilder_single_pulse_GN2XGKTRR3_0: alt_dspbuilder_single_pulse_GN2XGKTRR3
		generic map(DELAY => 1, SIGNAL_TYPE => "Step Down", IMPULSE_WIDTH => 1)
		port map(aclr => aclr, clock => clock, ena => ena, result => result, sclr => sclr);
end generate;

assert not (((DELAY = 1) and (SIGNAL_TYPE = "Step Down") and (IMPULSE_WIDTH = 1)))
	report "Please run generate again" severity error;

end architecture rtl;

