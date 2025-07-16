library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Clock is
    -- No ports for testbench
end TB_Clock;

architecture Behavioral of TB_Clock is

    -- Component Declaration of the Unit Under Test (UUT)
    component Clock
        Port (
            Clk_in  : in  STD_LOGIC;
            Clk_out : out STD_LOGIC
        );
    end component;

    -- Signals to connect to UUT
    signal Clk_in  : STD_LOGIC := '0';
    signal Clk_out : STD_LOGIC;


begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Clock Port Map (
        Clk_in  => Clk_in,
        Clk_out => Clk_out
    );

    -- Clock generation process
    clk_process: process
    begin
       Clk_in <= NOT (Clk_in);
       wait for 5ns;
       
    end process;



end Behavioral;