library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------

entity full_scheme is
    port (      not_G   : in std_logic;
                D       : in std_logic;
                S       : in std_logic_vector(2 downto 0);
                not_CLR : in std_logic;
                y       : out std_logic_vector(7 downto 0));
end entity full_scheme;

---------------------

architecture full_scheme_arch of full_scheme is 

    component inp_buff is
        port (  not_G   : in std_logic;
                D       : in std_logic;
                S       : in std_logic_vector(2 downto 0);
                not_CLR : in std_logic;
                x       : out std_logic_vector(5 downto 0));
    end component;
    
    component l_block_wrr is
        port ( i_lbw : in std_logic_vector(5 downto 0);
               o_lbw : out std_logic);
    end component l_block_wrr;
        
    signal temp   : std_logic_vector(5 downto 0); 
    
begin

    inp_buff_inst : inp_buff port map (not_G, D, S, not_CLR, temp);
    
    gen_l_block_wrr: 
    for k in 0 to 7 generate
        l_block_wrr_x : l_block_wrr 
        port map(temp xnor ("11"&std_logic_vector(to_unsigned(k, 3)&"1")), y(k));
    end generate gen_l_block_wrr;
    
end architecture full_scheme_arch;
