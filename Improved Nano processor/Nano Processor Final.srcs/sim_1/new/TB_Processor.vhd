library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Processor_Testbench is
end Processor_Testbench;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Processor is
-- No ports for a testbench
end TB_Processor;

architecture Behavioral of TB_Processor is

    -- Component Declaration
    component Processor
        port (
            clk_in : in STD_LOGIC;
            reset : in STD_LOGIC;
            overflow_flag : out STD_LOGIC;
            zero_flag : out STD_LOGIC;
            reg7_LED : out STD_LOGIC_VECTOR (3 downto 0);
            seven_segment : out STD_LOGIC_VECTOR(6 downto 0);
            
            equal_to     : out STD_LOGIC;
            less_than    : out STD_LOGIC;
            greater_than : out STD_LOGIC;   

            Anode        : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Testbench Signals
    signal clk_tb        : STD_LOGIC := '0';
    signal reset_tb      : STD_LOGIC := '0';
    signal overflow_tb   : STD_LOGIC;
    signal zero_tb       : STD_LOGIC;
    signal reg7_tb       : STD_LOGIC_VECTOR(3 downto 0);
    signal seg_tb        : STD_LOGIC_VECTOR(6 downto 0);
    signal eq_tb         : STD_LOGIC;
    signal lt_tb         : STD_LOGIC;
    signal gt_tb         : STD_LOGIC;
    signal anode_tb      : STD_LOGIC_VECTOR(3 downto 0);
    

    -- Clock period constant
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Processor
        port map (
            clk_in => clk_tb,
            reset => reset_tb,
            overflow_flag => overflow_tb,
            zero_flag => zero_tb,
            reg7_LED => reg7_tb,
            seven_segment => seg_tb,
            equal_to => eq_tb,
            less_than => lt_tb,
            greater_than => gt_tb,
            Anode => anode_tb
        );

    -- Clock generation process
    clk_process :process
    begin
        while true loop
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Apply reset
        reset_tb <= '1';
        wait for 100 ns;
        reset_tb <= '0';

        -- Wait to let the program execute
        wait for 500 ns;

        -- You can add assertions or signal monitoring here

        wait;  -- Wait forever
    end process;

end Behavioral;
