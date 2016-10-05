library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity JK_tb is
end JK_tb;

architecture JK_arch of JK_tb is
    component JK is
    port (J    ,
          Clk  ,
          K    ,
          Rbar ,
          Sbar : in std_logic;
          Q    ,
          Qbar : out std_logic);
    end component JK;
    
    signal J_o   ,
           Clk_o ,  
           K_o   ,   
           Rbar_o,  
           Sbar_o,  
           Q_o   ,   
           Qbar_o : std_logic := '0';  
     
begin
    
    JK_inst : JK port map(J_o   ,
                          Clk_o ,
                          K_o  ,
                          Rbar_o,
                          Sbar_o, 
                          Q_o   ,
                          Qbar_o);

    process 
    begin 
        Clk_o <= '0';
        wait for 5 ns;
        Clk_o <= '1';
        wait for 5 ns;
    end process;
    
    process
 --       variable err_cnt: integer := 0;
    begin
        Rbar_o <= '1';
        Sbar_o <= '1';
        J_o <= '1';
        K_o <= '1';
        wait for 10 ns;
        Rbar_o <= '0';
        wait for 10 ns;
        Rbar_o <= '1';
        wait for 20 ns;
        Sbar_o <= '0';
        wait for 10 ns;
        Sbar_o <= '1';
        J_o <= '0';
        wait for 10 ns;
        K_o <= '0';
        J_o <= '1';
        wait for 10 ns;
        K_o <= '1';
        wait for 20 ns;
        Rbar_o <= '0';
        Sbar_o <= '0';
        wait for 10 ns;
        Rbar_o <= '1';
        Sbar_o <= '1';
        wait for 10 ns;
                
--        -- case 1
--        J_o <= '0';
--        K_o <= '1';
--        wait for 15 ns;
--        assert (Q_o='0') report "Error1!" severity error;
--        if (Q_o/='0') then 
--            err_cnt := err_cnt + 1;
--        end if;
        
--        -- case 2
--        wait for 5 ns;
--        J_o <= '1';
--        K_o <= '0';
--        wait for 15 ns;
--        assert (Q_o='1') report "Error2!" severity error;
--        if (Q_o/='0') then 
--            err_cnt := err_cnt + 1;
--        end if;
        
--        -- case 3
--        wait for 5 ns;
--        J_o <= '1';
--        K_o <= '1';
--        wait for 15 ns;
--        assert (Q_o='0') report "Error3!" severity error;
--        if (Q_o/='0') then
--            err_cnt := err_cnt + 1;
--        end if;
        
--        --summary of all the tests
--        if (err_cnt=0) then
--            assert false 
--            report "Testbench of Adder completed successfully!"severity note;
--        else
--            assert true 
--            report "Something wrong, try again"severity error;
--        end if;
    end process;
 

end JK_arch;
