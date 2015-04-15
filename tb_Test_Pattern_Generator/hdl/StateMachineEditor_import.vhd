-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity StateMachineEditor_import is
	port (
		clock : in std_logic;
		counter : in std_logic_vector(24-1 downto 0);
		data_end : in std_logic;
		ready : in std_logic;
		reset : in std_logic;
		state : out std_logic_vector(3-1 downto 0)
	);
end entity StateMachineEditor_import;

architecture rtl of StateMachineEditor_import is

component StateMachineEditor_import_GN is
	port (
		clock : in std_logic;
		counter : in std_logic_vector(24-1 downto 0);
		data_end : in std_logic;
		ready : in std_logic;
		reset : in std_logic;
		state : out std_logic_vector(3-1 downto 0)
	);
end component StateMachineEditor_import_GN;

begin

StateMachineEditor_import_GN_0: if true generate
	inst_StateMachineEditor_import_GN_0: StateMachineEditor_import_GN
		port map(clock => clock, counter => counter, data_end => data_end, ready => ready, reset => reset, state => state);
end generate;

end architecture rtl;

