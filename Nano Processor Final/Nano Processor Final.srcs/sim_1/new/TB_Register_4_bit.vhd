library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Register_4_bit is
end TB_Register_4_bit;

architecture Behavioral of TB_Register_4_bit is

    -- Component Declaration
    component Register_4_bit
        Port (
            R_in  : in  STD_LOGIC_VECTOR (3 downto 0);
            En    : in  STD_LOGIC;
            Clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC; 
            R_out : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Test Signals
    signal R_in  : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal En    : STD_LOGIC := '0';
    signal Clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal R_out : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Register_4_bit Port Map (
        R_in  => R_in,
        En    => En,
        Clk   => Clk,
        reset => reset,
        R_out => R_out
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
        -- Test 1: Reset active
        reset <= '1'; wait for 20 ns;
        reset <= '0'; wait for 20 ns;

        -- Test 2: En=1, input = "0001"
        R_in <= "0001"; En <= '1'; wait for 20 ns;

        -- Test 3: En=1, input = "0010"
        R_in <= "0010"; wait for 20 ns;

        -- Test 4: En=0, input = "0011"
        R_in <= "0011"; En <= '0'; wait for 20 ns;

        -- Test 5: Reset active again
        reset <= '1'; wait for 20 ns;
        reset <= '0'; wait for 20 ns;

        -- Test 6: En=1, input = "0100"
        R_in <= "0100"; En <= '1'; wait for 20 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
