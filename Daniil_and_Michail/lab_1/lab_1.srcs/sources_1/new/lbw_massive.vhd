library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

---------------------

entity lbw_massive is
    port (  x       : in std_logic_vector(5 downto 0);
            y       : out std_logic_vector(7 downto 0));
end entity lbw_massive;

---------------------

architecture lbw_massive_arch of lbw_massive is

    component l_block_wrr
        port ( i_lbw : in std_logic_vector(5 downto 0);
               o_lbw : out std_logic);
    end component;
    
    signal tq   : std_logic_vector(5 downto 0);
    
begin  
       
--    tq(1 downto 0) => x(1 downto 0);
--    tq(4 downto 2) <= x(4 downto 2) xnor std_logic_vector(to_unsigned(0, x(4 downto 2)'length));
--    tq(5) <= x(5); 

    gen_l_block_wrr: 
    for k in 0 to 7 generate
         l_block_wrr_x : l_block_wrr 
             port map(x xnor ("11"&std_logic_vector(to_unsigned(k, 3)&"1")), y(k));
    end generate gen_l_block_wrr;    
    
end architecture lbw_massive_arch;
