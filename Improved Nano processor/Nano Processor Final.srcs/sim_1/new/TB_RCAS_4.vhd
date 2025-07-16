library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_RCAS_4 is
end TB_RCAS_4;

architecture Behavioral of TB_RCAS_4 is

    -- Component Declaration
    component RCAS_4
        Port (
            A      : in  STD_LOGIC_VECTOR(3 downto 0);
            B      : in  STD_LOGIC_VECTOR(3 downto 0);
            AddSub : in  STD_LOGIC;
            S      : out STD_LOGIC_VECTOR(3 downto 0);
            C_out  : out STD_LOGIC
        );
    end component;

    -- Test Signals
    signal A, B : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal AddSub : STD_LOGIC := '0';
    signal S : STD_LOGIC_VECTOR(3 downto 0);
    signal C_out : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: RCAS_4 Port Map (
        A => A,
        B => B,
        AddSub => AddSub,
        S => S,
        C_out => C_out
    );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test 1: Addition 3 + 2
        A <= "0011"; B <= "0010"; AddSub <= '0'; wait for 100 ns;

        -- Test 2: Subtraction 5 - 3
        A <= "0101"; B <= "0011"; AddSub <= '1'; wait for 100 ns;

        -- Test 3: Addition with carry 8 + 8
        A <= "1000"; B <= "1000"; AddSub <= '0'; wait for 100 ns;

        -- Test 4: Subtraction with borrow 4 - 5
        A <= "0100"; B <= "0101"; AddSub <= '1'; wait for 100 ns;

        -- Test 5: Zero result 4 - 4
        A <= "0100"; B <= "0100"; AddSub <= '1'; wait for 100 ns;

        -- Test 6: Maximum addition 15 + 15
        A <= "1111"; B <= "1111"; AddSub <= '0'; wait for 100 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
