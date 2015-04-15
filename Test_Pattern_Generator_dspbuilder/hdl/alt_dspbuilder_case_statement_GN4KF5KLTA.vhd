library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_case_statement_GN4KF5KLTA is
	generic		( 			number_outputs : integer := 5;
			hasDefault : natural := 1;
			pipeline : natural := 0;
			width : integer := 3);

	port(
		clock : in std_logic;
		aclr : in std_logic;
		input : in std_logic_vector(2 downto 0);
		r0 : out std_logic;
		r1 : out std_logic;
		r2 : out std_logic;
		r3 : out std_logic;
		r4 : out std_logic);		
end entity;

architecture rtl of alt_dspbuilder_case_statement_GN4KF5KLTA is 

begin
	caseproc:process( input )
		begin
				case input is
					when  "000" =>
						r0 <= '1';
						r1 <= '0';
						r2 <= '0';
						r3 <= '0';
						r4 <= '0';
					when  "001" =>
						r0 <= '0';
						r1 <= '1';
						r2 <= '0';
						r3 <= '0';
						r4 <= '0';
					when  "010" =>
						r0 <= '0';
						r1 <= '0';
						r2 <= '1';
						r3 <= '0';
						r4 <= '0';
					when  "100" =>
						r0 <= '0';
						r1 <= '0';
						r2 <= '0';
						r3 <= '1';
						r4 <= '0';
					when others =>
						r0 <= '0';
						r1 <= '0';
						r2 <= '0';
						r3 <= '0';
						r4 <= '1';
				end case;
	end process;
end architecture;
