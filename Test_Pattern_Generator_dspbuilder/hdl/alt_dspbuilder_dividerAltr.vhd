--------------------------------------------------------------------------------------------
-- DSP Builder (Version 9.1)
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: © 2001 Altera Corporation. All rights reserved.  Your use of Altera 
-- Corporation's design tools, logic functions and other software and tools, and its 
-- AMPP partner logic functions, and any output files any of the foregoing 
-- (including device programming or simulation files), and any associated 
-- documentation or information are expressly subject to the terms and conditions 
-- of the Altera Program License Subscription Agreement, Altera MegaCore Function 
-- License Agreement, or other applicable license agreement, including, without 
-- limitation, that your use is for the sole purpose of programming logic devices 
-- manufactured by Altera and sold by Altera or its authorized distributors.  
-- Please refer to the applicable agreement for further details.
--------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

library lpm;
use lpm.lpm_components.all;

library altera;
use altera.alt_dspbuilder_package.all;


entity alt_dspbuilder_dividerAltr is
	generic (     
				widthin		: natural :=8;
				pipeline	: natural :=0;
				isunsigned	: natural :=0
			);
	port
	(
		clock		: in std_logic ;
        aclr        : in std_logic ;
        user_aclr   : in std_logic ;
		clken		: in std_logic ;
		numer		: in std_logic_vector (widthin-1 downto 0);
		denom		: in std_logic_vector (widthin-1 downto 0);
		quotient	: out std_logic_vector (widthin-1 downto 0);
		remain		: out std_logic_vector (widthin-1 downto 0)
	);
end alt_dspbuilder_dividerAltr;

architecture syn of alt_dspbuilder_dividerAltr is

signal svcc			: std_logic;
signal aclr_i       : std_logic;

begin

aclr_i <= aclr or user_aclr;

svcc <='1';
gsgn: if (isunsigned=0) generate
	gcomb:if pipeline=0 generate		
		u0 : lpm_divide	generic map (
									lpm_widthn => widthin,
									lpm_widthd => widthin,
									lpm_type => "LPM_DIVIDE",
									lpm_nrepresentation => "SIGNED",
									lpm_hint => "LPM_REMAINDERPOSITIVE=FALSE",
									lpm_drepresentation => "SIGNED"
									)
							port map (
									denom => denom,
									numer => numer,
									quotient => quotient,
									remain => remain
									);
	end generate gcomb;	
	gseq:if pipeline>0 generate		
		u0 : lpm_divide
						generic map (
							lpm_widthn => widthin,
							lpm_widthd => widthin,
							lpm_pipeline => pipeline,
							lpm_type => "LPM_DIVIDE",
							lpm_nrepresentation => "SIGNED",
							lpm_hint => "LPM_REMAINDERPOSITIVE=FALSE",
							lpm_drepresentation => "SIGNED"
						)
						port map (
							clken => clken,
							denom => denom,
							aclr => aclr_i,
							clock => clock,
							numer => numer,
							quotient => quotient,
							remain => remain
						);
	end generate gseq; 
end generate gsgn;

gugn: if (isunsigned>0) generate

	gcomb:if pipeline=0 generate		
		u0 : lpm_divide	generic map (
									lpm_widthn => widthin,
									lpm_widthd => widthin,
									lpm_type => "LPM_DIVIDE",
									lpm_nrepresentation => "UNSIGNED",
									lpm_hint => "LPM_REMAINDERPOSITIVE=TRUE",
									lpm_drepresentation => "UNSIGNED"
									)
							port map (
									denom => denom,
									numer => numer,
									quotient => quotient,
									remain => remain
									);
	end generate gcomb;	
	gseq:if pipeline>0 generate		
		u0 : lpm_divide
						generic map (
							lpm_widthn => widthin,
							lpm_widthd => widthin,
							lpm_pipeline => pipeline,
							lpm_type => "LPM_DIVIDE",
							lpm_nrepresentation => "UNSIGNED",
							lpm_hint => "LPM_REMAINDERPOSITIVE=TRUE",
							lpm_drepresentation => "UNSIGNED"
						)
						port map (
							clken => svcc,
							denom => denom,
							aclr => aclr_i,
							clock => clock,
							numer => numer,
							quotient => quotient,
							remain => remain
						);
	end generate gseq; 
end generate gugn;
end syn;







