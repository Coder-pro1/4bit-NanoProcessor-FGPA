
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Full_Adder is
--  Port ( );
end TB_Full_Adder;

architecture Behavioral of TB_Full_Adder is
component Full_Adder
    port (
    A,B,C_in : in STD_logic; 
    S, C_out : out STD_logic);
end component;
    
signal a, b, c_in, s, c_out : std_logic;    

begin

UUT: Full_Adder PORT MAP (
    A => a,
    B => b,
    C_in => c_in,
    S => s,
    C_out => c_out);

process begin
    a <= '0';
    b <= '0';
    c_in <= '0';
    WAIT FOR 100 ns;
    

    c_in <= '1';
    WAIT FOR 100 ns;    

    b <= '1';
    c_in <= '0';
    WAIT FOR 100 ns;

    c_in <= '1';
    WAIT FOR 100 ns;

    a <= '1';
    b <= '0';
    c_in <= '0';
    WAIT FOR 100 ns;

    c_in <= '1';
    WAIT FOR 100 ns;
    
    b <= '1';
    c_in <= '0';
    WAIT FOR 100 ns;
    
    c_in <= '1';
    WAIT;
end process;
    
end Behavioral;
