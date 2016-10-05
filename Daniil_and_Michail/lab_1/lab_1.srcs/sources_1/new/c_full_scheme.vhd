library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------

entity c_full_scheme is
port (      not_G   : in std_logic;
                D       : in std_logic;
                S       : in std_logic_vector(2 downto 0);
                not_CLR : in std_logic;
                y       : out std_logic_vector(7 downto 0));
end entity c_full_scheme;

---------------------

architecture c_full_scheme_arch of c_full_scheme is
    component inp_buff is
        port (  not_G   : in std_logic;
                D       : in std_logic;
                S       : in std_logic_vector(2 downto 0);
                not_CLR : in std_logic;
                x       : out std_logic_vector(5 downto 0));
    end component;
    
    component c_block is
        port ( i_cb : in std_logic_vector(5 downto 0);
               o_cb : out std_logic);
    end component c_block;
    
    signal temp   : std_logic_vector(5 downto 0); 
    
begin

    inp_buff_inst : inp_buff port map (not_G, D, S, not_CLR, temp);

    gen_c_block: 
    for k in 0 to 7 generate
        c_block_x : c_block 
        port map(temp xnor ("11"&std_logic_vector(to_unsigned(k, 3)&"1")), y(k));
    end generate gen_c_block;

end architecture c_full_scheme_arch;
