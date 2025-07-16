library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Clock is
    Port (
        Clk_in  : in  STD_LOGIC;
        Clk_out : out STD_LOGIC
    );
end Clock;

architecture Behavioral of Clock is
    constant N         : unsigned(2 downto 0) := to_unsigned(5, 3);  -- Can be changed
    signal count       : unsigned(2 downto 0) := (others => '0');
    signal clk_status  : std_logic := '0';
    signal next_count  : unsigned(2 downto 0);
    signal toggle      : std_logic;
begin

    
    toggle <= '1' when count = N - 1 else '0';

    next_count <= (others => '0') when toggle = '1' else count + 1;

    process (Clk_in)
    begin
        if rising_edge(Clk_in) then
            count      <= next_count;
            clk_status <= clk_status xor toggle;
        end if;
    end process;

    Clk_out <= clk_status;

end Behavioral;