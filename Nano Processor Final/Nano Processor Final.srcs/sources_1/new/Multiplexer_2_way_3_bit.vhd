
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_2_way_3_bit is
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end Multiplexer_2_way_3_bit;

architecture Behavioral of Multiplexer_2_way_3_bit is

begin

Y(0) <= (NOT S AND A(0)) OR (S AND B(0));
Y(1) <= (NOT S AND A(1)) OR (S AND B(1));
Y(2) <= (NOT S AND A(2)) OR (S AND B(2));

end Behavioral;
