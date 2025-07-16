
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Multiplexer_8_way_4_bit is
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
end Multiplexer_8_way_4_bit;

architecture Behavioral of Multiplexer_8_way_4_bit is
component Multiplexer_4_way_4_bit
    Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
       I0 : in STD_LOGIC_VECTOR (3 downto 0);
       I1 : in STD_LOGIC_VECTOR (3 downto 0);
       I2 : in STD_LOGIC_VECTOR (3 downto 0);
       I3 : in STD_LOGIC_VECTOR (3 downto 0);
       Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Multiplexer_2_way_4_bit 
     Port( S : in STD_LOGIC;
     A : in STD_LOGIC_VECTOR (3 downto 0);
     B : in STD_LOGIC_VECTOR (3 downto 0);
     Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal y0, y1 : STD_LOGIC_VECTOR (3 downto 0);

begin

MUX_4way_1 : Multiplexer_4_way_4_bit
    port map (I0 => I0,
              I1 => I1,
              I2 => I2,
              I3 => I3,
              S(0) => S(0),
              S(1) => S(1),
              Y => y0);
              
MUX_4way_2 : Multiplexer_4_way_4_bit            
    port map (I0 => I4,
              I1 => I5,
              I2 => I6,
              I3 => I7,
              S(0) => S(0),
              S(1) => S(1),
              Y => y1);
              
MUX_2way_1 : Multiplexer_2_way_4_bit
    port map(A => y0,
             B => y1,
             S => S(2),
             Y => Y);
             
end Behavioral;
