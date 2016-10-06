library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity full_scheme_tb is
end full_scheme_tb;

architecture fs_tb_bhv of full_scheme_tb is
    component full_scheme is
        port (CPD    ,
              CPU    ,
              MR     ,
              PLbar  : in std_logic;
              Data   : in std_logic_vector (3 downto 0);
              TCDbar ,
              TCUbar : out std_logic;
              Q      : out std_logic_vector(3 downto 0));
    end component full_scheme;
    
    signal Clk_o    ,
           CPD_o    ,
           CPU_o    ,
           MR_o     ,
           PLbar_o  : std_logic;
    signal ands_o   : std_logic_vector(7 downto 0);
    signal Data_o   : std_logic_vector (3 downto 0) := "0000";
    signal TCDbar_o ,
           TCUbar_o : std_logic;
    signal Q_o      : std_logic_vector(3 downto 0);
    signal Count_direct : std_logic := '0';
  
begin
    FSinst : full_scheme port map (CPD_o   ,
                                   CPU_o   ,
                                   MR_o    ,
                                   PLbar_o ,
                                   Data_o  ,
                                   TCDbar_o,
                                   TCUbar_o,
                                   Q_o     );
                                   
    process
    begin
        Clk_o <= '0';
        wait for 5 ns;
        Clk_o <= '1';
        wait for 5 ns;       
    end process;

    CPU_o <= Clk_o or Count_direct;
    CPD_o <= Clk_o or not Count_direct;
       
    process
    begin          
        -- reset +++++WORK+++++
        MR_o <= '1';
        wait for 26 ns;
        MR_o <= '0';    
    
        -- load preset inputs  +++++WORK+++++
        PLbar_o <= '0';
        Data_o <= "0000";
        wait for 6 ns;        
                          
        -- count UP +++++WORK+++++
        Count_direct <= '0';
        PLbar_o <= '1';
        wait for 208 ns;
        

        -- reset +++++WORK+++++
        MR_o <= '1';
        wait for 26 ns;
        MR_o <= '0';
        
        -- load preset inputs  +++++WORK+++++
        PLbar_o <= '0';
        Data_o <= "1001";
        wait for 6 ns; 
        
        -- count DOWN +++++WORK+++++
        Count_direct <= '1'; 
        PLbar_o <= '1';
        wait for 208 ns;
        
    end process;

end fs_tb_bhv;
