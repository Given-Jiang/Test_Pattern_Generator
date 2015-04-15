library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_counter_GNKAA2ZBZG is
	generic		( 			use_usr_aclr : string := "false";
			use_ena : string := "false";
			use_cin : string := "false";
			use_sset : string := "false";
			ndirection : natural := 1;
			svalue : string := "1";
			use_sload : string := "false";
			use_sclr : string := "true";
			use_cout : string := "false";
			modulus : integer := 8388608;
			use_cnt_ena : string := "true";
			width : natural := 24;
			use_aset : string := "false";
			use_aload : string := "false";
			avalue : string := "0");

	port(
		aclr : in std_logic;
		aload : in std_logic;
		aset : in std_logic;
		cin : in std_logic;
		clock : in std_logic;
		cnt_ena : in std_logic;
		cout : out std_logic;
		data : in std_logic_vector((width)-1 downto 0);
		direction : in std_logic;
		ena : in std_logic;
		q : out std_logic_vector((width)-1 downto 0);
		sclr : in std_logic;
		sload : in std_logic;
		sset : in std_logic;
		user_aclr : in std_logic);		
end entity;

architecture rtl of alt_dspbuilder_counter_GNKAA2ZBZG is 


Begin


	-- DSP Builder Block - Simulink Block "Counter"
	Counteri : lpm_counter  Generic map (
					LPM_WIDTH		=> 24,
					LPM_DIRECTION	=> "UP",
					LPM_MODULUS		=> 8388608,
					LPM_AVALUE		=> "0",
					LPM_SVALUE		=> "1",
					LPM_TYPE		=> "LPM_COUNTER"
					)
			port map (
					clock	=>	clock,
					cnt_en	=>	cnt_ena,
					aclr	=>	aclr,
					sclr	=>	sclr,
					q		=>	q);

end architecture;
