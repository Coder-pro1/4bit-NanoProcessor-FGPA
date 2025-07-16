
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is
component Half_Adder
    Port ( 
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    S : out STD_LOGIC;
    C : out STD_LOGIC);
end component;    

signal HA0_S, HA1_S, HA0_C, HA1_C :STD_logic;

begin

HA_0 : Half_Adder  
    port map(
    A => A,
    B => B,
    S => HA0_S,
    C => HA0_C);
    
HA_1 : Half_Adder
    port map(
    A => HA0_S,
    B => C_in,
    S => HA1_S,
    C => HA1_C);

S <= HA1_S;
C_out <= HA1_C OR HA0_C; 

end Behavioral;
