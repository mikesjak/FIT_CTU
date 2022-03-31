library IEEE;
use IEEE.std_logic_1164.all;

library xil_defaultlib;
use xil_defaultlib.all;

entity funkce3_vhdl is
   port (
      A   :  in  std_logic;
      B   :  in  std_logic;
      D   :  in  std_logic;
      O_0 :  out std_logic
   );
end entity funkce3_vhdl;

architecture Behavioral of funkce3_vhdl is


      signal A_1     :    std_logic;
      signal and_0_O :    std_logic;
      signal and_1_O :    std_logic;
      signal and_2_O :    std_logic;
      signal B_1     :    std_logic;
      signal D_1     :    std_logic;
      signal or_0_O  :    std_logic;
begin
	A_1 <= A;
	B_1 <= B;
	D_1 <= D;
	O_0 <= or_0_O;


	-- and_0
	and_0_O <= not(D_1) and not(A_1);

	-- and_1
	and_1_O <= D_1 and not(B_1) and A_1;

	-- and_2
	and_2_O <= B_1 and not(A_1);

	-- or_0
	or_0_O <= and_0_O or and_1_O or and_2_O;

end Behavioral;
