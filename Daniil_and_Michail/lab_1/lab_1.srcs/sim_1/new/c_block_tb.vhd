library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;

---------------------

entity c_block_tb is
end entity c_block_tb;

---------------------

architecture c_block_tb_arch of c_block_tb is

    component c_block
        port ( i_cb : in std_logic_vector(5 downto 0);
               o_cb : out std_logic);
    end component;
    
    signal ii : std_logic_vector(5 downto 0);
    signal oo : std_logic;

begin    

    c_block_inst : c_block port map (i_cb => ii, o_cb => oo);
    
    process
    begin
        for k in 0 to 63 loop
            ii <= conv_std_logic_vector(k, 6);
            wait for 10 ps;
        end loop;
    end process;
    
end architecture c_block_tb_arch;
