library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Program_Rom is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (11 downto 0));
end Program_Rom;

architecture Behavioral of Program_Rom is
    type rom_type is array (0 to 8) of std_logic_vector (11 downto 0);
    signal program_ROM : rom_type := (
           0  => "101110000011",  -- MOVI R7, 3
           1  => "100100000010",  -- MOVI R2, 2
           2  => "001110100101",  -- MUL R7, R2
           3  => "001110100000",  -- ADD R7, R2
           4  => "001110100001",  -- SUB R7, R2
           5  => "001110100000",  -- ADD R7, R2
           6  => "001110100011",  -- OR  R7, R2
           7  => "001110100100",  -- XOR  R7, R2
           8  => "001110100111"   -- CMP R7, R2
    );
    
begin
    O <= program_ROM(to_integer(unsigned(I)));
end Behavioral;