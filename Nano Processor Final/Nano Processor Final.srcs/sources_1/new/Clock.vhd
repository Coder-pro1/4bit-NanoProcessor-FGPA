library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Clock;

architecture Behavioral of Clock is

signal count : integer := 1;
signal clk_status : std_logic := '0';

begin
    process (Clk_in) begin
        if rising_edge(Clk_in) then
            count <= count + 1;               -- Increment counter
            if(count = 5) then         
                clk_status <= not clk_status; -- Invert clock status
                Clk_out <= clk_status;
                count <= 1;                   -- Reset counter
            end if;
        end if;
    end process;
    
end Behavioral;