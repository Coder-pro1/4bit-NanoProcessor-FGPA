library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Program_Rom is
end TB_Program_Rom;

architecture tb of TB_Program_Rom is

    -- Declare the component under test
    component Program_Rom
        Port (
            I : in  STD_LOGIC_VECTOR (2 downto 0);
            O : out STD_LOGIC_VECTOR (11 downto 0)
        );
    end component;

    -- Signals to connect to UUT
    signal I_tb : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal O_tb : STD_LOGIC_VECTOR (11 downto 0);

begin

    -- Instantiate the UUT
    uut: Program_Rom
        port map (
            I => I_tb,
            O => O_tb
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test 10 different inputs with 100 ns delay
        I_tb <= "000"; wait for 100 ns;  -- Expect "100010000010"
        I_tb <= "001"; wait for 100 ns;  -- Expect "101110000011"
        I_tb <= "010"; wait for 100 ns;  -- Expect "100100000001"
        I_tb <= "011"; wait for 100 ns;  -- Expect "010100000000"
        I_tb <= "100"; wait for 100 ns;  -- Expect "001110010000"
        I_tb <= "101"; wait for 100 ns;  -- Expect "000010100000"
        I_tb <= "110"; wait for 100 ns;  -- Expect "110010000110"
        I_tb <= "111"; wait for 100 ns;  -- Expect "110000000100"
        I_tb <= "010"; wait for 100 ns;  -- Re-check
        I_tb <= "000"; wait for 100 ns;  -- Re-check

        wait;  -- End simulation
    end process;

end tb;