library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity full_scheme is
    port (CPD    ,
          CPU    ,
          MR     ,
          PLbar  : in std_logic;
          Data   : in std_logic_vector (3 downto 0);
          TCDbar ,
          TCUbar : out std_logic;
          Q      : out std_logic_vector(3 downto 0));
end full_scheme;

architecture fs_bhv of full_scheme is
    component JK is
        port (J    ,
              Clk  ,
              K    ,
              Rbar ,
              Sbar : in std_logic;
              Q    ,
              Qbar : out std_logic);
    end component;
    
    signal CPDbuff,
           CPUbuff,
           MRbuff,
           PLbbuff,
           JKR : std_logic;
    signal AND_0 : std_logic_vector(7 downto 0);
    signal JKCs, 
           JKQs, 
           JKQbars : std_logic_vector(3 downto 0);  
begin
    CPDbuff <= not CPD;
    CPUbuff <= not CPU;
    MRbuff  <= not MR;
    PLbbuff <= not PLbar;
          
    AND_0(0) <= CPDbuff and JKQbars(0) and AND_0(2);
    AND_0(1) <= CPUbuff and JKQs(0) and JKQbars(3);
    AND_0(2) <= not (JKQbars(1) and JKQbars(2) and JKQbars(3));
    AND_0(3) <= CPDbuff and JKQbars(0) and JKQbars(1) and AND_0(2);
    AND_0(4) <= JKQs(0) and JKQs(1) and CPUbuff;
    AND_0(5) <= CPDbuff and JKQbars(0) and JKQbars(1) and JKQbars(2);
    AND_0(6) <= JKQs(0) and JKQs(3) and CPUbuff;--
    AND_0(7) <= JKQs(0) and JKQs(1) and JKQs(2) and CPUbuff;
    
    JKCs(0) <= CPDbuff or CPUbuff;
    JKCs(1) <= AND_0(1) or AND_0(0);
    JKCs(2) <= AND_0(3) or AND_0(4);
    JKCs(3) <= AND_0(5) or AND_0(7) or AND_0(6);

    gen_JKins: 
    for k in 0 to 3 generate
        JKins : JK port map ('1'         ,
                             not JKCs(k) ,
                             '1'         ,
                             MRbuff and (PLbbuff nand (not (Data(k) and PLbbuff and MRbuff))),
                             not (Data(k) and PLbbuff and MRbuff),
                             JKQs(k)     ,
                             JKQbars(k) ); 
    end generate gen_JKins;
      
    TCDbar <= not (CPDbuff and JKQbars(0) and JKQbars(1) and JKQbars(2) and JKQbars(3));
    TCUbar <= not (CPUbuff and JKQs(0) and JKQs(3));
    Q <= JKQs;     
end fs_bhv;
