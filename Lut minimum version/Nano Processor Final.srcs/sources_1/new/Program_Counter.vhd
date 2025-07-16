library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter is
    Port (
        clk : in  STD_LOGIC;
        Res : in  STD_LOGIC;
        I   : in  STD_LOGIC_VECTOR (2 downto 0);
        Y   : out STD_LOGIC_VECTOR (2 downto 0)
    );
end Program_Counter;

architecture Behavioral of Program_Counter is
    signal reg : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if Res = '1' then
                reg <= (others => '0');
            else
                reg <= I;
            end if;
        end if;
    end process;

    Y <= reg;

end Behavioral;