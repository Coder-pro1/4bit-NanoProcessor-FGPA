

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity TB_Multiplexer_8_way_4_bit is
--  Port ( );
end TB_Multiplexer_8_way_4_bit;

architecture Behavioral of TB_Multiplexer_8_way_4_bit is
component Multiplexer_8_way_4_bit

    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           I4 : in STD_LOGIC_VECTOR (3 downto 0);
           I5 : in STD_LOGIC_VECTOR (3 downto 0);
           I6 : in STD_LOGIC_VECTOR (3 downto 0);
           I7 : in STD_LOGIC_VECTOR (3 downto 0);
           I0 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal s: STD_LOGIC_VECTOR (2 downto 0);
signal i0, i1, i2, i3, i4, i5, i6, i7, y: STD_LOGIC_VECTOR (3 downto 0);

begin

UUT: Multiplexer_8_way_4_bit PORT MAP(
    S => s,
    I0 => i0,
    I1 => i1,
    I2 => i2,
    I3 => i3,
    I4 => i4,
    I5 => i5,
    I6 => i6,
    I7 => i7,
    Y => y);

process begin

    -- Test 1
    I0 <= "0110"; I1 <= "1010"; I2 <= "0001"; I3 <= "1111";
    I4 <= "1000"; I5 <= "0101"; I6 <= "1101"; I7 <= "0011"; 
    S <= "010"; wait for 100 ns;

    -- Test 2
    I0 <= "1001"; I1 <= "1100"; I2 <= "0010"; I3 <= "0111";
    I4 <= "1110"; I5 <= "0000"; I6 <= "1011"; I7 <= "0100"; 
    S <= "111"; wait for 100 ns;

    -- Test 3
    I0 <= "1111"; I1 <= "0110"; I2 <= "0100"; I3 <= "1001";
    I4 <= "0010"; I5 <= "1101"; I6 <= "0001"; I7 <= "1010"; 
    S <= "100"; wait for 100 ns;

    -- Test 4
    I0 <= "0100"; I1 <= "0011"; I2 <= "1110"; I3 <= "0111";
    I4 <= "1001"; I5 <= "0001"; I6 <= "1010"; I7 <= "1100"; 
    S <= "001"; wait for 100 ns;

    -- Test 5
    I0 <= "0000"; I1 <= "1000"; I2 <= "1101"; I3 <= "1011";
    I4 <= "0111"; I5 <= "0011"; I6 <= "0101"; I7 <= "1111"; 
    S <= "011"; wait for 100 ns;

    -- Test 6
    I0 <= "1010"; I1 <= "0001"; I2 <= "1111"; I3 <= "0010";
    I4 <= "1100"; I5 <= "0110"; I6 <= "0100"; I7 <= "1001"; 
    S <= "000"; wait for 100 ns;

    -- Test 7
    I0 <= "0011"; I1 <= "1110"; I2 <= "1011"; I3 <= "0100";
    I4 <= "0001"; I5 <= "1101"; I6 <= "0111"; I7 <= "1000"; 
    S <= "101"; wait for 100 ns;

    -- Test 8
    I0 <= "0111"; I1 <= "0101"; I2 <= "1100"; I3 <= "1000";
    I4 <= "1011"; I5 <= "0010"; I6 <= "0000"; I7 <= "1110"; 
    S <= "110"; wait for 100 ns;

    -- Test 9
    I0 <= "1000"; I1 <= "0010"; I2 <= "0000"; I3 <= "1111";
    I4 <= "1101"; I5 <= "0110"; I6 <= "1010"; I7 <= "0101"; 
    S <= "010"; wait for 100 ns;

    -- Test 10
    I0 <= "1101"; I1 <= "0001"; I2 <= "1010"; I3 <= "0011";
    I4 <= "1001"; I5 <= "0100"; I6 <= "1111"; I7 <= "0111"; 
    S <= "001"; wait for 100 ns;

end process;


end Behavioral;
