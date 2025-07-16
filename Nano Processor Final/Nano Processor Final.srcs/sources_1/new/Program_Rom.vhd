library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity Program_Rom is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (11 downto 0));
end Program_Rom;

architecture Behavioral of Program_Rom is
    
    type rom_type is array (0 to 6) of std_logic_vector (11 downto 0);
        signal program_ROM : rom_type := (
            "101110000001", --Movi R7,1
            "101100000010", --MOVI R6,2
            "101010000011", --MOVI R5,3
            "001111100000", --ADD R7, R6
            "001111010000", --ADD R7, R5
            "110010000110", --JZR R1, 7
             "110000000100"  --JZR R0, 5
            );

begin

    O <= program_ROM(to_integer(unsigned(I)));

end Behavioral;