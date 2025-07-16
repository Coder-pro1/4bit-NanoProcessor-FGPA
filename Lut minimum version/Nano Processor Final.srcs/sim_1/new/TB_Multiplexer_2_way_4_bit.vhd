----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2025 07:07:29 PM
-- Design Name: 
-- Module Name: MUX_2way_4bit_TB - Behavioral
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

entity TB_Multiplexer_2_way_4_bit is
--  Port ( );
end TB_Multiplexer_2_way_4_bit;

architecture Behavioral of TB_Multiplexer_2_way_4_bit is

component Multiplexer_2_way_4_bit 
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal s: STD_LOGIC;
signal a,b,y: STD_LOGIC_VECTOR (3 downto 0);

begin

UUT: Multiplexer_2_way_4_bit PORT MAP(
    S => s,
    A => a,
    B => b,
    Y => y);

process begin
    s <= '0';
    a <= "0000";
    b <= "1111"; 
    wait for 100 ns;
    
    s <= '1';
    a <= "0000";
    b <= "1111"; 
    wait for 100 ns;

    s <= '0';
    a <= "1010";
    b <= "0101"; 
    wait for 100 ns;
    
    s <= '1';
    a <= "1010";
    b <= "0101"; 
    wait for 100 ns;    
    
    s <= '0';
    a <= "0011";
    b <= "1100"; 
    wait for 100 ns;
    
    s <= '1';
    a <= "0011";
    b <= "1100"; 
    wait for 100 ns;    
    
    s <= '0';
    a <= "1111";
    b <= "0000"; 
    wait for 100 ns;

    s <= '1';
    a <= "1111";
    b <= "0000"; 
    wait for 100 ns;
    
    s <= '0';
    a <= "0101";
    b <= "1010"; 
    wait for 100 ns;    
    
    s <= '1';
    a <= "0101";
    b <= "1010"; 
    wait for 100 ns;   
    
    end process;    

end Behavioral;
