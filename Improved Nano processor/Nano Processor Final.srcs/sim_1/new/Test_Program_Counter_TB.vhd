library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Test_Program_Counter_TB is
-- Testbench has no ports
end Test_Program_Counter_TB;

architecture Behavioral of Test_Program_Counter_TB is

    -- Component under test
    component Test_Program_Counter
        Port (
            clk_in  : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            jmp_sel : in  STD_LOGIC;
            jmp_addr: in  STD_LOGIC_VECTOR(2 downto 0);
            pc_out  : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- Signals to connect to the DUT
    signal clk_in    : STD_LOGIC := '0';
    signal reset     : STD_LOGIC := '1';
    signal jmp_sel   : STD_LOGIC := '0';
    signal jmp_addr  : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal pc_out    : STD_LOGIC_VECTOR(2 downto 0);

    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Test_Program_Counter
        Port map (
            clk_in  => clk_in,
            reset   => reset,
            jmp_sel => jmp_sel,
            jmp_addr=> jmp_addr,
            pc_out  => pc_out
        );

    -- Clock generation process
    clk_process: process
    begin
        while True loop
            clk_in <= '0';
            wait for clk_period/2;
            clk_in <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial reset active for 2 clock cycles
        reset <= '1';
        wait for clk_period * 2;
        reset <= '0';
        wait for clk_period;

        -- Let PC increment normally (jmp_sel = 0)
        jmp_sel <= '0';
        wait for clk_period * 5;

        -- Apply jump address 5, enable jump (jmp_sel = 1)
        jmp_addr <= "101";  -- decimal 5
        jmp_sel <= '1';
        wait for clk_period * 3;

        -- Disable jump, continue normal increment
        jmp_sel <= '0';
        wait for clk_period * 5;

        -- Apply jump address 3, enable jump
        jmp_addr <= "011";  -- decimal 3
        jmp_sel <= '1';
        wait for clk_period * 2;

        -- Finish simulation
        wait;
    end process;

end Behavioral;
