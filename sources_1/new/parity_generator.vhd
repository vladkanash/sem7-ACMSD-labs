----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/25/2016 09:39:39 PM
-- Design Name: 
-- Module Name: parity_generator - Behavioral
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

entity parity_generator is
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
end parity_generator;

architecture Behavioral of parity_generator is

    signal xor_block1, xor_block2, xor_block3: STD_LOGIC;
    signal xor_block_result: STD_LOGIC;
    signal parity_buf: STD_LOGIC;
begin

    xor_block1 <= (A xnor B) xnor (not C);
    xor_block2 <= (D xnor E) xnor (not F);
    xor_block3 <= (G xnor H) xnor (not I);
    
    xor_block_result  <= (xor_block1 xnor xor_block2) xnor (not xor_block3);
    
    PARITY_IO <= not xor_block_result when (N_XMIT = '0') else 'Z';
    
    PARITY_ERROR <= ((not xor_block_result) xnor (not PARITY_IO)) nand N_XMIT;
        
end Behavioral;
