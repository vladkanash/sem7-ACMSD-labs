library ieee;
use ieee.std_logic_1164.ALL;

---------------------

entity l_block_wrr is
    port ( i_lbw : in std_logic_vector(5 downto 0);
           o_lbw : out std_logic);
end entity l_block_wrr;

---------------------

architecture l_block_wrr_arch of l_block_wrr is 
    
    signal temp_y : std_logic;
    
begin
    
    
    temp_y <= (i_lbw(0) and i_lbw(1) and i_lbw(2) and i_lbw(3)) nor ((i_lbw(1) and i_lbw(2) and i_lbw(3) and i_lbw(4)) nor (i_lbw(5) and temp_y));
    o_lbw <= temp_y;
    
end architecture l_block_wrr_arch;