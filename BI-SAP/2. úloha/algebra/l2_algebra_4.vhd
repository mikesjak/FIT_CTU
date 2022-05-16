library IEEE;
use IEEE.std_logic_1164.all;

-- ports description - inputs a, b, c, d, output f
-- definice vstupu a vystupu - vstupy a, b, c, d, vystup f
entity algebra_4 is
    port(
        d : in  std_logic;
        c : in  std_logic;
        b : in  std_logic;
        a : in  std_logic;
        f : out std_logic
    );
end algebra_4;

architecture behavioral of algebra_4 is
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
    f <= ((not c) and (not b) and a) or ((not c) and b and (not a)) or (c and (not b) and (not a)) or (c and b and (not a));

end;
