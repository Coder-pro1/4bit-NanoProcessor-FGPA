
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_4_way_4_bit  is
    Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
           I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           I3 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplexer_4_way_4_bit ;

architecture Behavioral of Multiplexer_4_way_4_bit  is
component Multiplexer_2_way_4_bit
     Port( S : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal y0, y1: STD_LOGIC_VECTOR (3 downto 0);

begin

MUX_2way_1 : Multiplexer_2_way_4_bit
    port map( A => I0,
          B => I1,
          S => S(0),
          Y => y0);

MUX_2way_2 : Multiplexer_2_way_4_bit
    port map( A => I2,
          B => I3,
          S => S(0),
          Y => y1);

MUX_2way_3 : Multiplexer_2_way_4_bit
    port map(A => y0,
          B => y1,
          S => S(1),
          Y => Y);
              
end Behavioral;
