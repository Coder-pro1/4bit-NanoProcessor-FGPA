library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
    Port (
        D     : in  STD_LOGIC;
        Res   : in  STD_LOGIC;
        Clk   : in  STD_LOGIC;
        Q     : out STD_LOGIC
    );
end D_FF;

architecture Behavioral of D_FF is
begin
    process (Clk)
    begin
        if rising_edge(Clk) then
            if Res = '1' then
                Q    <= '0';
            else
                Q    <= D;
            end if;
        end if;
    end process;
end Behavioral;
