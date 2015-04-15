library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
entity tb_Test_Pattern_Generator_example is   
end entity;
architecture rtl of tb_Test_Pattern_Generator_example is
component tb_Test_Pattern_Generator
	   
end component;
begin
	tb_Test_Pattern_Generator_instance : 
		component tb_Test_Pattern_Generator
			port map();
end architecture rtl;
