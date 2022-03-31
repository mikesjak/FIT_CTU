library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

-- Ports description - inputs a, b, c, d, output f
-- definice vstupu a vystupu - vstupy a, b, c, d, vystup f
entity truth_table_4 is
    port(
        d : in std_logic;
        c : in std_logic;
        b : in std_logic;
        a : in std_logic;
        f : out std_logic
    );
end truth_table_4;

architecture behavioral of truth_table_4 is

-- definition of the truth-table type - has 16 outputs (2^4 = 16) of standard logic type (0, 1)
-- definice typu pravdivostni tabulka - obsahuje 16 vystupu (2^4 = 16) typu standardni logika (0, 1)
    type truth_table is array (0 to 15) of std_logic;

-- definition of our function f(d, c, b, a) by a truth table
-- definice nasi funkce f(d, c, b, a) pravdivostni tabulkou
    constant our_function : truth_table := truth_table'(

-- do not change the order of the inputs a, b, c, d in the header - it is just a comment
-- zmena poradi vstupu a, b, c, d v zahlavi nema smysl - jedna se pouze o komentar

-- ------------------------------------------------------------------
-- | functional value f(d, c, b, a) | index |  d  |  c  |  b  |  a  |
-- | funkcni hodnota f(d, c, b, a)  | index |  d  |  c  |  b  |  a  |
-- ------------------------------------------------------------------
                 '0',            -- |   0   |  0  |  0  |  0  |  0  |
                 '1',            -- |   1   |  0  |  0  |  0  |  1  |
                 '0',            -- |   2   |  0  |  0  |  1  |  0  |
                 '1',            -- |   3   |  0  |  0  |  1  |  1  |
                 '0',            -- |   4   |  0  |  1  |  0  |  0  |
                 '1',            -- |   5   |  0  |  1  |  0  |  1  |
                 '0',            -- |   6   |  0  |  1  |  1  |  0  |
                 '1',            -- |   7   |  0  |  1  |  1  |  1  |
                 '0',            -- |   8   |  1  |  0  |  0  |  0  |
                 '1',            -- |   9   |  1  |  0  |  0  |  1  |
                 '0',            -- |  10   |  1  |  0  |  1  |  0  |
                 '1',            -- |  11   |  1  |  0  |  1  |  1  |
                 '0',            -- |  12   |  1  |  1  |  0  |  0  |
                 '1',            -- |  13   |  1  |  1  |  0  |  1  |
                 '0',            -- |  14   |  1  |  1  |  1  |  0  |
                 '1'             -- |  15   |  1  |  1  |  1  |  1  |
-- ------------------------------------------------------------------
    );

    signal address : std_logic_vector(3 downto 0);

begin
    address(3) <= d;
    address(2) <= c;
    address(1) <= b;
    address(0) <= a;

    f <= our_function(conv_integer(address(3 downto 0)));

end;
