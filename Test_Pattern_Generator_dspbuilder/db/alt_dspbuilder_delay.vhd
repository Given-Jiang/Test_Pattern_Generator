-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_delay is
	generic (
		CLOCKPHASE : string := "1";
		DELAY : positive := 1;
		USE_INIT : natural := 0;
		BITPATTERN : string := "00000001";
		WIDTH : positive := 8
	);
	port (
		input : in std_logic_vector(width-1 downto 0) := (others=>'0');
		clock : in std_logic := '0';
		sclr : in std_logic := '0';
		aclr : in std_logic := '0';
		output : out std_logic_vector(width-1 downto 0);
		ena : in std_logic := '0'
	);
end entity alt_dspbuilder_delay;

architecture rtl of alt_dspbuilder_delay is

component alt_dspbuilder_delay_GNPJ4Y7BVC is
	generic (
		CLOCKPHASE : string := "1";
		DELAY : positive := 1;
		USE_INIT : natural := 1;
		BITPATTERN : string := "00000000000000000000000000100000";
		WIDTH : positive := 32
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		ena : in std_logic := '0';
		input : in std_logic_vector(32-1 downto 0) := (others=>'0');
		output : out std_logic_vector(32-1 downto 0);
		sclr : in std_logic := '0'
	);
end component alt_dspbuilder_delay_GNPJ4Y7BVC;

component alt_dspbuilder_delay_GNIYBMGPQQ is
	generic (
		CLOCKPHASE : string := "1";
		DELAY : positive := 1;
		USE_INIT : natural := 0;
		BITPATTERN : string := "000000000000000000001111";
		WIDTH : positive := 24
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		ena : in std_logic := '0';
		input : in std_logic_vector(24-1 downto 0) := (others=>'0');
		output : out std_logic_vector(24-1 downto 0);
		sclr : in std_logic := '0'
	);
end component alt_dspbuilder_delay_GNIYBMGPQQ;

component alt_dspbuilder_delay_GNNBTO2F3L is
	generic (
		CLOCKPHASE : string := "1";
		DELAY : positive := 1;
		USE_INIT : natural := 0;
		BITPATTERN : string := "000000000000000000000010";
		WIDTH : positive := 24
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		ena : in std_logic := '0';
		input : in std_logic_vector(24-1 downto 0) := (others=>'0');
		output : out std_logic_vector(24-1 downto 0);
		sclr : in std_logic := '0'
	);
end component alt_dspbuilder_delay_GNNBTO2F3L;

component alt_dspbuilder_delay_GNVJUPFOX3 is
	generic (
		CLOCKPHASE : string := "1";
		DELAY : positive := 1;
		USE_INIT : natural := 0;
		BITPATTERN : string := "000000000000000000000000";
		WIDTH : positive := 24
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		ena : in std_logic := '0';
		input : in std_logic_vector(24-1 downto 0) := (others=>'0');
		output : out std_logic_vector(24-1 downto 0);
		sclr : in std_logic := '0'
	);
end component alt_dspbuilder_delay_GNVJUPFOX3;

begin

alt_dspbuilder_delay_GNPJ4Y7BVC_0: if ((CLOCKPHASE = "1") and (DELAY = 1) and (USE_INIT = 1) and (BITPATTERN = "00000000000000000000000000100000") and (WIDTH = 32)) generate
	inst_alt_dspbuilder_delay_GNPJ4Y7BVC_0: alt_dspbuilder_delay_GNPJ4Y7BVC
		generic map(CLOCKPHASE => "1", DELAY => 1, USE_INIT => 1, BITPATTERN => "00000000000000000000000000100000", WIDTH => 32)
		port map(aclr => aclr, clock => clock, ena => ena, input => input, output => output, sclr => sclr);
end generate;

alt_dspbuilder_delay_GNIYBMGPQQ_1: if ((CLOCKPHASE = "1") and (DELAY = 1) and (USE_INIT = 0) and (BITPATTERN = "000000000000000000001111") and (WIDTH = 24)) generate
	inst_alt_dspbuilder_delay_GNIYBMGPQQ_1: alt_dspbuilder_delay_GNIYBMGPQQ
		generic map(CLOCKPHASE => "1", DELAY => 1, USE_INIT => 0, BITPATTERN => "000000000000000000001111", WIDTH => 24)
		port map(aclr => aclr, clock => clock, ena => ena, input => input, output => output, sclr => sclr);
end generate;

alt_dspbuilder_delay_GNNBTO2F3L_2: if ((CLOCKPHASE = "1") and (DELAY = 1) and (USE_INIT = 0) and (BITPATTERN = "000000000000000000000010") and (WIDTH = 24)) generate
	inst_alt_dspbuilder_delay_GNNBTO2F3L_2: alt_dspbuilder_delay_GNNBTO2F3L
		generic map(CLOCKPHASE => "1", DELAY => 1, USE_INIT => 0, BITPATTERN => "000000000000000000000010", WIDTH => 24)
		port map(aclr => aclr, clock => clock, ena => ena, input => input, output => output, sclr => sclr);
end generate;

alt_dspbuilder_delay_GNVJUPFOX3_3: if ((CLOCKPHASE = "1") and (DELAY = 1) and (USE_INIT = 0) and (BITPATTERN = "000000000000000000000000") and (WIDTH = 24)) generate
	inst_alt_dspbuilder_delay_GNVJUPFOX3_3: alt_dspbuilder_delay_GNVJUPFOX3
		generic map(CLOCKPHASE => "1", DELAY => 1, USE_INIT => 0, BITPATTERN => "000000000000000000000000", WIDTH => 24)
		port map(aclr => aclr, clock => clock, ena => ena, input => input, output => output, sclr => sclr);
end generate;

assert not (((CLOCKPHASE = "1") and (DELAY = 1) and (USE_INIT = 1) and (BITPATTERN = "00000000000000000000000000100000") and (WIDTH = 32)) or ((CLOCKPHASE = "1") and (DELAY = 1) and (USE_INIT = 0) and (BITPATTERN = "000000000000000000001111") and (WIDTH = 24)) or ((CLOCKPHASE = "1") and (DELAY = 1) and (USE_INIT = 0) and (BITPATTERN = "000000000000000000000010") and (WIDTH = 24)) or ((CLOCKPHASE = "1") and (DELAY = 1) and (USE_INIT = 0) and (BITPATTERN = "000000000000000000000000") and (WIDTH = 24)))
	report "Please run generate again" severity error;

end architecture rtl;

