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
        
entity alt_dspbuilder_sStepAltr is
	generic 	(     
			StepDelay	:	positive ;
			direction	:	natural 
			);
	port 	( 
			clock		: in std_logic;
			ena			: in std_logic :='1';
			sclr		: in std_logic :='0';
            aclr		: in std_logic :='0';
            user_aclr	: in std_logic :='0';
			q		   : out std_logic
			);	
end alt_dspbuilder_sStepAltr ;

architecture syn of alt_dspbuilder_sStepAltr is

type States_StepAltr is (sclear, slow, shigh);
signal current_state   : States_StepAltr;
signal next_state      : States_StepAltr;
signal iq              : std_logic;
signal count           : std_logic_vector(ToNatural(nbitnecessary(StepDelay)-1) downto 0);
signal aclr_i          : std_logic;

begin

aclr_i <= aclr or user_aclr;

gr:if StepDelay=1 generate
	process(clock,aclr_i)
	begin
        if aclr_i='1' then
		    iq <= '0';
        elsif clock'event and clock='1' then
			if (sclr='1') then 
				iq <= '0';
			elsif  (ena='1') then
				iq <='1';
			end if;
		end if;		
	end process;
end generate gr;


grr:if StepDelay>1 generate

	rp:process(clock,aclr_i)
	begin
		if aclr_i='1' then
		    count <= (others=>'0');
			current_state <= sclear;
        elsif clock'event and clock='1' then
			if (sclr='1') then 
				count <= (others=>'0');
				current_state <= sclear;
			elsif  (ena='1') then
				count <= count+int2ustd(1,nbitnecessary(StepDelay));
				current_state <= next_state;
			end if;
		end if;		
	end process;

	cp:process(count, current_state, sclr,ena)
	begin
		case current_state is
			when sclear =>
				iq <= '0';
				if (ena='1') and (sclr='0') then
					next_state <= slow;
				else
					next_state <= sclear;					
				end if;
			when slow =>
				iq <= '0';
				if (sclr='1') then
					next_state <= sclear;
				elsif (count=int2ustd(StepDelay-1,nbitnecessary(StepDelay))) and (ena ='1') then
					next_state <= shigh;
				else
					next_state <= slow ;					
				end if;
	
			when shigh =>
				iq <= '1';
				if (sclr='1') then
					next_state <= sclear;
				else
					next_state <= shigh ;					
				end if;						
		end case;
	end process;
	
end generate grr;


g1: if 1=direction generate
	q <= iq;
end generate g1;

g0: if 0=direction generate
	q <= not iq;
end generate g0;

end syn;
        
        


