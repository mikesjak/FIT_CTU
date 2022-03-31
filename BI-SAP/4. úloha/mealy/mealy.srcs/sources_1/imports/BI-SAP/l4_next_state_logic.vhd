library IEEE;
use IEEE.std_logic_1164.all;

entity next_state_logic is
    port(   -- do not delete any port even if you do not use it // nemazte zadny port i kdyz jej nepouzijete (kvuli simulaci)
        q0  : in  std_logic;
        q1  : in  std_logic;
        q2  : in  std_logic;
        inc : in  std_logic;
        dir : in  std_logic;
        d0  : out std_logic;
        d1  : out std_logic;
        d2  : out std_logic
    );      -- do not delete any port even if you do not use it // nemazte zadny port i kdyz jej nepouzijete (kvuli simulaci)
end next_state_logic;

architecture behavioral of next_state_logic is
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

   d0 <= ( ( (not inc) and q0 ) or ( inc and (not q1) and (not q0) ) or (inc and (not q2) and (not q0) ) ); -- Keep connected to '0' if you do not use it // pokud tento vystup nevyuzijete, nechte jej pripojeny k log. 0 (kvuli simulaci)
   
   d1 <=( ( (not inc) and q1 ) or (  q0 and (not q1) and inc ) or ( (not q0) and (not q2) and q1 ) ); -- Keep connected to '0' if you do not use it // pokud tento vystup nevyuzijete, nechte jej pripojeny k log. 0 (kvuli simulaci)
   
   d2 <= ( ( q2 and (not q1) ) or ( q2 and (not inc) ) or ( inc and q1 and q0 ) ); -- Keep connected to '0' if you do not use it // pokud tento vystup nevyuzijete, nechte jej pripojeny k log. 0 (kvuli simulaci)

end;
