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



library ieee ;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;
        
entity alt_dspbuilder_sImpulseAltr is
	generic 	(     
			Impulsedelay	:	positive ;
			Impulsewidth	:	positive 
			);
	port 	( 
			clock		: in std_logic;
			ena			: in std_logic :='1';
			sclr		: in std_logic :='0';
            aclr		: in std_logic :='0';
            user_aclr	: in std_logic :='0';
			q		   : out std_logic
			);	
end alt_dspbuilder_sImpulseAltr ;

architecture syn of alt_dspbuilder_sImpulseAltr is
signal aclr_i : std_logic;

begin

aclr_i <= aclr or user_aclr;

g1:if Impulsewidth=1 generate
	gr:if Impulsedelay=1 generate
		u0:	alt_dspbuilder_sImpulse11Altr port map (clock=> clock, ena => ena ,aclr => aclr_i, sclr => sclr, q =>q );	
	end generate gr;		
	grr:if Impulsedelay>1 generate
		u0:	alt_dspbuilder_sImpulsen1Altr 	generic map (Impulsedelay=>Impulsedelay) 
							port map (clock=> clock, ena => ena ,aclr => aclr_i, sclr => sclr, q =>q );	
	end generate grr;
end generate g1;


gn:if Impulsewidth>1 generate
	gr:if Impulsedelay=1 generate
		u0:	alt_dspbuilder_sImpulse1nAltr generic map (Impulsewidth=>Impulsewidth) 
							port map (clock=> clock, ena => ena ,aclr => aclr_i, sclr => sclr, q =>q );	
	end generate gr;		
	grr:if Impulsedelay>1 generate
		u0:	alt_dspbuilder_sImpulsennAltr 	generic map (Impulsedelay=>Impulsedelay, Impulsewidth=>Impulsewidth) 
							port map (clock=> clock, ena => ena ,aclr => aclr_i, sclr => sclr, q =>q );	
	end generate grr;
end generate gn;


end syn;
        
        


        
        

