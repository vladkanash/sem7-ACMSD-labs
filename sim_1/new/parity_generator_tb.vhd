----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/25/2016 10:44:01 PM
-- Design Name: 
-- Module Name: parity_generator_tb - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity parity_generator_tb is
--  Port ( );
end parity_generator_tb;

architecture Behavioral of parity_generator_tb is
    component parity_generator is
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
    end component;
    
        component parity_generator_serial is
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
    end component;
    
    signal inputs: STD_LOGIC_VECTOR(8 downto 0);
    signal parity_io, n_xmit, parity_error: STD_LOGIC;
    signal parity_io_serial, n_xmit_serial, parity_error_serial: STD_LOGIC;
begin
    parity_generator_instance: parity_generator port map(
        A => inputs(0),
        B => inputs(1),
        C => inputs(2),
        D => inputs(3),
        E => inputs(4),
        F => inputs(5),
        G => inputs(6),
        H => inputs(7),
        I => inputs(8),
        PARITY_IO => parity_io,
        N_XMIT => n_xmit,
        PARITY_ERROR => parity_error
    );
    
    parity_generator_instance_serial: parity_generator_serial port map(
        A => inputs(0),
        B => inputs(1),
        C => inputs(2),
        D => inputs(3),
        E => inputs(4),
        F => inputs(5),
        G => inputs(6),
        H => inputs(7),
        I => inputs(8),
        PARITY_IO => parity_io_serial,
        N_XMIT => n_xmit_serial,
        PARITY_ERROR => parity_error_serial
    );
    
    process
    begin
        for index in 0 to 511 loop
            inputs <= conv_std_logic_vector(index, 9);
            n_xmit <= '0';
            n_xmit_serial <= '0';
            parity_io <= 'Z';
            parity_io_serial <= 'Z';
            wait for 10 ns;
            
            n_xmit <= '1';
            n_xmit_serial <= '1';
            parity_io <= '1';
            parity_io_serial <= '1';
            
            
            wait for 10 ns;
            
            n_xmit <= '1';
            n_xmit_serial <= '1';
            parity_io <= '0';
            parity_io_serial <= '0';
            wait for 10 ns;

        end loop; 
    end process;

end Behavioral;
