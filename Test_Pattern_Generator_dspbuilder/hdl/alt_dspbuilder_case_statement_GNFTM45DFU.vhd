library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_case_statement_GNFTM45DFU is
	generic		( 			number_outputs : integer := 2;
			hasDefault : natural := 0;
			pipeline : natural := 0;
			width : integer := 16);

	port(
		clock : in std_logic;
		aclr : in std_logic;
		input : in std_logic_vector(15 downto 0);
		r0 : out std_logic;
		r1 : out std_logic);		
end entity;

architecture rtl of alt_dspbuilder_case_statement_GNFTM45DFU is 

begin
	caseproc:process( input )
		begin
				case input is
					when  "0000000000000000" =>
						r0 <= '1';
						r1 <= '0';
					when  "0000000000000100" =>
						r0 <= '0';
						r1 <= '1';
					when others =>
						r0 <= '0';
						r1 <= '0';
				end case;
	end process;
end architecture;
