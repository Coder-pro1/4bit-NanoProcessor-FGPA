library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_Comparator is
end TB_Comparator;

architecture behavior of TB_Comparator is

    -- Component Declaration for the Unit Under Test (UUT)
    component Comparator
        Port ( 
            A      : in  STD_LOGIC_VECTOR(3 downto 0);
            B      : in  STD_LOGIC_VECTOR(3 downto 0);
            equal  : out STD_LOGIC;
            less   : out STD_LOGIC;
            great  : out STD_LOGIC
        );
    end component;

    -- Testbench signals
    signal A_tb     : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal B_tb     : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal equal_tb : STD_LOGIC;
    signal less_tb  : STD_LOGIC;
    signal great_tb : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Comparator Port Map (
        A      => A_tb,
        B      => B_tb,
        equal  => equal_tb,
        less   => less_tb,
        great  => great_tb
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test Case 1: A = 5, B = 5 ? equal
        A_tb <= "0101"; B_tb <= "0101";
        wait for 100 ns;

        -- Test Case 2: A = 3, B = 7 ? less
        A_tb <= "0011"; B_tb <= "0111";
        wait for 100 ns;

        -- Test Case 3: A = 10, B = 2 ? greater
        A_tb <= "1010"; B_tb <= "0010";
        wait for 100 ns;

        -- Test Case 4: A = 0, B = 15 ? less
        A_tb <= "0000"; B_tb <= "1111";
        wait for 100 ns;

        -- Test Case 5: A = 15, B = 0 ? greater
        A_tb <= "1111"; B_tb <= "0000";
        wait for 100 ns;

        -- Test Case 6: A = 8, B = 8 ? equal
        A_tb <= "1000"; B_tb <= "1000";
        wait for 100 ns;

        -- Test Case 7: A = 6, B = 4 ? greater
        A_tb <= "0110"; B_tb <= "0100";
        wait for 100 ns;

        -- End simulation
        wait;
    end process;

end behavior;
