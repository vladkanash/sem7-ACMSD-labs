library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity inst_test_bench is
end entity inst_test_bench;



architecture inst_arch of inst_test_bench is
    component inst
        port(
        i_a, i_b, i_c : in STD_LOGIC;
        o_a           : out STD_LOGIC);
    end component;   
    signal i : STD_LOGIC_VECTOR(2 downto 0);
    signal o : STD_LOGIC;
begin
    inst_inst : inst
    port map (i_a => i(2), i_b => i(1), i_c => i(0), o_a => o);
    
    process
    begin
        for k in 0 to 7 loop
            i <= CONV_STD_LOGIC_VECTOR(k, 3);
            wait for 1 ps;
        end loop;
    end process; 
      
end architecture inst_arch;
