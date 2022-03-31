library IEEE;
use IEEE.std_logic_1164.all;

library xil_defaultlib;
use xil_defaultlib.all;

entity nasobicka_vhdl is
   port (
      a_0   :  in  std_logic;
      b_0   :  in  std_logic;
      c_0   :  in  std_logic;
      d_0   :  in  std_logic;
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
      f_g_0 :  out std_logic
   );
end entity nasobicka_vhdl;

architecture Behavioral of nasobicka_vhdl is
	component algebra_4x2
		port (
			a :  in  std_logic;
			b :  in  std_logic;
			c :  in  std_logic;
			d :  in  std_logic;
			f :  out std_logic;
			g :  out std_logic;
			h :  out std_logic;
			j :  out std_logic
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



      signal a_0_1              :    std_logic;      
      signal algebra_4x2_0_f    :    std_logic;      
      signal algebra_4x2_0_g    :    std_logic;      
      signal algebra_4x2_0_h    :    std_logic;      
      signal algebra_4x2_0_j    :    std_logic;      
      signal b_0_1              :    std_logic;      
      signal c_0_1              :    std_logic;      
      signal d_0_1              :    std_logic;      
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
begin
	a_0_1 <= a_0;
	b_0_1 <= b_0;
	c_0_1 <= c_0;
	d_0_1 <= d_0;
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


	-- algebra_4x2_0
	inst_algebra_4x2_0 : algebra_4x2
		port map (
			a =>  a_0_1,
			b =>  b_0_1,
			c =>  c_0_1,
			d =>  d_0_1,
			f =>  algebra_4x2_0_f,
			g =>  algebra_4x2_0_g,
			h =>  algebra_4x2_0_h,
			j =>  algebra_4x2_0_j
		);

	-- decoder_7seg_0
	inst_decoder_7seg_0 : decoder_7seg
		port map (
			a   =>  algebra_4x2_0_f,
			b   =>  algebra_4x2_0_g,
			c   =>  algebra_4x2_0_h,
			d   =>  algebra_4x2_0_j,
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

end Behavioral;
