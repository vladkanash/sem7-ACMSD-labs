library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

---------------------

entity JK is
    port (J    ,
          Clk  ,
          K    ,
          Rbar ,
          Sbar : in std_logic;
          Q    ,
          Qbar : out std_logic);
end entity JK;
    
---------------------  
  
architecture JK_arch of JK is
    signal Q_temp : std_logic := '0';
begin
    
	process (Clk, Rbar, Sbar)
	begin
        if ( Sbar = '1' and Rbar = '0')then           
            Q_temp <= '0';
        elsif (Sbar = '0' and Rbar = '1') then           
            Q_temp <= '1';
        elsif (Sbar = '0' and Rbar = '0') then           
            Q_temp <= 'X';
		elsif (rising_edge(Clk)) then
			if (J = '0' and K = '1') then   
				Q_temp <= '0';
			elsif (J = '1' and K = '0') then  
				Q_temp <= '1';
			else                          
				Q_temp <= not Q_temp;
			end if;
		end if;
	end process;
	
	Q <= Q_temp;
    Qbar <= not Q_temp;
   
end architecture JK_arch;
