library ieee;
use ieee.std_logic_1164.ALL;

---------------------

entity c_block is
    port ( i_cb : in std_logic_vector(5 downto 0);
           o_cb : out std_logic);
end entity c_block;

---------------------

architecture c_block_arch of c_block is

    signal temp_y : std_logic;

begin
    
    process(i_cb, temp_y)
    begin
        --temp_y <= (i_cb(0) and i_cb(1) and i_cb(2) and i_cb(3)) nor ((i_cb(1) and i_cb(2) and i_cb(3) and i_cb(4)) nor (i_cb(5) and temp_y));
        if(i_cb(0) and i_cb(1) and i_cb(2) and i_cb(3)) = '1' then
            temp_y <= '0';
        elsif (((i_cb(1) and i_cb(2) and i_cb(3) and i_cb(4)) = '0') and ((i_cb(5) and temp_y) = '0')) then
            temp_y <= '0';
        else
            temp_y <= '1';
        end if;
        o_cb <= temp_y;
    end process;
    
end architecture c_block_arch;
