library ieee;
use ieee.std_logic_1164.ALL;


entity l_block is
    port ( i : in std_logic_vector(5 downto 0);
           io: in std_logic;
           o : out std_logic);
end entity l_block;


architecture l_block_arch of l_block is
begin
    o <= (i(0) and i(1) and i(2) and i(3)) nor ((i(1) and i(2) and i(3) and i(4)) nor (i(5) and io));
end architecture l_block_arch;