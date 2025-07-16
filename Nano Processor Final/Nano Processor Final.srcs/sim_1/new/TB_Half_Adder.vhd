
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_Half_Adder is
--  Port ( );
end TB_Half_Adder ;

architecture Behavioral of TB_Half_Adder  is
component Half_Adder
    port ( 
    A,B : in std_logic;
    S,C : out std_logic);
end component;

signal a,b: std_logic;
signal s,c: std_logic;

begin

UUT: Half_Adder PORT MAP(
    A => a,
    B => b,
    S => s,
    C => c);

process begin
    a <= '0';
    b <= '0';
    WAIT FOR 100 ns;
    
    b <= '1';
    WAIT FOR 100 ns;
    
    b <= '0';
    a <= '1';
    WAIT FOR 100 ns;
    
    b <= '1';
    
    WAIT;
end process;
    
    
    
end Behavioral;
