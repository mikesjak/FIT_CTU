library IEEE;
use IEEE.std_logic_1164.all;

library xil_defaultlib;
use xil_defaultlib.all;

entity zamek_vhdl is
   port (
      a     :  in  std_logic;
      b     :  in  std_logic;
      c     :  in  std_logic;
      clk   :  in  std_logic;
      reset :  in  std_logic;
      AN0_0 :  out std_logic;
      AN1_0 :  out std_logic;
      AN2_0 :  out std_logic;
      AN3_0 :  out std_logic;
      f_a_0 :  out std_logic;
      f_b_0 :  out std_logic;
      f_c_0 :  out std_logic;
      f_d_0 :  out std_logic;
      f_e_0 :  out std_logic;
      f_f_0 :  out std_logic;
      f_g_0 :  out std_logic;
      y     :  out std_logic
   );
end entity zamek_vhdl;

architecture Behavioral of zamek_vhdl is
	component button_vhdl
		port (
			clk   :  in  std_logic;
			reset :  in  std_logic;
			tl_in :  in  std_logic;
			b     :  out std_logic
		);
	end component;

	component automatos
		port (
			c0 :  in  std_logic;
			c1 :  in  std_logic;
			q0 :  in  std_logic;
			q1 :  in  std_logic;
			q2 :  in  std_logic;
			d0 :  out std_logic;
			d1 :  out std_logic;
			d2 :  out std_logic
		);
	end component;

	component decoder_7seg
		port (
			a   :  in  std_logic;
			b   :  in  std_logic;
			c   :  in  std_logic;
			d   :  in  std_logic;
			AN0 :  out std_logic;
			AN1 :  out std_logic;
			AN2 :  out std_logic;
			AN3 :  out std_logic;
			f_a :  out std_logic;
			f_b :  out std_logic;
			f_c :  out std_logic;
			f_d :  out std_logic;
			f_e :  out std_logic;
			f_f :  out std_logic;
			f_g :  out std_logic
		);
	end component;

	component decoderX
		port (
			a :  in  std_logic;
			b :  in  std_logic;
			c :  in  std_logic;
			f :  out std_logic;
			g :  out std_logic
		);
	end component;



      signal a_1                :    std_logic;      
      signal a_b                :    std_logic;      
      signal automatos_0_d0     :    std_logic;      
      signal automatos_0_d1     :    std_logic;      
      signal automatos_0_d2     :    std_logic;      
      signal b_1                :    std_logic;      
      signal b_b                :    std_logic;      
      signal c_1                :    std_logic;      
      signal c_b                :    std_logic;      
      signal clk_1              :    std_logic;      
      signal decoder_7seg_0_AN0 :    std_logic;      
      signal decoder_7seg_0_AN1 :    std_logic;      
      signal decoder_7seg_0_AN2 :    std_logic;      
      signal decoder_7seg_0_AN3 :    std_logic;      
      signal decoder_7seg_0_f_a :    std_logic;      
      signal decoder_7seg_0_f_b :    std_logic;      
      signal decoder_7seg_0_f_c :    std_logic;      
      signal decoder_7seg_0_f_d :    std_logic;      
      signal decoder_7seg_0_f_e :    std_logic;      
      signal decoder_7seg_0_f_f :    std_logic;      
      signal decoder_7seg_0_f_g :    std_logic;      
      signal decoderX_0_f       :    std_logic;      
      signal decoderX_0_g       :    std_logic;      
      signal dff_0_q            :    std_logic;      
      signal dff_1_q            :    std_logic;      
      signal dff_2_q            :    std_logic;      
      signal gnd_0_O            :    std_logic;      
      signal reset_1            :    std_logic;      
begin
	a_1 <= a;
	b_1 <= b;
	c_1 <= c;
	clk_1 <= clk;
	reset_1 <= reset;
	AN0_0 <= decoder_7seg_0_AN0;
	AN1_0 <= decoder_7seg_0_AN1;
	AN2_0 <= decoder_7seg_0_AN2;
	AN3_0 <= decoder_7seg_0_AN3;
	f_a_0 <= decoder_7seg_0_f_a;
	f_b_0 <= decoder_7seg_0_f_b;
	f_c_0 <= decoder_7seg_0_f_c;
	f_d_0 <= decoder_7seg_0_f_d;
	f_e_0 <= decoder_7seg_0_f_e;
	f_f_0 <= decoder_7seg_0_f_f;
	f_g_0 <= decoder_7seg_0_f_g;
	y <= dff_2_q;


	-- a
	inst_a : button_vhdl
		port map (
			clk   =>  clk_1,
			reset =>  reset_1,
			tl_in =>  a_1  ,
			b     =>  a_b  
		);

	-- automatos_0
	inst_automatos_0 : automatos
		port map (
			c0 =>  decoderX_0_f,
			c1 =>  decoderX_0_g,
			q0 =>  dff_0_q,
			q1 =>  dff_1_q,
			q2 =>  dff_2_q,
			d0 =>  automatos_0_d0,
			d1 =>  automatos_0_d1,
			d2 =>  automatos_0_d2
		);

	-- b
	inst_b : button_vhdl
		port map (
			clk   =>  clk_1,
			reset =>  reset_1,
			tl_in =>  b_1  ,
			b     =>  b_b  
		);

	-- c
	inst_c : button_vhdl
		port map (
			clk   =>  clk_1,
			reset =>  reset_1,
			tl_in =>  c_1  ,
			b     =>  c_b  
		);

	-- decoder_7seg_0
	inst_decoder_7seg_0 : decoder_7seg
		port map (
			a   =>  dff_0_q,
			b   =>  dff_1_q,
			c   =>  dff_2_q,
			d   =>  gnd_0_O,
			AN0 =>  decoder_7seg_0_AN0,
			AN1 =>  decoder_7seg_0_AN1,
			AN2 =>  decoder_7seg_0_AN2,
			AN3 =>  decoder_7seg_0_AN3,
			f_a =>  decoder_7seg_0_f_a,
			f_b =>  decoder_7seg_0_f_b,
			f_c =>  decoder_7seg_0_f_c,
			f_d =>  decoder_7seg_0_f_d,
			f_e =>  decoder_7seg_0_f_e,
			f_f =>  decoder_7seg_0_f_f,
			f_g =>  decoder_7seg_0_f_g
		);

	-- decoderX_0
	inst_decoderX_0 : decoderX
		port map (
			a =>  a_b,
			b =>  b_b,
			c =>  c_b,
			f =>  decoderX_0_f,
			g =>  decoderX_0_g
		);

	-- dff_0
	process (clk_1)
	begin
		if rising_edge(clk_1) then
			if reset_1 = '1' then
				dff_0_q <= '0';
			else
				dff_0_q <= automatos_0_d0;
			end if;
		end if;
	end process;

	-- dff_1
	process (clk_1)
	begin
		if rising_edge(clk_1) then
			if reset_1 = '1' then
				dff_1_q <= '0';
			else
				dff_1_q <= automatos_0_d1;
			end if;
		end if;
	end process;

	-- dff_2
	process (clk_1)
	begin
		if rising_edge(clk_1) then
			if reset_1 = '1' then
				dff_2_q <= '0';
			else
				dff_2_q <= automatos_0_d2;
			end if;
		end if;
	end process;

	-- gnd_0
	gnd_0_O <= '0';

end Behavioral;
