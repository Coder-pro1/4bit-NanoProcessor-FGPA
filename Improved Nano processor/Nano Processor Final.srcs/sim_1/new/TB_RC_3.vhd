library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_RC_3 is
end TB_RC_3;

architecture Behavioral of TB_RC_3 is

    -- Component Declaration
    component RC_3
        Port ( 
            A : in  STD_LOGIC_VECTOR(2 downto 0);
            B : in  STD_LOGIC_VECTOR(2 downto 0);
            S : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- Test Signals
    signal A : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal B : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal S : STD_LOGIC_VECTOR(2 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: RC_3 Port Map (
        A => A,
        B => B,
        S => S
    );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test 1: A = 000, B = 000
        A <= "000"; B <= "000"; wait for 100 ns;

        -- Test 2: A = 001, B = 001
        A <= "001"; B <= "001"; wait for 100 ns;

        -- Test 3: A = 011, B = 010
        A <= "011"; B <= "010"; wait for 100 ns;

        -- Test 4: A = 111, B = 001
        A <= "111"; B <= "001"; wait for 100 ns;

        -- Test 5: A = 101, B = 011
        A <= "101"; B <= "011"; wait for 100 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;