library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;

---------------------

entity l_block_wrr_tb is
end entity l_block_wrr_tb;
    
---------------------

architecture l_block_wrr_tb_arch of l_block_wrr_tb is

    component l_block_wrr
        port ( i_lbw : in std_logic_vector(5 downto 0);
               o_lbw : out std_logic);
    end component;
    
    signal ii : std_logic_vector(5 downto 0);
    signal oo : std_logic;
    
begin

    l_block_wrr_inst : l_block_wrr port map (i_lbw => ii, o_lbw => oo);
    
    process
    begin
        for k in 0 to 63 loop
            ii <= conv_std_logic_vector(k, 6);
            wait for 10 ns;
        end loop;
    end process; 

end architecture l_block_wrr_tb_arch;
