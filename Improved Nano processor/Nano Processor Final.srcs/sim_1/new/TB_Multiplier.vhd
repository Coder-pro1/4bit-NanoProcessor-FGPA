library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Multiplier is
end TB_Multiplier;

architecture behavior of TB_Multiplier is

    -- Component Declaration for the Unit Under Test (UUT)
    component Multiplier
        Port (
            A : in  STD_LOGIC_VECTOR(3 downto 0);
            B : in  STD_LOGIC_VECTOR(3 downto 0);
            P : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Testbench signals
    signal A_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal B_tb : STD_LOGIC_VECTOR(3 downto 0);
    signal P_tb : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Multiplier
        port map (
            A => A_tb,
            B => B_tb,
            P => P_tb
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test 1: 2 x 2 = 4
        A_tb <= "0010";
        B_tb <= "0010";
        wait for 100 ns;

        -- Test 2: 3 x 4 = 12
        A_tb <= "0011";
        B_tb <= "0100";
        wait for 100 ns;

        -- Test 3: 5 x 5 = 25 -> result is 1001 (only 4 LSB bits of 11001)
        A_tb <= "0101";
        B_tb <= "0101";
        wait for 100 ns;

        -- Test 4: 7 x 2 = 14
        A_tb <= "0111";
        B_tb <= "0010";
        wait for 100 ns;

        -- Test 5: 15 x 1 = 15
        A_tb <= "1111";
        B_tb <= "0001";
        wait for 100 ns;

        -- Test 6: 15 x 15 = 225 ? lower 4 bits of 0xE1 = 0001
        A_tb <= "1111";
        B_tb <= "1111";
        wait for 100 ns;

        wait;
    end process;

end behavior;
