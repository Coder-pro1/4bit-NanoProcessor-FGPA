
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity Program_Rom is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (11 downto 0));
end Program_Rom;

architecture Behavioral of Program_Rom is
    
    type rom_type is array (0 to 7) of std_logic_vector (11 downto 0);
        signal program_ROM : rom_type := (
                "100010000010", --movi R1, 2
                "101110000011",--MOVI R7,3
                "100100000001", --MOVI R2, 1
                "010100000000", --NEG R2
                "001110010000", --ADD R7, R1
                "000010100000", --ADD R1, R2
                "110010000110", --JZR R1, 7
                "110000000100" --JZR R0, 5
                );


begin

    O <= program_ROM(to_integer(unsigned(I)));

end Behavioral;