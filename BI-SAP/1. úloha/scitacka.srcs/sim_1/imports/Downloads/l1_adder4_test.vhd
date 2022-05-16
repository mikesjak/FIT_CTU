library STD;
use STD.textio.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity adder4_test is
end adder4_test;

architecture behavioral of adder4_test is

    signal cin  : std_logic := '0';
    signal a, b : std_logic_vector(3 downto 0) := "0000";

    signal cout : std_logic;
    signal s    : std_logic_vector(3 downto 0);

    signal no_of_errors : integer := 0;
    constant DELAY      : time := 200 ns;
    signal terminate    : boolean;

    -- poznamka pro cvicici: deklarace komponenty neni nutna - vyber testovaneho obvodu je az u konkretni instance

begin

    -- definition of tested entity and its inputs and outputs
    -- inputs:  a0, a1, a2, a3, b0, b1, b2, b3, cin
    -- outputs: s0, s1, s2, s3, cout
    -- ATTENTION!
    -- The entity name (entity work.adder_4_vhdl) must be equal to the tested component name
    -- In this case: adder_4_vhdl
    -- The input and output names (left part before arrow) must be equal to the names in the tested design

    -- definice vstupu a vystupu testovane komponenty
    -- vstupy:  a0, a1, a2, a3, b0, b1, b2, b3, cin
    -- vystupy: s0, s1, s2, s3, cout
    -- POZOR!
    -- nazev entity (entity work.adder_4_vhdl) musi byt stejny jako nazev testovane entity
    -- v tomto pripade: adder_4_vhdl
    -- vstupy a vystupy (v leve casti pred sipkou) musi byt stejne jako popisy vstupu a vystupu testovane entity

    uut: entity work.adder_4_vhdl
    port map(
        cin  => cin,
        a0   => a(0),
        a1   => a(1),
        a2   => a(2),
        a3   => a(3),
        b0   => b(0),
        b1   => b(1),
        b2   => b(2),
        b3   => b(3),
        s0   => s(0),
        s1   => s(1),
        s2   => s(2),
        s3   => s(3),
        cout => cout
   );

    buzzer: process
        variable file_line : line;
    begin
        wait for 1000 ns;
        if (not terminate) then
            write(file_line, string'("-->>> Simulation paused - press Run-all to continue! <<<--"));
            writeline(output, file_line);
        end if;
        wait;
    end process;

    stim_proc: process
       variable file_line : line;
    begin
        terminate <= false;

        -- zacatek simulace
        write(file_line, string'("### Simulation start ###"));
        writeline(output, file_line);

        wait for DELAY;

        -------------------------------------------------
        -- Example 1 / Priklad 1:
        -- CIN=0, A+B = 0001 + 0001 = 0010 -> (MSB..LSB)
        -------------------------------------------------
        cin <= '0';
        a <= "0001";
        b <= "0001";
        wait for 1 ns;
        if not ((cout = '0') and (s = "0010")) then
            write(file_line, string'("Error in adding: / Chyba pri scitani: CIN=0, A+B=0001+0001"));
            writeline(output, file_line);
            no_of_errors <= no_of_errors + 1;
        end if;

        wait for DELAY;

        -------------------------------------------------
        -- Example 2 / Priklad 2:
        -- CIN=1, A+B = 0001 + 0001 = 0011 -> (MSB..LSB)
        -------------------------------------------------
        cin <= '1';
        a <= "0001";
        b <= "0001";
        wait for 1 ns;
        if not ((cout = '0') and (s = "0011")) then
            write(file_line, string'("Error in adding: / Chyba pri scitani: CIN=1, A+B=0001+0001"));
            writeline(output, file_line);
            no_of_errors <= no_of_errors + 1;
        end if;

        wait for DELAY;

        -- You may add more tests 
        -- Muzete si pridat dalsi testy


        -- konec simulace
        write(file_line, string'("### Total number of errors = "));
        write(file_line, no_of_errors);
        writeline(output, file_line);

        write(file_line, string'("### Simulation finished ###"));
        writeline(output, file_line);

        terminate <= true;

        wait;

   end process;

end;
