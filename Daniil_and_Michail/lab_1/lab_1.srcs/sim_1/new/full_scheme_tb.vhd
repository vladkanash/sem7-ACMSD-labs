library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;

---------------------

entity full_scheme_tb is
end entity full_scheme_tb;

---------------------

architecture full_scheme_tb_arch of full_scheme_tb is

    component full_scheme
        port (      not_G   : in std_logic;
                    D       : in std_logic;
                    S       : in std_logic_vector(2 downto 0);
                    not_CLR : in std_logic;
                    y       : out std_logic_vector(7 downto 0));
    end component;
    
    component c_full_scheme
        port (      not_G   : in std_logic;
                    D       : in std_logic;
                    S       : in std_logic_vector(2 downto 0);
                    not_CLR : in std_logic;
                    y       : out std_logic_vector(7 downto 0));
    end component;    
    
    signal t_x : std_logic_vector(5 downto 0);                   
    signal t_y : std_logic_vector(7 downto 0);
    signal c_t_x : std_logic_vector(5 downto 0);                   
    signal c_t_y : std_logic_vector(7 downto 0);
    
begin
    full_scheme_inst : full_scheme port map (not_G   => t_x(0),
                                             D       => t_x(1),
                                             S       => t_x(4 downto 2),
                                             not_CLR => t_x(5),
                                             y       => t_y);

    c_full_scheme_inst : c_full_scheme port map (not_G   => c_t_x(0),
                                                 D       => c_t_x(1),
                                                 S       => c_t_x(4 downto 2),
                                                 not_CLR => c_t_x(5),
                                                 y       => c_t_y);
     
    process
    begin
        for k in 0 to 63 loop
            c_t_x <= conv_std_logic_vector(k, 6);
            t_x <= conv_std_logic_vector(k, 6);
            wait for 10 ns;
        end loop;
    end process; 

end architecture full_scheme_tb_arch;