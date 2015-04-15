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
        
entity alt_dspbuilder_sImpulsennAltr is
	generic (     
			Impulsedelay	:	positive ;
			Impulsewidth	:	positive 
			);
	port 	( 
			clock		: in std_logic;
			ena			: in std_logic :='1';
			sclr		: in std_logic :='0';
            aclr		: in std_logic :='0';
			q		   : out std_logic
			);	
end alt_dspbuilder_sImpulsennAltr ;

architecture syn of alt_dspbuilder_sImpulsennAltr is

type States_ImpulseAltr is (sclear, slow, shigh,slowend);
signal current_state   : States_ImpulseAltr;
signal next_state      : States_ImpulseAltr;
signal count           : std_logic_vector(ToNatural(nbitnecessary(Impulsedelay)-1) downto 0);
signal countwidth      : std_logic_vector(ToNatural(nbitnecessary(Impulsewidth)-1) downto 0);
signal enawidth        : std_logic;

begin
	
	rp:process(clock,aclr)
	begin
		if aclr='1' then
            count <= (others=>'0');
			countwidth <= (others=>'0');
			current_state <= sclear;
        elsif clock'event and clock='1' then
			if (sclr='1') then 
				count <= (others=>'0');
				countwidth <= (others=>'0');
				current_state <= sclear;
			elsif  (ena='1') then
				count <= count+int2ustd(1,nbitnecessary(Impulsedelay));
				current_state <= next_state;
				if (enawidth='1') then
					countwidth <= countwidth+int2ustd(1,nbitnecessary(Impulsewidth));
				end if;
			end if;
		end if;		
	end process;

	cp:process(count, countwidth, current_state, sclr, ena)
	begin
		case current_state is
			when sclear =>
				q <= '0';
				enawidth <='0';
				if (ena='1') and (sclr='0') then
					next_state <= slow;
				else
					next_state <= sclear;					
				end if;
			when slow =>
				q <= '0';
				enawidth <='0';
				if (sclr='1') then
					next_state <= sclear;
				elsif (count=int2ustd(Impulsedelay-1,nbitnecessary(Impulsedelay))) and (ena='1') then
					next_state <= shigh;
				else
					next_state <= slow ;					
				end if;
	
			when shigh =>
				q <= '1';
				enawidth <='1';
				if (sclr='1') then
					next_state <= sclear;
				elsif (countwidth=int2ustd(Impulsewidth-1,nbitnecessary(Impulsewidth))) and (ena='1') then 
					next_state <= slowend ;					
				else
					next_state <= shigh;				
				end if;	

			when slowend =>
				q        <= '0';
				enawidth <='0';
				if (sclr='1') then
					next_state <= sclear;
				else
					next_state <= slowend ;					
				end if;	
		end case;
	end process;
end syn;
        
