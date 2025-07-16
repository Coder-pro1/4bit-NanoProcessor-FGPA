library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Program_Counter is
--
end TB_Program_Counter;

architecture Behavioral of TB_Program_Counter is

    -- Component Declaration

    component Program_Counter
        Port (
            Clk : in  STD_LOGIC;

            Res : in  STD_LOGIC;

            I   : in  STD_LOGIC_VECTOR (2 downto 0);

            Y   : out STD_LOGIC_VECTOR (2 downto 0)
      );
    end component;
    -- Test Signals

    signal Clk : STD_LOGIC := '0';

    signal Res : STD_LOGIC := '0';

    signal I   : STD_LOGIC_VECTOR (2 downto 0) := "000";

    signal Y   : STD_LOGIC_VECTOR (2 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)

    uut: Program_Counter Port Map (

        Clk => Clk,

        Res => Res,

        I   => I,

        Y   => Y

    );

    -- Clock Generation: 10 ns period

    clk_process : process

    begin

        while true loop

            Clk <= '0'; wait for 5 ns;

            Clk <= '1'; wait for 5 ns;

        end loop;

    end process;

    -- Stimulus Process

    stim_proc: process

    begin

        -- Test 1: Reset high, input doesn't matter

        Res <= '1'; I <= "101"; wait for 100 ns;



        -- Test 2: Load 000

        Res <= '0'; I <= "000"; wait for 100 ns;



        -- Test 3: Load 001

        I <= "001"; wait for 100 ns;



        -- Test 4: Load 010

        I <= "010"; wait for 100 ns;



        -- Test 5: Load 011

        I <= "011"; wait for 100 ns;



        -- Test 6: Load 100

        I <= "100"; wait for 100 ns;



        -- Test 7: Load 101

        I <= "101"; wait for 100 ns;



        -- Test 8: Load 110

        I <= "110"; wait for 100 ns;



        -- Test 9: Load 111

        I <= "111"; wait for 100 ns;



        -- Test 10: Reset again

        Res <= '1'; wait for 100 ns;



        -- End of simulation

        wait;

    end process;



end Behavioral;