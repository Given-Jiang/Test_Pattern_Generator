-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity StateMachineEditor1_import is
	port (
		clock : in std_logic;
		col_select : in std_logic_vector(3-1 downto 0);
		data : out std_logic_vector(24-1 downto 0);
		data_en : in std_logic;
		reset : in std_logic
	);
end entity StateMachineEditor1_import;

architecture rtl of StateMachineEditor1_import is

component StateMachineEditor1_import_GN is
	port (
		clock : in std_logic;
		col_select : in std_logic_vector(3-1 downto 0);
		data : out std_logic_vector(24-1 downto 0);
		data_en : in std_logic;
		reset : in std_logic
	);
end component StateMachineEditor1_import_GN;

begin

StateMachineEditor1_import_GN_0: if true generate
	inst_StateMachineEditor1_import_GN_0: StateMachineEditor1_import_GN
		port map(clock => clock, col_select => col_select, data => data, data_en => data_en, reset => reset);
end generate;

end architecture rtl;

