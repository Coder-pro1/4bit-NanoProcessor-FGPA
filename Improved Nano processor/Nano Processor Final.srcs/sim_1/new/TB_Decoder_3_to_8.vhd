library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Decoder_3_to_8 is
--
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is

    -- Component Declaration
    component Decoder_3_to_8
        Port (
            I  : in  STD_LOGIC_VECTOR (2 downto 0);
            EN : in  STD_LOGIC;
            Y  : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    -- Test Signals
    signal I  : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal EN : STD_LOGIC := '0';
    signal Y  : STD_LOGIC_VECTOR (7 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Decoder_3_to_8 Port Map (
        I  => I,
        EN => EN,
        Y  => Y
    );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test 1: All inputs 0, EN=0 => Y should be 00000000
        I <= "000"; EN <= '0'; wait for 100 ns;

        -- Test 2: All inputs 0, EN=1 => Y(0) = '1'
        I <= "000"; EN <= '1'; wait for 100 ns;

        -- Test 3: I = 001, EN = 1 => Y(1) = '1'
        I <= "001"; wait for 100 ns;

        -- Test 4: I = 010, EN = 1 => Y(2) = '1'
        I <= "010"; wait for 100 ns;

        -- Test 5: I = 011, EN = 1 => Y(3) = '1'
        I <= "011"; wait for 100 ns;

        -- Test 6: I = 100, EN = 1 => Y(4) = '1'
        I <= "100"; wait for 100 ns;

        -- Test 7: I = 101, EN = 1 => Y(5) = '1'
        I <= "101"; wait for 100 ns;

        -- Test 8: I = 110, EN = 1 => Y(6) = '1'
        I <= "110"; wait for 100 ns;

        -- Test 9: I = 111, EN = 1 => Y(7) = '1'
        I <= "111"; wait for 100 ns;

        -- Test 10: EN = 0 => All outputs low again
        EN <= '0'; wait for 100 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;