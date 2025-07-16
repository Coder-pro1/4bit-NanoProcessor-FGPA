library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Register_Bank is
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is

    -- Component Declaration
    component Register_Bank
        Port (
            S       : in STD_LOGIC_VECTOR (2 downto 0);  -- 3-bit select input
            RB_in   : in STD_LOGIC_VECTOR (3 downto 0);  -- 4-bit register input
            CLK_in  : in STD_LOGIC;
            reset   : in STD_LOGIC;
            R0_out  : out STD_LOGIC_VECTOR (3 downto 0);
            R1_out  : out STD_LOGIC_VECTOR (3 downto 0);
            R2_out  : out STD_LOGIC_VECTOR (3 downto 0);
            R3_out  : out STD_LOGIC_VECTOR (3 downto 0);
            R4_out  : out STD_LOGIC_VECTOR (3 downto 0);
            R5_out  : out STD_LOGIC_VECTOR (3 downto 0);
            R6_out  : out STD_LOGIC_VECTOR (3 downto 0);
            R7_out  : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Signals for simulation
    signal S       : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal RB_in   : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal CLK_in  : STD_LOGIC := '0';
    signal reset   : STD_LOGIC := '0';
    signal R0_out  : STD_LOGIC_VECTOR (3 downto 0);
    signal R1_out  : STD_LOGIC_VECTOR (3 downto 0);
    signal R2_out  : STD_LOGIC_VECTOR (3 downto 0);
    signal R3_out  : STD_LOGIC_VECTOR (3 downto 0);
    signal R4_out  : STD_LOGIC_VECTOR (3 downto 0);
    signal R5_out  : STD_LOGIC_VECTOR (3 downto 0);
    signal R6_out  : STD_LOGIC_VECTOR (3 downto 0);
    signal R7_out  : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: Register_Bank
        Port Map (
            S       => S,
            RB_in   => RB_in,
            CLK_in  => CLK_in,
            reset   => reset,
            R0_out  => R0_out,
            R1_out  => R1_out,
            R2_out  => R2_out,
            R3_out  => R3_out,
            R4_out  => R4_out,
            R5_out  => R5_out,
            R6_out  => R6_out,
            R7_out  => R7_out
        );

    -- Clock Generation: 10 ns period
    clk_process : process
    begin
        while true loop
            CLK_in <= '0'; wait for 5 ns;
            CLK_in <= '1'; wait for 5 ns;
        end loop;
    end process;

    -- Stimulus Process
    stim_proc: process
    begin
        -- Reset the system
        reset <= '1'; wait for 20 ns;
        reset <= '0';

        -- Write to Register R1
        S <= "001"; RB_in <= "1010"; wait for 20 ns;

        -- Write to Register R2
        S <= "010"; RB_in <= "1100"; wait for 20 ns;

        -- Write to Register R3
        S <= "011"; RB_in <= "0011"; wait for 20 ns;

        -- Write to Register R7
        S <= "111"; RB_in <= "1111"; wait for 20 ns;

        -- Activate reset
        reset <= '1'; wait for 20 ns;
        reset <= '0';

        -- Check the contents of all registers
        S <= "000"; wait for 20 ns;
        S <= "001"; wait for 20 ns;
        S <= "010"; wait for 20 ns;
        S <= "011"; wait for 20 ns;
        S <= "111"; wait for 20 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
