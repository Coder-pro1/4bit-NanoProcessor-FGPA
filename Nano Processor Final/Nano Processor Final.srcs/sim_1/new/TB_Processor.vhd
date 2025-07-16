library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Processor_Testbench is
end Processor_Testbench;

architecture TB of Processor_Testbench is

    -- Component declaration
    component Processor
        port (
            clk_in        : in  STD_LOGIC;
            reset         : in  STD_LOGIC;
            overflow_flag : out STD_LOGIC;
            zero_flag     : out STD_LOGIC;
            reg7_LED      : out STD_LOGIC_VECTOR(3 downto 0);
            seven_segment : out STD_LOGIC_VECTOR(6 downto 0);
            Anode: out STD_LOGIC_VECTOR(3 downto 0) 
        );
    end component;

    -- Testbench signals
    signal clk_tb        : STD_LOGIC := '0';
    signal reset_tb      : STD_LOGIC := '0';
    signal overflow_tb   : STD_LOGIC;
    signal zero_tb       : STD_LOGIC;
    signal reg7_led_tb   : STD_LOGIC_VECTOR(3 downto 0);
    signal seg_out_tb    : STD_LOGIC_VECTOR(6 downto 0);
    signal Anode_tb : STD_LOGIC_VECTOR(3 downto 0);

    -- Clock period
    constant clk_period : time := 20 ns;

begin

    -- Instantiate the Processor
    UUT: Processor
        port map (
            clk_in        => clk_tb,
            reset         => reset_tb,
            overflow_flag => overflow_tb,
            zero_flag     => zero_tb,
            reg7_LED      => reg7_led_tb,
            seven_segment => seg_out_tb,
            Anode => Anode_tb
        );

    -- Clock generation
    clk_process: process
    begin
        clk_tb <= '0';
        wait for clk_period/2;
        clk_tb <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial reset
        reset_tb <= '1';
        wait for 10 ns;
        reset_tb <= '0';

        -- Let processor run for a few cycles
        wait for 10 ns;

        -- Optionally reset again
        reset_tb <= '1';
        wait for 10 ns;
        reset_tb <= '0';
        wait for 10 ns;

        -- Let it run further
        wait;

        -- End simulation
    end process;

end TB;
