library ieee;
use ieee.std_logic_1164.ALL;

---------------------

entity inp_buff is
    port (      not_G   : in std_logic;
                D       : in std_logic;
                S       : in std_logic_vector(2 downto 0);
                not_CLR : in std_logic;
                x       : out std_logic_vector(5 downto 0));
end entity inp_buff;

---------------------

architecture inp_buff_arch of inp_buff is
begin

    x(0) <= (not not_G) and (not D);
    x(3 downto 1) <= S(2 downto 0);
    x(4) <= (not not_G) and D;
    x(5) <= not_CLR;

end architecture inp_buff_arch;
