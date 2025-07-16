
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity TB_Multiplexer_4_way_4_bit is
--  Port ( );
end TB_Multiplexer_4_way_4_bit;

architecture Behavioral of TB_Multiplexer_4_way_4_bit is
component Multiplexer_4_way_4_bit
    port(S : in STD_LOGIC_VECTOR (1 downto 0);
           I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal s: STD_LOGIC_VECTOR (1 downto 0);
signal i0, i1, i2, i3, y: STD_LOGIC_VECTOR (3 downto 0);

begin

UUT: Multiplexer_4_way_4_bit PORT MAP(
    S => s,
    I0 => i0,
    I1 => i1,
    I2 => i2,
    I3 => i3,
    Y => y);

process begin

    -- Test 1
    I0 <= "0101"; I1 <= "1100"; I2 <= "0011"; I3 <= "1111"; S <= "10"; wait for 100 ns;

    -- Test 2
    I0 <= "1010"; I1 <= "0000"; I2 <= "1001"; I3 <= "0010"; S <= "00"; wait for 100 ns;

    -- Test 3
    I0 <= "1111"; I1 <= "1011"; I2 <= "0101"; I3 <= "0001"; S <= "11"; wait for 100 ns;

    -- Test 4
    I0 <= "0010"; I1 <= "0111"; I2 <= "0000"; I3 <= "1000"; S <= "01"; wait for 100 ns;

    -- Test 5
    I0 <= "1100"; I1 <= "1110"; I2 <= "0011"; I3 <= "0101"; S <= "11"; wait for 100 ns;

    -- Test 6
    I0 <= "0110"; I1 <= "1000"; I2 <= "1011"; I3 <= "0001"; S <= "01"; wait for 100 ns;

    -- Test 7
    I0 <= "1110"; I1 <= "0001"; I2 <= "0110"; I3 <= "1001"; S <= "00"; wait for 100 ns;

    -- Test 8
    I0 <= "0000"; I1 <= "1101"; I2 <= "0100"; I3 <= "1010"; S <= "10"; wait for 100 ns;

    -- Test 9
    I0 <= "0011"; I1 <= "1111"; I2 <= "0001"; I3 <= "0111"; S <= "11"; wait for 100 ns;

    -- Test 10
    I0 <= "1011"; I1 <= "0110"; I2 <= "1001"; I3 <= "1100"; S <= "01"; wait for 100 ns;



    -- Finish simulation
    wait;
end process;
   

end Behavioral;
