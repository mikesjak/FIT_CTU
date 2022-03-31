library IEEE;
use IEEE.std_logic_1164.all;

-- Ports description - inputs a, b, c, d, outputs f, g
-- definice vstupu a vystupu - vstupy a, b, c, d, vystupy f, g
entity algebra_4x2 is
    port(
        d    : in  std_logic;
        c    : in  std_logic;
        b    : in  std_logic;
        a    : in  std_logic;
        f, g, h, j : out std_logic
    );
end algebra_4x2;

architecture behavioral of algebra_4x2 is
begin

-- you can use the following operators:
-- ----------------------------------
-- | operator |   example           |
-- ----------------------------------
-- |    and   | a and b and c       |
-- |    or    | a or b or (c and d) |
-- |    not   | not a               |
-- ----------------------------------
-- There is no priority of operators. Be sure to use brackets!
-- example:
--   given: f(a, b, c) = a * #b * #c + a * b
--   in VHDL: f <= (a and (not b) and (not c)) or (a and b)

-- ve vyrazech pouzivejte nasledujici operatory:
-- ----------------------------------
-- | operator | priklad pouziti     |
-- ----------------------------------
-- |    and   | a and b and c       |
-- |    or    | a or b or (c and d) |
-- |    not   | not a               |
-- ----------------------------------
-- pouzivejte zavorky!
-- priklad:
--   zadani: f(a, b, c) = a * #b * #c + a * b
--   ve VHDL: f <= (a and (not b) and (not c)) or (a and b)

-- another example:
-- jiny vzorovy priklad:
    f <= ( a and c );
    g <= ( ( d and (not b) and a ) or ( c and b and (not a) ) or ( d and (not c) and b and a ) or ( (not d) and c and b and a ) );
    h <= ( (d and b and (not a)) or ( d and (not c) and b and (not a) ) );
    j <= ( d and c and b and a );

end;
