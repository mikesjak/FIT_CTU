library IEEE;
use IEEE.std_logic_1164.all;

library xil_defaultlib;
use xil_defaultlib.all;

entity pulscitacky_vhdl is
   port (
      A    :  in  std_logic;
      B    :  in  std_logic;
      Cin  :  in  std_logic;
      Cout :  out std_logic;
      S    :  out std_logic
   );
end entity pulscitacky_vhdl;

architecture Behavioral of pulscitacky_vhdl is


      signal and_0_O :    std_logic;
      signal and_1_O :    std_logic;
      signal I0_0_1  :    std_logic;
      signal I1_0_1  :    std_logic;
      signal I1_0_2  :    std_logic;
      signal or_0_O  :    std_logic;
      signal xor_0_O :    std_logic;
      signal xor_1_O :    std_logic;
begin
	I0_0_1 <= A;
	I1_0_1 <= B;
	I1_0_2 <= Cin;
	Cout <= or_0_O;
	S <= xor_0_O;


	-- and_0
	and_0_O <= I0_0_1 and I1_0_1;

	-- and_1
	and_1_O <= xor_1_O and I1_0_2;

	-- or_0
	or_0_O <= and_1_O or and_0_O;

	-- xor_0
	xor_0_O <= xor_1_O xor I1_0_2;

	-- xor_1
	xor_1_O <= I0_0_1 xor I1_0_1;

end Behavioral;
