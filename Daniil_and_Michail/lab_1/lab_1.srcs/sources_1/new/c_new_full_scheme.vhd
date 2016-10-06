library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

---------------------

entity c_new_full_scheme is
    port (      not_G   : in std_logic;
                D       : in std_logic;
                S       : in std_logic_vector(2 downto 0);
                not_CLR : in std_logic;
                y       : out std_logic_vector(7 downto 0));
end entity c_new_full_scheme;

---------------------

architecture c_new_full_scheme_arch of c_new_full_scheme is
    
    type temp_x_t is array (7 downto 0) of std_logic_vector(5 downto 0);
    
    signal temp_x :  temp_x_t;
    signal o_temp :  std_logic_vector(7 downto 0);
    signal xx :  std_logic_vector(5 downto 0); 
    constant k : integer := 0; 
    
begin
    
    xx(0) <= (not not_G) and (not D);
    xx(3 downto 1) <= S(2 downto 0);
    xx(4) <= (not not_G) and D;
    xx(5) <= not_CLR;
    
    process(xx)
    begin
        for i in 0 to 7 loop
            temp_x(k + i) <= xx xnor ("11"&conv_std_logic_vector(k + i, 3)&"1");
        end loop;
    end process;
    
    process(temp_x, o_temp)
    begin
--        for i in 0 to 7 loop
--            if(temp_x(k + i)(0) and temp_x(k + i)(1) and temp_x(k + i)(2) and temp_x(k + i)(3)) = '1' then
--                o_temp(k + i) <= '0';
--            elsif (((temp_x(k + i)(1) and temp_x(k + i)(2) and temp_x(k + i)(3) and temp_x(k + i)(4)) = '0') and ((temp_x(k + i)(5) and o_temp(k + i)) = '0')) then
--                o_temp(k + i) <= '0';
--            else
--                o_temp(k + i) <= '1';
--            end if;
--        end loop;

        if(temp_x(k + 0)(0) and temp_x(k + 0)(1) and temp_x(k + 0)(2) and temp_x(k + 0)(3)) = '1' then
            o_temp(k + 0) <= '0';
        elsif (((temp_x(k + 0)(1) and temp_x(k + 0)(2) and temp_x(k + 0)(3) and temp_x(k + 0)(4)) = '0') and ((temp_x(k + 0)(5) and o_temp(k + 0)) = '0')) then
            o_temp(k + 0) <= '0';
        else
            o_temp(k + 0) <= '1';
        end if;
       
        if(temp_x(k + 1)(0) and temp_x(k + 1)(1) and temp_x(k + 1)(2) and temp_x(k + 1)(3)) = '1' then
            o_temp(k + 1) <= '0';
        elsif (((temp_x(k + 1)(1) and temp_x(k + 1)(2) and temp_x(k + 1)(3) and temp_x(k + 1)(4)) = '0') and ((temp_x(k + 1)(5) and o_temp(k + 1)) = '0')) then
            o_temp(k + 1) <= '0';
        else
            o_temp(k + 1) <= '1';
        end if;
        
        if(temp_x(k + 2)(0) and temp_x(k + 2)(1) and temp_x(k + 2)(2) and temp_x(k + 2)(3)) = '1' then
            o_temp(k + 2) <= '0';
        elsif (((temp_x(k + 2)(1) and temp_x(k + 2)(2) and temp_x(k + 2)(3) and temp_x(k + 2)(4)) = '0') and ((temp_x(k + 2)(5) and o_temp(k + 2)) = '0')) then
            o_temp(k + 2) <= '0';
        else
            o_temp(k + 2) <= '1';
        end if;

        if(temp_x(k + 3)(0) and temp_x(k + 3)(1) and temp_x(k + 3)(2) and temp_x(k + 3)(3)) = '1' then
            o_temp(k + 3) <= '0';
        elsif (((temp_x(k + 3)(1) and temp_x(k + 3)(2) and temp_x(k + 3)(3) and temp_x(k + 3)(4)) = '0') and ((temp_x(k + 3)(5) and o_temp(k + 3)) = '0')) then
            o_temp(k + 3) <= '0';
        else
            o_temp(k + 3) <= '1';
        end if;

        if(temp_x(k + 4)(0) and temp_x(k + 4)(1) and temp_x(k + 4)(2) and temp_x(k + 4)(3)) = '1' then
            o_temp(k + 4) <= '0';
        elsif (((temp_x(k + 4)(1) and temp_x(k + 4)(2) and temp_x(k + 4)(3) and temp_x(k + 4)(4)) = '0') and ((temp_x(k + 4)(5) and o_temp(k + 4)) = '0')) then
            o_temp(k + 4) <= '0';
        else
            o_temp(k + 4) <= '1';
        end if;

        if(temp_x(k + 5)(0) and temp_x(k + 5)(1) and temp_x(k + 5)(2) and temp_x(k + 5)(3)) = '1' then
            o_temp(k + 5) <= '0';
        elsif (((temp_x(k + 5)(1) and temp_x(k + 5)(2) and temp_x(k + 5)(3) and temp_x(k + 5)(4)) = '0') and ((temp_x(k + 5)(5) and o_temp(k + 5)) = '0')) then
            o_temp(k + 5) <= '0';
        else
            o_temp(k + 5) <= '1';
        end if;

        if(temp_x(k + 6)(0) and temp_x(k + 6)(1) and temp_x(k + 6)(2) and temp_x(k + 6)(3)) = '1' then
            o_temp(k + 6) <= '0';
        elsif (((temp_x(k + 6)(1) and temp_x(k + 6)(2) and temp_x(k + 6)(3) and temp_x(k + 6)(4)) = '0') and ((temp_x(k + 6)(5) and o_temp(k + 6)) = '0')) then
            o_temp(k + 6) <= '0';
        else
            o_temp(k + 6) <= '1';
        end if;

        if(temp_x(k + 7)(0) and temp_x(k + 7)(1) and temp_x(k + 7)(2) and temp_x(k + 7)(3)) = '1' then
            o_temp(k + 7) <= '0';
        elsif (((temp_x(k + 7)(1) and temp_x(k + 7)(2) and temp_x(k + 7)(3) and temp_x(k + 7)(4)) = '0') and ((temp_x(k + 7)(5) and o_temp(k + 7)) = '0')) then
            o_temp(k + 7) <= '0';
        else
            o_temp(k + 7) <= '1';
        end if;
            
        y <= o_temp;
    end process;

end c_new_full_scheme_arch;
