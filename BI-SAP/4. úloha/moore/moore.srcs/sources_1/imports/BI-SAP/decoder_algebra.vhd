library IEEE;
use IEEE.std_logic_1164.all;

entity decoder_7seg is
    port(
        a   : in  std_logic;
        b   : in  std_logic;
        c   : in  std_logic;
        d   : in  std_logic;
        f_a : out std_logic;
        f_b : out std_logic;
        f_c : out std_logic;
        f_d : out std_logic;
        f_e : out std_logic;
        f_f : out std_logic;
        f_g : out std_logic;
        AN0: out std_logic;
        AN1: out std_logic;
        AN2: out std_logic;
        AN3: out std_logic
    );
end decoder_7seg;

architecture behavioral of decoder_7seg is
begin

-- 7-segment display layout
-- Znazorneni 7segmentoveho displeje

--        f_A
--        --- 
--  f_F  |   |  f_B
--        ---    <- f_G
--  f_E  |   |  f_C
--        ---
--        f_D

--  A:      B:      C:      D:      E:      F:
--    ---             ---             ---     ---
--   |   |   |       |           |   |       |
--    ---     ---             ---     ---     ---
--   |   |   |   |   |       |   |   |       |
--            ---     ---     ---     ---

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

-- Add the respective excitation functions here.
-- The functions are negated here, because the display segments switch on with log. 0.
-- Example:
--  f_a <= (not(((not a) and b) or (b and (not c)) or ((not c) and d) or ((not b) and c and (not d))));

-- Doplnte predpripravene funkce pro buzeni dekoderu
-- Funkce jsou negovane, protoze jednotlive segmenty jsou aktivni v log. 0.
-- Napriklad:
--  f_a <= (not(((not a) and b) or (b and (not c)) or ((not c) and d) or ((not b) and c and (not d))));

    f_a <= ( ( (not d) and (not c) and (not b) and a ) or ((not d) and c and (not b) and (not a)) or ( d and c and (not b) and a ) or ( d and (not c) and b and a ) );
    f_b <= ( ( (not d) and c and (not b) and a ) or ( d and c and (not b) and (not a) ) or (d and b and a) or ( c and b and (not a) ) );
    f_c <= ( ( (not d) and (not c) and b and (not a) ) or ( d and c and (not b) and (not a) ) or (d and c and b) );
    f_d <= ( ( (not d) and (not c) and (not b) and a ) or ( (not d) and c and (not b) and (not a) ) or ( c and b and a ) or ( d and ( not c ) and b and ( not a ) ) );
    f_e <= ( ( (not d) and c and (not b) and (not a) ) or ( (not d) and a ) or ( d and (not c) and (not b) and a ) );
    f_f <= ( ( (not d) and (not c) and b and (not a) ) or ( (not d) and c and b and a ) or (d and c and (not b) and a) or ( (not d) and (not c) and a ) );
    f_g <= ( ( (not d) and c and b and a ) or ( d and c and (not b) and (not a) ) or ( (not d) and (not c) and (not b) ) );
    AN0 <= '0';
    AN1 <= '1';
    AN2 <= '1';
    AN3 <= '1';
end;
