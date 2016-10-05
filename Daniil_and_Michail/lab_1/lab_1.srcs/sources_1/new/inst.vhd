library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inst is
    Port ( i_a : in STD_LOGIC;
           i_b : in STD_LOGIC;
           i_c : in STD_LOGIC;
           o_a : out STD_LOGIC);
end inst;

architecture inst_arch of inst is
begin
    o_a <= i_a and i_b and i_c;
end architecture inst_arch;
