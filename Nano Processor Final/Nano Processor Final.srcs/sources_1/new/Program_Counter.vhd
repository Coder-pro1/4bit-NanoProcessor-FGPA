library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter is
    Port (
        Clk : in  STD_LOGIC;
        Res : in  STD_LOGIC;
        I   : in  STD_LOGIC_VECTOR (2 downto 0);
        Y   : out STD_LOGIC_VECTOR (2 downto 0)
    );
end Program_Counter;

architecture Behavioral of Program_Counter is
    signal pc_reg : std_logic_vector(2 downto 0) := "000";  -- initialize to 000
begin
    process(clk, Res)
    begin
        if Res = '1' then
            pc_reg <= "000";  -- on reset, set to 0
        elsif rising_edge(clk) then
            pc_reg <= I;      -- update from mux
        end if;
    end process;

    Y <= pc_reg;
end Behavioral;
