
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Multiplexer_2_way_3_bit is
--  Port ( );
end TB_Multiplexer_2_way_3_bit;

architecture Behavioral of TB_Multiplexer_2_way_3_bit is

component Multiplexer_2_way_3_bit
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal s: STD_LOGIC;
signal a,b,y: STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: Multiplexer_2_way_3_bit PORT MAP(
    S => s,
    A => a,
    B => b,
    Y => y);

process begin
    s <= '0';
    a <= "001";
    b <= "110"; 
    wait for 100 ns;
    
    s <= '1';
    a <= "010";
    b <= "101"; 
    wait for 100 ns;

    s <= '0';
    a <= "111";
    b <= "000"; 
    wait for 100 ns;
    
    s <= '1';
    a <= "011";
    b <= "100"; 
    wait for 100 ns;    
    
    s <= '0';
    a <= "100";
    b <= "011"; 
    wait for 100 ns;
    
    s <= '1';
    a <= "101";
    b <= "010"; 
    wait for 100 ns;    
    
    s <= '0';
    a <= "000";
    b <= "111"; 
    wait for 100 ns;

    s <= '1';
    a <= "110";
    b <= "001"; 
    wait for 100 ns;
    
    s <= '0';
    a <= "010";
    b <= "101"; 
    wait for 100 ns;    
    
    s <= '1';
    a <= "001";
    b <= "110"; 
    wait for 100 ns;   
    
    end process;
             
end Behavioral;
