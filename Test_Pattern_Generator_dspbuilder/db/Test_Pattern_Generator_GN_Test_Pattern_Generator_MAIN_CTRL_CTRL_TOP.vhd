-- Test_Pattern_Generator_GN_Test_Pattern_Generator_MAIN_CTRL_CTRL_TOP.vhd

-- Generated using ACDS version 13.1 162 at 2015.02.27.10:05:29

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Test_Pattern_Generator_GN_Test_Pattern_Generator_MAIN_CTRL_CTRL_TOP is
	port (
		Clock     : in  std_logic                     := '0';             --     Clock.clk
		aclr      : in  std_logic                     := '0';             --          .reset
		check_en  : out std_logic;                                        --  check_en.wire
		pixel_num : in  std_logic_vector(47 downto 0) := (others => '0'); -- pixel_num.wire
		ready     : in  std_logic                     := '0';             --     ready.wire
		data_en   : out std_logic;                                        --   data_en.wire
		counter   : in  std_logic_vector(23 downto 0) := (others => '0'); --   counter.wire
		ctrl_en   : out std_logic                                         --   ctrl_en.wire
	);
end entity Test_Pattern_Generator_GN_Test_Pattern_Generator_MAIN_CTRL_CTRL_TOP;

architecture rtl of Test_Pattern_Generator_GN_Test_Pattern_Generator_MAIN_CTRL_CTRL_TOP is
	component alt_dspbuilder_clock_GNQFU4PUDH is
		port (
			aclr      : in  std_logic := 'X'; -- reset
			aclr_n    : in  std_logic := 'X'; -- reset_n
			aclr_out  : out std_logic;        -- reset
			clock     : in  std_logic := 'X'; -- clk
			clock_out : out std_logic         -- clk
		);
	end component alt_dspbuilder_clock_GNQFU4PUDH;

	component alt_dspbuilder_port_GN37ALZBS4 is
		port (
			input  : in  std_logic := 'X'; -- wire
			output : out std_logic         -- wire
		);
	end component alt_dspbuilder_port_GN37ALZBS4;

	component StateMachineEditor is
		port (
			clock    : in  std_logic                     := 'X';             -- clk
			counter  : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			data_end : in  std_logic                     := 'X';             -- wire
			ready    : in  std_logic                     := 'X';             -- wire
			reset    : in  std_logic                     := 'X';             -- wire
			state    : out std_logic_vector(2 downto 0)                      -- wire
		);
	end component StateMachineEditor;

	component alt_dspbuilder_pipelined_adder_GNTWZRTG4I is
		generic (
			width    : natural := 0;
			pipeline : integer := 0
		);
		port (
			aclr      : in  std_logic                          := 'X';             -- clk
			add_sub   : in  std_logic                          := 'X';             -- wire
			cin       : in  std_logic                          := 'X';             -- wire
			clock     : in  std_logic                          := 'X';             -- clk
			cout      : out std_logic;                                             -- wire
			dataa     : in  std_logic_vector(width-1 downto 0) := (others => 'X'); -- wire
			datab     : in  std_logic_vector(width-1 downto 0) := (others => 'X'); -- wire
			ena       : in  std_logic                          := 'X';             -- wire
			result    : out std_logic_vector(width-1 downto 0);                    -- wire
			user_aclr : in  std_logic                          := 'X'              -- wire
		);
	end component alt_dspbuilder_pipelined_adder_GNTWZRTG4I;

	component alt_dspbuilder_gnd_GN is
		port (
			output : out std_logic   -- wire
		);
	end component alt_dspbuilder_gnd_GN;

	component alt_dspbuilder_vcc_GN is
		port (
			output : out std_logic   -- wire
		);
	end component alt_dspbuilder_vcc_GN;

	component alt_dspbuilder_case_statement_GN4KF5KLTA is
		generic (
			number_outputs : integer := 8;
			hasDefault     : natural := 0;
			pipeline       : natural := 0;
			width          : integer := 8
		);
		port (
			clock : in  std_logic                    := 'X';             -- clk
			aclr  : in  std_logic                    := 'X';             -- reset
			input : in  std_logic_vector(2 downto 0) := (others => 'X'); -- wire
			r0    : out std_logic;                                       -- wire
			r1    : out std_logic;                                       -- wire
			r2    : out std_logic;                                       -- wire
			r3    : out std_logic;                                       -- wire
			r4    : out std_logic                                        -- wire
		);
	end component alt_dspbuilder_case_statement_GN4KF5KLTA;

	component alt_dspbuilder_if_statement_GNIV4UP6ZO is
		generic (
			use_else_output : natural := 0;
			bwr             : natural := 0;
			use_else_input  : natural := 0;
			signed          : natural := 1;
			HDLTYPE         : string  := "STD_LOGIC_VECTOR";
			if_expression   : string  := "a";
			number_inputs   : integer := 1;
			width           : natural := 8
		);
		port (
			true : out std_logic;                                        -- wire
			a    : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			b    : in  std_logic_vector(23 downto 0) := (others => 'X')  -- wire
		);
	end component alt_dspbuilder_if_statement_GNIV4UP6ZO;

	component alt_dspbuilder_port_GNOC3SGKQJ is
		port (
			input  : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(23 downto 0)                     -- wire
		);
	end component alt_dspbuilder_port_GNOC3SGKQJ;

	component alt_dspbuilder_single_pulse_GN2XGKTRR3 is
		generic (
			delay         : positive := 1;
			signal_type   : string   := "Impulse";
			impulse_width : positive := 1
		);
		port (
			aclr   : in  std_logic := 'X'; -- clk
			clock  : in  std_logic := 'X'; -- clk
			ena    : in  std_logic := 'X'; -- wire
			result : out std_logic;        -- wire
			sclr   : in  std_logic := 'X'  -- wire
		);
	end component alt_dspbuilder_single_pulse_GN2XGKTRR3;

	component alt_dspbuilder_constant_GNQJ63TWA6 is
		generic (
			HDLTYPE    : string  := "STD_LOGIC_VECTOR";
			BitPattern : string  := "0000";
			width      : natural := 4
		);
		port (
			output : out std_logic_vector(23 downto 0)   -- wire
		);
	end component alt_dspbuilder_constant_GNQJ63TWA6;

	component alt_dspbuilder_port_GNUJT4YY5I is
		port (
			input  : in  std_logic_vector(47 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(47 downto 0)                     -- wire
		);
	end component alt_dspbuilder_port_GNUJT4YY5I;

	component alt_dspbuilder_cast_GNKIWLRTQI is
		generic (
			round    : natural := 0;
			saturate : natural := 0
		);
		port (
			input  : in  std_logic_vector(47 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(23 downto 0)                     -- wire
		);
	end component alt_dspbuilder_cast_GNKIWLRTQI;

	component alt_dspbuilder_cast_GN5P6ORZXA is
		generic (
			round    : natural := 0;
			saturate : natural := 0
		);
		port (
			input  : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(23 downto 0)                     -- wire
		);
	end component alt_dspbuilder_cast_GN5P6ORZXA;

	component alt_dspbuilder_cast_GNLWRZWTQF is
		generic (
			round    : natural := 0;
			saturate : natural := 0
		);
		port (
			input  : in  std_logic_vector(2 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(2 downto 0)                     -- wire
		);
	end component alt_dspbuilder_cast_GNLWRZWTQF;

	signal pipelined_adder1user_aclrgnd_output_wire : std_logic;                     -- Pipelined_Adder1user_aclrGND:output -> Pipelined_Adder1:user_aclr
	signal pipelined_adder1enavcc_output_wire       : std_logic;                     -- Pipelined_Adder1enaVCC:output -> Pipelined_Adder1:ena
	signal single_pulsesclrgnd_output_wire          : std_logic;                     -- Single_PulsesclrGND:output -> Single_Pulse:sclr
	signal single_pulseenavcc_output_wire           : std_logic;                     -- Single_PulseenaVCC:output -> Single_Pulse:ena
	signal counter_0_output_wire                    : std_logic_vector(23 downto 0); -- counter_0:output -> [If_Statement6:a, cast27:input]
	signal constant15_output_wire                   : std_logic_vector(23 downto 0); -- Constant15:output -> Pipelined_Adder1:datab
	signal pipelined_adder1_result_wire             : std_logic_vector(23 downto 0); -- Pipelined_Adder1:result -> If_Statement6:b
	signal single_pulse_result_wire                 : std_logic;                     -- Single_Pulse:result -> State_Machine_Editor:reset
	signal ready_0_output_wire                      : std_logic;                     -- ready_0:output -> State_Machine_Editor:ready
	signal if_statement6_true_wire                  : std_logic;                     -- If_Statement6:true -> State_Machine_Editor:data_end
	signal case_statement_r1_wire                   : std_logic;                     -- Case_Statement:r1 -> ctrl_en_0:input
	signal case_statement_r2_wire                   : std_logic;                     -- Case_Statement:r2 -> data_en_0:input
	signal case_statement_r3_wire                   : std_logic;                     -- Case_Statement:r3 -> check_en_0:input
	signal pixel_num_0_output_wire                  : std_logic_vector(47 downto 0); -- pixel_num_0:output -> cast26:input
	signal cast26_output_wire                       : std_logic_vector(23 downto 0); -- cast26:output -> Pipelined_Adder1:dataa
	signal cast27_output_wire                       : std_logic_vector(23 downto 0); -- cast27:output -> State_Machine_Editor:counter
	signal state_machine_editor_state_wire          : std_logic_vector(2 downto 0);  -- State_Machine_Editor:state -> cast28:input
	signal cast28_output_wire                       : std_logic_vector(2 downto 0);  -- cast28:output -> Case_Statement:input
	signal clock_0_clock_output_clk                 : std_logic;                     -- Clock_0:clock_out -> [Case_Statement:clock, Pipelined_Adder1:clock, Single_Pulse:clock, State_Machine_Editor:clock]
	signal clock_0_clock_output_reset               : std_logic;                     -- Clock_0:aclr_out -> [Case_Statement:aclr, Pipelined_Adder1:aclr, Single_Pulse:aclr]

begin

	clock_0 : component alt_dspbuilder_clock_GNQFU4PUDH
		port map (
			clock_out => clock_0_clock_output_clk,   -- clock_output.clk
			aclr_out  => clock_0_clock_output_reset, --             .reset
			clock     => Clock,                      --        clock.clk
			aclr      => aclr                        --             .reset
		);

	ctrl_en_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => case_statement_r1_wire, --  input.wire
			output => ctrl_en                 -- output.wire
		);

	state_machine_editor : component StateMachineEditor
		port map (
			clock    => clock_0_clock_output_clk,        --    clock.clk
			reset    => single_pulse_result_wire,        --    reset.wire
			ready    => ready_0_output_wire,             --    ready.wire
			counter  => cast27_output_wire,              --  counter.wire
			data_end => if_statement6_true_wire,         -- data_end.wire
			state    => state_machine_editor_state_wire  --    state.wire
		);

	pipelined_adder1 : component alt_dspbuilder_pipelined_adder_GNTWZRTG4I
		generic map (
			width    => 24,
			pipeline => 2
		)
		port map (
			clock     => clock_0_clock_output_clk,                 -- clock_aclr.clk
			aclr      => clock_0_clock_output_reset,               --           .reset
			dataa     => cast26_output_wire,                       --      dataa.wire
			datab     => constant15_output_wire,                   --      datab.wire
			result    => pipelined_adder1_result_wire,             --     result.wire
			user_aclr => pipelined_adder1user_aclrgnd_output_wire, --  user_aclr.wire
			ena       => pipelined_adder1enavcc_output_wire        --        ena.wire
		);

	pipelined_adder1user_aclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => pipelined_adder1user_aclrgnd_output_wire  -- output.wire
		);

	pipelined_adder1enavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => pipelined_adder1enavcc_output_wire  -- output.wire
		);

	case_statement : component alt_dspbuilder_case_statement_GN4KF5KLTA
		generic map (
			number_outputs => 5,
			hasDefault     => 1,
			pipeline       => 0,
			width          => 3
		)
		port map (
			clock => clock_0_clock_output_clk,   -- clock_aclr.clk
			aclr  => clock_0_clock_output_reset, --           .reset
			input => cast28_output_wire,         --      input.wire
			r0    => open,                       --         r0.wire
			r1    => case_statement_r1_wire,     --         r1.wire
			r2    => case_statement_r2_wire,     --         r2.wire
			r3    => case_statement_r3_wire,     --         r3.wire
			r4    => open                        --         r4.wire
		);

	data_en_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => case_statement_r2_wire, --  input.wire
			output => data_en                 -- output.wire
		);

	if_statement6 : component alt_dspbuilder_if_statement_GNIV4UP6ZO
		generic map (
			use_else_output => 0,
			bwr             => 0,
			use_else_input  => 0,
			signed          => 0,
			HDLTYPE         => "STD_LOGIC_VECTOR",
			if_expression   => "a=b",
			number_inputs   => 2,
			width           => 24
		)
		port map (
			true => if_statement6_true_wire,      -- true.wire
			a    => counter_0_output_wire,        --    a.wire
			b    => pipelined_adder1_result_wire  --    b.wire
		);

	counter_0 : component alt_dspbuilder_port_GNOC3SGKQJ
		port map (
			input  => counter,               --  input.wire
			output => counter_0_output_wire  -- output.wire
		);

	single_pulse : component alt_dspbuilder_single_pulse_GN2XGKTRR3
		generic map (
			delay         => 1,
			signal_type   => "Step Down",
			impulse_width => 1
		)
		port map (
			clock  => clock_0_clock_output_clk,        -- clock_aclr.clk
			aclr   => clock_0_clock_output_reset,      --           .reset
			result => single_pulse_result_wire,        --     result.wire
			sclr   => single_pulsesclrgnd_output_wire, --       sclr.wire
			ena    => single_pulseenavcc_output_wire   --        ena.wire
		);

	single_pulsesclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => single_pulsesclrgnd_output_wire  -- output.wire
		);

	single_pulseenavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => single_pulseenavcc_output_wire  -- output.wire
		);

	constant15 : component alt_dspbuilder_constant_GNQJ63TWA6
		generic map (
			HDLTYPE    => "STD_LOGIC_VECTOR",
			BitPattern => "000000000000000000000100",
			width      => 24
		)
		port map (
			output => constant15_output_wire  -- output.wire
		);

	check_en_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => case_statement_r3_wire, --  input.wire
			output => check_en                -- output.wire
		);

	pixel_num_0 : component alt_dspbuilder_port_GNUJT4YY5I
		port map (
			input  => pixel_num,               --  input.wire
			output => pixel_num_0_output_wire  -- output.wire
		);

	ready_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => ready,               --  input.wire
			output => ready_0_output_wire  -- output.wire
		);

	cast26 : component alt_dspbuilder_cast_GNKIWLRTQI
		generic map (
			round    => 0,
			saturate => 0
		)
		port map (
			input  => pixel_num_0_output_wire, --  input.wire
			output => cast26_output_wire       -- output.wire
		);

	cast27 : component alt_dspbuilder_cast_GN5P6ORZXA
		generic map (
			round    => 0,
			saturate => 0
		)
		port map (
			input  => counter_0_output_wire, --  input.wire
			output => cast27_output_wire     -- output.wire
		);

	cast28 : component alt_dspbuilder_cast_GNLWRZWTQF
		generic map (
			round    => 0,
			saturate => 0
		)
		port map (
			input  => state_machine_editor_state_wire, --  input.wire
			output => cast28_output_wire               -- output.wire
		);

end architecture rtl; -- of Test_Pattern_Generator_GN_Test_Pattern_Generator_MAIN_CTRL_CTRL_TOP