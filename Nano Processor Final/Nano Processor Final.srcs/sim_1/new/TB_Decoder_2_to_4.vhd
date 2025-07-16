library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Decoder_2_to_4 is
end TB_Decoder_2_to_4;

architecture Behavioral of TB_Decoder_2_to_4 is

    -- Component Declaration
    component Decoder_2_to_4
        Port (
            I  : in  STD_LOGIC_VECTOR (1 downto 0);
            EN : in  STD_LOGIC;
            Y  : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Test Signals
    signal I  : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal EN : STD_LOGIC := '0';
    signal Y  : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the UUT
    uut: Decoder_2_to_4 Port Map (
        I  => I,
        EN => EN,
        Y  => Y
    );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test 1: Disabled, I = "00"
        EN <= '0'; I <= "00"; wait for 100 ns;

        -- Test 2: Disabled, I = "01"
        I <= "01"; wait for 100 ns;

        -- Test 3: Disabled, I = "10"
        I <= "10"; wait for 100 ns;

        -- Test 4: Disabled, I = "11"
        I <= "11"; wait for 100 ns;

        -- Test 5: Enabled, I = "00"
        EN <= '1'; I <= "00"; wait for 100 ns;

        -- Test 6: Enabled, I = "01"
        I <= "01"; wait for 100 ns;

        -- Test 7: Enabled, I = "10"
        I <= "10"; wait for 100 ns;

        -- Test 8: Enabled, I = "11"
        I <= "11"; wait for 100 ns;

        -- Test 9: Toggle Enable off then back on
        EN <= '0'; I <= "10"; wait for 100 ns;
        EN <= '1'; I <= "10"; wait for 100 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;