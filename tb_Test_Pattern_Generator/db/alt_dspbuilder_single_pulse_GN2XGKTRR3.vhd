library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_single_pulse_GN2XGKTRR3 is
	generic		( 			delay : positive := 1;
			signal_type : string := "Step Down";
			impulse_width : positive := 1);

	port(
		aclr : in std_logic;
		clock : in std_logic;
		ena : in std_logic;
		result : out std_logic;
		sclr : in std_logic);		
end entity;

architecture rtl of alt_dspbuilder_single_pulse_GN2XGKTRR3 is 

Begin
SinglePulsei : alt_dspbuilder_sStepAltr  Generic map (
				StepDelay	=>	1,
				direction	=>	 0 				)
		port map (
				clock	=>	clock,
				ena	=>	ena,
				q	=>	result,
				sclr	=>	sclr,
				user_aclr => '0',
				aclr	=> aclr);
								
end architecture;
