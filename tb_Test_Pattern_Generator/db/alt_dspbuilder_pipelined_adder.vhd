-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_pipelined_adder is
	generic (
		OR_ACLR_INPUTS : natural := 1;
		SIGNED : integer := 0;
		NDIRECTION : integer := 1;
		USE_CARRY_OUT_PORT : natural := 1;
		USE_CARRY_PORT : natural := 1;
		WIDTH : natural := 0;
		PIPELINE : integer := 0
	);
	port (
		user_aclr : in std_logic := '0';
		result : out std_logic_vector(width-1 downto 0);
		clock : in std_logic := '0';
		dataa : in std_logic_vector(width-1 downto 0) := (others=>'0');
		datab : in std_logic_vector(width-1 downto 0) := (others=>'0');
		cout : out std_logic;
		add_sub : in std_logic := '0';
		aclr : in std_logic := '0';
		cin : in std_logic := '0';
		ena : in std_logic := '0'
	);
end entity alt_dspbuilder_pipelined_adder;

architecture rtl of alt_dspbuilder_pipelined_adder is

component alt_dspbuilder_pipelined_adder_GNWEIMU3MK is
	generic (
		OR_ACLR_INPUTS : natural := 1;
		SIGNED : integer := 0;
		NDIRECTION : integer := 0;
		USE_CARRY_OUT_PORT : natural := 0;
		USE_CARRY_PORT : natural := 0;
		WIDTH : natural := 0;
		PIPELINE : integer := 0
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		dataa : in std_logic_vector(0-1 downto 0) := (others=>'0');
		datab : in std_logic_vector(0-1 downto 0) := (others=>'0');
		ena : in std_logic := '0';
		result : out std_logic_vector(0-1 downto 0);
		user_aclr : in std_logic := '0'
	);
end component alt_dspbuilder_pipelined_adder_GNWEIMU3MK;

component alt_dspbuilder_pipelined_adder_GNTWZRTG4I is
	generic (
		OR_ACLR_INPUTS : natural := 1;
		SIGNED : integer := 0;
		NDIRECTION : integer := 1;
		USE_CARRY_OUT_PORT : natural := 0;
		USE_CARRY_PORT : natural := 0;
		WIDTH : natural := 0;
		PIPELINE : integer := 0
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		dataa : in std_logic_vector(0-1 downto 0) := (others=>'0');
		datab : in std_logic_vector(0-1 downto 0) := (others=>'0');
		ena : in std_logic := '0';
		result : out std_logic_vector(0-1 downto 0);
		user_aclr : in std_logic := '0'
	);
end component alt_dspbuilder_pipelined_adder_GNTWZRTG4I;

begin

alt_dspbuilder_pipelined_adder_GNWEIMU3MK_0: if ((OR_ACLR_INPUTS = 1) and (SIGNED = 0) and (NDIRECTION = 0) and (USE_CARRY_OUT_PORT = 0) and (USE_CARRY_PORT = 0) and (WIDTH = 0) and (PIPELINE = 0)) generate
	inst_alt_dspbuilder_pipelined_adder_GNWEIMU3MK_0: alt_dspbuilder_pipelined_adder_GNWEIMU3MK
		generic map(OR_ACLR_INPUTS => 1, SIGNED => 0, NDIRECTION => 0, USE_CARRY_OUT_PORT => 0, USE_CARRY_PORT => 0, WIDTH => 0, PIPELINE => 0)
		port map(aclr => aclr, clock => clock, dataa => dataa, datab => datab, ena => ena, result => result, user_aclr => user_aclr);
end generate;

alt_dspbuilder_pipelined_adder_GNTWZRTG4I_1: if ((OR_ACLR_INPUTS = 1) and (SIGNED = 0) and (NDIRECTION = 1) and (USE_CARRY_OUT_PORT = 0) and (USE_CARRY_PORT = 0) and (WIDTH = 0) and (PIPELINE = 0)) generate
	inst_alt_dspbuilder_pipelined_adder_GNTWZRTG4I_1: alt_dspbuilder_pipelined_adder_GNTWZRTG4I
		generic map(OR_ACLR_INPUTS => 1, SIGNED => 0, NDIRECTION => 1, USE_CARRY_OUT_PORT => 0, USE_CARRY_PORT => 0, WIDTH => 0, PIPELINE => 0)
		port map(aclr => aclr, clock => clock, dataa => dataa, datab => datab, ena => ena, result => result, user_aclr => user_aclr);
end generate;

assert not (((OR_ACLR_INPUTS = 1) and (SIGNED = 0) and (NDIRECTION = 0) and (USE_CARRY_OUT_PORT = 0) and (USE_CARRY_PORT = 0) and (WIDTH = 0) and (PIPELINE = 0)) or ((OR_ACLR_INPUTS = 1) and (SIGNED = 0) and (NDIRECTION = 1) and (USE_CARRY_OUT_PORT = 0) and (USE_CARRY_PORT = 0) and (WIDTH = 0) and (PIPELINE = 0)))
	report "Please run generate again" severity error;

end architecture rtl;

