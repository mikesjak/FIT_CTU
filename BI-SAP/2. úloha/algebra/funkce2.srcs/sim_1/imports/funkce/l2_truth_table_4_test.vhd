library STD;
use STD.textio.all;

library IEEE;
use IEEE.std_logic_1164.all;

entity truth_table_4_test is
end truth_table_4_test;

architecture behavior of truth_table_4_test is

    signal d : std_logic := '0';
    signal c : std_logic := '0';
    signal b : std_logic := '0';
    signal a : std_logic := '0';

    signal f : std_logic;

    constant DELAY : time := 60 ns;

    -- poznamka pro cvicici: deklarace komponenty neni nutna - vyber testovaneho obvodu je az u konkretni instance

begin

    -- definition of tested entity and its inputs and outputs
    -- inputs:  a, b, c, d
    -- outputs: f
    -- ATTENTION!
    -- The entity name (entity work.truth_table_4) must be equal to the tested component name
    -- In this case: truth_table_4
    -- The input and output names (left part before arrow) must be equal to the names in the tested design

    -- definice vstupu a vystupu testovane komponenty
    -- vstupy:  a, b, c, d
    -- vystupy: f
    -- POZOR!
    -- nazev entity (entity work.truth_table_4) musi byt stejny jako nazev testovane entity
    -- v tomto pripade: truth_table_4
    -- vstupy a vystupy (v leve casti pred sipkou) musi byt stejne jako popisy vstupu a vystupu testovane entity

    uut: entity work.truth_table_4
    port map(
        d => d,
        c => c,
        b => b,
        a => a,
        f => f
    );

    stim_proc: process
        variable file_line : line;
    begin

        write(file_line, string'("### Simulation start ###"));
        writeline(output, file_line);

        -- testing all combinations
        -- 4 inputs => 4 for-cycles => 2^4 combinations
        -- testovani vsech moznych kombinaci
        -- 4 vstupy => 4 for-cykly => 2^4 moznych vstupnich kombinaci
        for i in 0 to 1 loop
            for j in 0 to 1 loop
                for k in 0 to 1 loop
                    for l in 0 to 1 loop
                        -- the inputs change after delay
                        -- vstupy se zmeni za delay
                        wait for DELAY;
                        a <= not(a);
                    end loop;
                    b <= not(b);
                end loop;
                c <= not(c);
            end loop;
            d <= not(d);
        end loop;

        -- konec simulace
        write(file_line, string'("### Total number of errors = Unknown - check waveforms manually / zkontrolujte prubehy rucne"));
        writeline(output, file_line);

        write(file_line, string'("### Simulation finished ###"));
        writeline(output, file_line);

        wait;

    end process;

end;
