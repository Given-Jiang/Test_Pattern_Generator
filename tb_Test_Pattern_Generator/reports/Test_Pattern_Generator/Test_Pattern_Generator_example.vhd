library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
entity Test_Pattern_Generator_example is  
	port(
		Avalon_ST_Source_startofpacket : out STD_LOGIC;
		Avalon_MM_Slave_address : in STD_LOGIC_VECTOR(1 downto 0);
		Avalon_ST_Source_valid : out STD_LOGIC;
		Avalon_MM_Slave_writedata : in STD_LOGIC_VECTOR(31 downto 0);
		Clock : in STD_LOGIC;
		Avalon_ST_Source_ready : in STD_LOGIC;
		aclr : in STD_LOGIC;
		Avalon_MM_Slave_write : in STD_LOGIC;
		Avalon_ST_Source_data : out STD_LOGIC_VECTOR(23 downto 0);
		Avalon_ST_Source_endofpacket : out STD_LOGIC); 
end entity;
architecture rtl of Test_Pattern_Generator_example is
component Test_Pattern_Generator
	  
	port(
		Avalon_ST_Source_startofpacket : out STD_LOGIC;
		Avalon_MM_Slave_address : in STD_LOGIC_VECTOR(1 downto 0);
		Avalon_ST_Source_valid : out STD_LOGIC;
		Avalon_MM_Slave_writedata : in STD_LOGIC_VECTOR(31 downto 0);
		Clock : in STD_LOGIC;
		Avalon_ST_Source_ready : in STD_LOGIC;
		aclr : in STD_LOGIC;
		Avalon_MM_Slave_write : in STD_LOGIC;
		Avalon_ST_Source_data : out STD_LOGIC_VECTOR(23 downto 0);
		Avalon_ST_Source_endofpacket : out STD_LOGIC); 
end component;
begin
	Test_Pattern_Generator_instance : 
		component Test_Pattern_Generator
			port map(
				Avalon_ST_Source_startofpacket => Avalon_ST_Source_startofpacket,
				Avalon_MM_Slave_address => Avalon_MM_Slave_address,
				Avalon_ST_Source_valid => Avalon_ST_Source_valid,
				Avalon_MM_Slave_writedata => Avalon_MM_Slave_writedata,
				Clock => Clock,
				Avalon_ST_Source_ready => Avalon_ST_Source_ready,
				aclr => aclr,
				Avalon_MM_Slave_write => Avalon_MM_Slave_write,
				Avalon_ST_Source_data => Avalon_ST_Source_data,
				Avalon_ST_Source_endofpacket => Avalon_ST_Source_endofpacket);
end architecture rtl;
