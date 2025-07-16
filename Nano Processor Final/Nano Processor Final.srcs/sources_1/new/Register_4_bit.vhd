library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_4_bit is
    Port (
        R_in  : in  STD_LOGIC_VECTOR (3 downto 0);
        En    : in  STD_LOGIC;
        Clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC; 
        R_out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Register_4_bit;

architecture Behavioral of Register_4_bit is
    signal q : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
begin

  process (Clk, reset)
  begin
        if reset = '1' then
            q <= (others => '0');  -- Reset output to 0000
        elsif rising_edge(Clk) then
            if En = '1' then
                q <= R_in;  -- Load input value when enabled
            end if;
        end if;
    end process;

    -- Output assignment
    R_out <= q;

end Behavioral;