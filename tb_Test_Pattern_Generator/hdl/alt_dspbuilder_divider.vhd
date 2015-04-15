-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_divider is
	generic (
		SIGNED : natural := 0;
		WIDTH : natural := 8;
		PIPELINE : natural := 0
	);
	port (
		user_aclr : in std_logic;
		denom : in std_logic_vector(width-1 downto 0);
		quotient : out std_logic_vector(width-1 downto 0);
		remain : out std_logic_vector(width-1 downto 0);
		numer : in std_logic_vector(width-1 downto 0);
		clock : in std_logic;
		aclr : in std_logic;
		ena : in std_logic
	);
end entity alt_dspbuilder_divider;

architecture rtl of alt_dspbuilder_divider is

component alt_dspbuilder_divider_GNKAPZN5MO is
	generic (
		SIGNED : natural := 0;
		WIDTH : natural := 24;
		PIPELINE : natural := 0
	);
	port (
		aclr : in std_logic;
		clock : in std_logic;
		denom : in std_logic_vector(24-1 downto 0);
		ena : in std_logic;
		numer : in std_logic_vector(24-1 downto 0);
		quotient : out std_logic_vector(24-1 downto 0);
		remain : out std_logic_vector(24-1 downto 0);
		user_aclr : in std_logic
	);
end component alt_dspbuilder_divider_GNKAPZN5MO;

begin

alt_dspbuilder_divider_GNKAPZN5MO_0: if ((SIGNED = 0) and (WIDTH = 24) and (PIPELINE = 0)) generate
	inst_alt_dspbuilder_divider_GNKAPZN5MO_0: alt_dspbuilder_divider_GNKAPZN5MO
		generic map(SIGNED => 0, WIDTH => 24, PIPELINE => 0)
		port map(aclr => aclr, clock => clock, denom => denom, ena => ena, numer => numer, quotient => quotient, remain => remain, user_aclr => user_aclr);
end generate;

assert not (((SIGNED = 0) and (WIDTH = 24) and (PIPELINE = 0)))
	report "Please run generate again" severity error;

end architecture rtl;

