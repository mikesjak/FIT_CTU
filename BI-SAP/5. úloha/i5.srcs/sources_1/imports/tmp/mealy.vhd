library IEEE;
use IEEE.std_logic_1164.all;

library xil_defaultlib;
use xil_defaultlib.all;

entity mealy_vhdl is
   port (
      clk   :  in  std_logic;
      reset :  in  std_logic;
      sw    :  in  std_logic;
      tl_in :  in  std_logic;
      y     :  out std_logic
   );
end entity mealy_vhdl;

architecture Behavioral of mealy_vhdl is
	component next_state_logic
		port (
			q0 :  in  std_logic;
			q1 :  in  std_logic;
			q2 :  in  std_logic;
			sw :  in  std_logic;
			d0 :  out std_logic;
			d1 :  out std_logic;
			d2 :  out std_logic
		);
	end component;

	component output_logic
		port (
			q0 :  in  std_logic;
			q1 :  in  std_logic;
			q2 :  in  std_logic;
			sw :  in  std_logic;
			y  :  out std_logic
		);
	end component;

	component debounce
		generic (
			width: integer := 22
		);
		port (
			clk    : in  std_logic;
			tl_in  : in  std_logic;
			tl_out : out std_logic
		);
	end component;


      signal clk_1                 :    std_logic;         
      signal debounce_0_tl_out     :    std_logic;         
      signal dff_0_q               :    std_logic;         
      signal dff_1_q               :    std_logic;         
      signal dff_2_q               :    std_logic;         
      signal next_state_logic_0_d0 :    std_logic;         
      signal next_state_logic_0_d1 :    std_logic;         
      signal next_state_logic_0_d2 :    std_logic;         
      signal output_logic_0_y      :    std_logic;         
      signal reset_1               :    std_logic;         
      signal sw_1                  :    std_logic;         
      signal tl_in_1               :    std_logic;         
begin
	clk_1 <= clk;
	reset_1 <= reset;
	sw_1 <= sw;
	tl_in_1 <= tl_in;
	y <= output_logic_0_y;


	-- debounce_0
	debounce_0 : debounce
		generic map (
			width => 22
		)
		port map (
			clk	=> clk_1,
			tl_in	=> tl_in_1,
			tl_out	=> debounce_0_tl_out
		);

	-- dff_0
	process (debounce_0_tl_out)
	begin
		if rising_edge(debounce_0_tl_out) then
			if reset_1 = '1' then
				dff_0_q <= '0';
			else
				dff_0_q <= next_state_logic_0_d0;
			end if;
		end if;
	end process;

	-- dff_1
	process (debounce_0_tl_out)
	begin
		if rising_edge(debounce_0_tl_out) then
			if reset_1 = '1' then
				dff_1_q <= '0';
			else
				dff_1_q <= next_state_logic_0_d1;
			end if;
		end if;
	end process;

	-- dff_2
	process (debounce_0_tl_out)
	begin
		if rising_edge(debounce_0_tl_out) then
			if reset_1 = '1' then
				dff_2_q <= '0';
			else
				dff_2_q <= next_state_logic_0_d2;
			end if;
		end if;
	end process;

	-- next_state_logic_0
	inst_next_state_logic_0 : next_state_logic
		port map (
			q0 =>  dff_0_q,
			q1 =>  dff_1_q,
			q2 =>  dff_2_q,
			sw =>  sw_1,
			d0 =>  next_state_logic_0_d0,
			d1 =>  next_state_logic_0_d1,
			d2 =>  next_state_logic_0_d2
		);

	-- output_logic_0
	inst_output_logic_0 : output_logic
		port map (
			q0 =>  dff_0_q,
			q1 =>  dff_1_q,
			q2 =>  dff_2_q,
			sw =>  sw_1,
			y  =>  output_logic_0_y
		);

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity debounce is
    generic (
		width: integer := 22 -- 100 MHz clock -> 4 - simulation (90 ns); 22 - synthesis (ca. 20 ms)
	);
    port (
		clk : in STD_LOGIC;
        tl_in : in STD_LOGIC;
        tl_out : out STD_LOGIC
	);
end entity debounce;

architecture Behavioral of debounce is

signal cnt       : std_logic_vector(width-1 downto 0) := (others => '0');
signal reset, ce : std_logic := '0';
signal tl_prev   : std_logic := '0';


begin

    counter: process(clk) begin
        if rising_edge(clk) then 
            if (reset = '1') then
                cnt <= (others => '0');
            elsif (ce = '1') then
                cnt <= cnt + 1;
            end if;
        end if;
    end process;

    process(clk) begin
        if rising_edge(clk) then
            if (tl_prev /= tl_in) then
                reset <= '1';
            else 
                reset <= '0';
            end if;
        end if;
    end process;
                
    process(clk) begin
        if rising_edge(clk) then
            if (reset = '1') then
                tl_prev <= tl_in;
            end if;
        end if;
    end process;
                
    process(clk) begin
        if rising_edge(clk) then
            if ((cnt(width-1) = '1') and (cnt(0) = '0')) then
                tl_out <= tl_prev;
            end if;
        end if;
    end process;
                

    ce <= '0' when ((cnt(width-1) = '1') and (cnt(0) = '1'))
                else '1';

end Behavioral;

