library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;

---------------------

entity new_full_shcheme_tb is
end entity new_full_shcheme_tb;

---------------------

architecture new_full_shcheme_tb_ach of new_full_shcheme_tb is

    component new_full_scheme
        port (      not_G   : in std_logic;
                    D       : in std_logic;
                    S       : in std_logic_vector(2 downto 0);
                    not_CLR : in std_logic;
                    y       : out std_logic_vector(7 downto 0));
    end component;

    component c_new_full_scheme
        port (      not_G   : in std_logic;
                    D       : in std_logic;
                    S       : in std_logic_vector(2 downto 0);
                    not_CLR : in std_logic;
                    y       : out std_logic_vector(7 downto 0));
    end component;
    
    
    signal t_x : std_logic_vector(5 downto 0);                   
    signal t_y : std_logic_vector(7 downto 0);                  
    signal c_t_y : std_logic_vector(7 downto 0);
    signal t_not_G   :  std_logic;                     
    signal t_D       :  std_logic;                     
    signal t_S       :  std_logic_vector(2 downto 0);  
    signal t_not_CLR :  std_logic;                     
            
    
begin
    t_not_G     <=  t_x(0);         
    t_D         <=  t_x(1);         
    t_S         <=  t_x(4 downto 2);
    t_not_CLR   <=  t_x(5);
    
    new_full_shcheme_inst : new_full_scheme port map (not_G    => t_x(0),
                                                       D       => t_x(1),
                                                       S       => t_x(4 downto 2),
                                                       not_CLR => t_x(5),
                                                       y       => t_y);

    c_new_full_shcheme_inst : c_new_full_scheme port map (not_G    => t_x(0),
                                                           D       => t_x(1),
                                                           S       => t_x(4 downto 2),
                                                           not_CLR => t_x(5),
                                                           y       => c_t_y);
                                                                                                     
    process
    begin
        for k in 0 to 63 loop
            t_x <= conv_std_logic_vector(k, 6);
            wait for 10 ns;
        end loop;
    end process; 

end new_full_shcheme_tb_ach;