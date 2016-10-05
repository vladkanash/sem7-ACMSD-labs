----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/25/2016 09:40:11 PM
-- Design Name: 
-- Module Name: parity_generator_serial - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity parity_generator_serial is
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       C : in STD_LOGIC;
       D : in STD_LOGIC;
       E : in STD_LOGIC;
       F : in STD_LOGIC;
       G : in STD_LOGIC;
       H : in STD_LOGIC;
       I : in STD_LOGIC;
       PARITY_IO : inout STD_LOGIC;
       N_XMIT : in STD_LOGIC;
       PARITY_ERROR: out STD_LOGIC);
end parity_generator_serial;

architecture Behavioral of parity_generator_serial is

signal even_bits: STD_LOGIC;

begin

--     inputs(0) <= A;
--     inputs(1) <= B;
--     inputs(2) <= C;
--     inputs(3) <= D;
--     inputs(4) <= E;
--     inputs(5) <= F;
--     inputs(6) <= G;
--     inputs(7) <= H;
--     inputs(8) <= I;
   
    process(A, B, C, D, E, F, G, H, I)
    begin
    even_bits <= not (((A xnor B) xnor not C) xnor ((D xnor E) xnor not F)) xnor not ((G xnor H) xnor not I);
    end process;
    
    process(even_bits, N_XMIT, PARITY_IO)
    begin
        if (N_XMIT = '0') then
            PARITY_ERROR <= '1';
            PARITY_IO <= even_bits;
        elsif (N_XMIT = '1') then
            PARITY_IO <= 'Z';
            PARITY_ERROR <= even_bits xnor PARITY_IO;
        end if;
    end process;
        
end Behavioral;
