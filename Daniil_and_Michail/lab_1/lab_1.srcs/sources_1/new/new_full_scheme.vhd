library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

---------------------

entity new_full_scheme is
    port (      not_G   : in std_logic;
                D       : in std_logic;
                S       : in std_logic_vector(2 downto 0);
                not_CLR : in std_logic;
                y       : out std_logic_vector(7 downto 0));
end entity new_full_scheme;

---------------------

architecture new_full_scheme_arch of new_full_scheme is
        
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
    
    temp_x(k + 0) <= xx xnor ("11"&conv_std_logic_vector(k + 0, 3)&"1");
    o_temp(k + 0) <= (temp_x(k + 0)(0) and temp_x(k + 0)(1) and temp_x(k + 0)(2) and temp_x(k + 0)(3)) nor ((temp_x(k + 0)(1) and temp_x(k + 0)(2) and temp_x(k + 0)(3) and temp_x(k + 0)(4)) nor (temp_x(k + 0)(5) and o_temp(k + 0)));
    y(k + 0) <= o_temp(k + 0);
    
    temp_x(k + 1) <= xx xnor ("11"&conv_std_logic_vector(k + 1, 3)&"1");
    o_temp(k + 1) <= (temp_x(k + 1)(0) and temp_x(k + 1)(1) and temp_x(k + 1)(2) and temp_x(k + 1)(3)) nor ((temp_x(k + 1)(1) and temp_x(k + 1)(2) and temp_x(k + 1)(3) and temp_x(k + 1)(4)) nor (temp_x(k + 1)(5) and o_temp(k + 1)));
    y(k + 1) <= o_temp(k + 1);
        
    temp_x(k + 2) <= xx xnor ("11"&conv_std_logic_vector(k + 2, 3)&"1");
    o_temp(k + 2) <= (temp_x(k + 2)(0) and temp_x(k + 2)(1) and temp_x(k + 2)(2) and temp_x(k + 2)(3)) nor ((temp_x(k + 2)(1) and temp_x(k + 2)(2) and temp_x(k + 2)(3) and temp_x(k + 2)(4)) nor (temp_x(k + 2)(5) and o_temp(k + 2)));
    y(k + 2) <= o_temp(k + 2);
    
    temp_x(k + 3) <= xx xnor ("11"&conv_std_logic_vector(k + 3, 3)&"1");
    o_temp(k + 3) <= (temp_x(k + 3)(0) and temp_x(k + 3)(1) and temp_x(k + 3)(2) and temp_x(k + 3)(3)) nor ((temp_x(k + 3)(1) and temp_x(k + 3)(2) and temp_x(k + 3)(3) and temp_x(k + 3)(4)) nor (temp_x(k + 3)(5) and o_temp(k + 3)));
    y(k + 3) <= o_temp(k + 3);
   
    temp_x(k + 4) <= xx xnor ("11"&conv_std_logic_vector(k + 4, 3)&"1");
    o_temp(k + 4) <= (temp_x(k + 4)(0) and temp_x(k + 4)(1) and temp_x(k + 4)(2) and temp_x(k + 4)(3)) nor ((temp_x(k + 4)(1) and temp_x(k + 4)(2) and temp_x(k + 4)(3) and temp_x(k + 4)(4)) nor (temp_x(k + 4)(5) and o_temp(k + 4)));
    y(k + 4) <= o_temp(k + 4);
       
    temp_x(k + 5) <= xx xnor ("11"&conv_std_logic_vector(k + 5, 3)&"1");
    o_temp(k + 5) <= (temp_x(k + 5)(0) and temp_x(k + 5)(1) and temp_x(k + 5)(2) and temp_x(k + 5)(3)) nor ((temp_x(k + 5)(1) and temp_x(k + 5)(2) and temp_x(k + 5)(3) and temp_x(k + 5)(4)) nor (temp_x(k + 5)(5) and o_temp(k + 5)));
    y(k + 5) <= o_temp(k + 5);
    
    temp_x(k + 6) <= xx xnor ("11"&conv_std_logic_vector(k + 6, 3)&"1");
    o_temp(k + 6) <= (temp_x(k + 6)(0) and temp_x(k + 6)(1) and temp_x(k + 6)(2) and temp_x(k + 6)(3)) nor ((temp_x(k + 6)(1) and temp_x(k + 6)(2) and temp_x(k + 6)(3) and temp_x(k + 6)(4)) nor (temp_x(k + 6)(5) and o_temp(k + 6)));
    y(k + 6) <= o_temp(k + 6);
    
    temp_x(k + 7) <= xx xnor ("11"&conv_std_logic_vector(k + 7, 3)&"1");
    o_temp(k + 7) <= (temp_x(k + 7)(0) and temp_x(k + 7)(1) and temp_x(k + 7)(2) and temp_x(k + 7)(3)) nor ((temp_x(k + 7)(1) and temp_x(k + 7)(2) and temp_x(k + 7)(3) and temp_x(k + 7)(4)) nor (temp_x(k + 7)(5) and o_temp(k + 7)));
    y(k + 7) <= o_temp(k + 7);

end architecture new_full_scheme_arch;
