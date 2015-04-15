-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_decoder is
	generic (
		DECODE : string := "00000000";
		PIPELINE : natural := 0;
		WIDTH : natural := 8
	);
	port (
		dec : out std_logic;
		clock : in std_logic;
		sclr : in std_logic;
		data : in std_logic_vector(width-1 downto 0);
		aclr : in std_logic;
		ena : in std_logic
	);
end entity alt_dspbuilder_decoder;

architecture rtl of alt_dspbuilder_decoder is

component alt_dspbuilder_decoder_GNM4LOIHXZ is
	generic (
		DECODE : string := "01";
		PIPELINE : natural := 1;
		WIDTH : natural := 2
	);
	port (
		aclr : in std_logic;
		clock : in std_logic;
		data : in std_logic_vector(2-1 downto 0);
		dec : out std_logic;
		ena : in std_logic;
		sclr : in std_logic
	);
end component alt_dspbuilder_decoder_GNM4LOIHXZ;

begin

alt_dspbuilder_decoder_GNM4LOIHXZ_0: if ((DECODE = "01") and (PIPELINE = 1) and (WIDTH = 2)) generate
	inst_alt_dspbuilder_decoder_GNM4LOIHXZ_0: alt_dspbuilder_decoder_GNM4LOIHXZ
		generic map(DECODE => "01", PIPELINE => 1, WIDTH => 2)
		port map(aclr => aclr, clock => clock, data => data, dec => dec, ena => ena, sclr => sclr);
end generate;

assert not (((DECODE = "01") and (PIPELINE = 1) and (WIDTH = 2)))
	report "Please run generate again" severity error;

end architecture rtl;

