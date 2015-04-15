library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_divider_GNKAPZN5MO is
	generic		( 			Signed : natural := 0;
			width : natural := 24;
			pipeline : natural := 0);

	port(
		aclr : in std_logic;
		clock : in std_logic;
		denom : in std_logic_vector((width)-1 downto 0);
		ena : in std_logic;
		numer : in std_logic_vector((width)-1 downto 0);
		quotient : out std_logic_vector((width)-1 downto 0);
		remain : out std_logic_vector((width)-1 downto 0);
		user_aclr : in std_logic);		
end entity;

architecture rtl of alt_dspbuilder_divider_GNKAPZN5MO is 
Begin


-- Divide Operator - Simulink Block "alt_dspbuilder_divider"
Divideri : alt_dspbuilder_dividerAltr generic map (
				widthin => 24,
				isunsigned => 1,
								pipeline => 0)
		port map (
				numer		=>	numer,
				denom		=>	denom,
				quotient	=>	quotient,
				remain		=>	remain,
				clock		=>	clock,
				clken		=>	ena,
				aclr		=>	aclr,
				user_aclr	=> 	user_aclr
		);
				

end architecture;		
				