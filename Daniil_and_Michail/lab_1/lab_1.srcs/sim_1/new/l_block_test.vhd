library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;


entity l_block_test is
end entity l_block_test;

architecture l_block_arch of l_block_test is
    component l_block
        port ( i : in std_logic_vector(5 downto 0);
               io: in std_logic;
               o : out std_logic);
    end component;   
    signal ii : std_logic_vector(5 downto 0);
    signal iio: std_logic;
    signal oo : std_logic;
    signal o_temp : std_logic;
begin
    l_block_inst : l_block
    port map (ii, oo);
    
    process
    begin
        for k in 0 to 6 loop
            ii <= conv_std_logic_vector(k, 6);
            io <= oo;
            wait for 1 ps;
        end loop;
    end process; 
end architecture l_block_arch;
