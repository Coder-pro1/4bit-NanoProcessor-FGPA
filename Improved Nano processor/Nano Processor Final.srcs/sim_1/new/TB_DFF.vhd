----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2025 04:44:54 PM
-- Design Name: 
-- Module Name: TB_DFF - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_DFF is
--
end TB_DFF;

architecture Behavioral of TB_DFF is
    -- Component Declaration
    component D_FF
        Port (
            D     : in  STD_LOGIC;
            Res   : in  STD_LOGIC;
            Clk   : in  STD_LOGIC;
            Q     : out STD_LOGIC;
            Qbar  : out STD_LOGIC
        );
    end component;

    -- Test Signals
    signal D     : STD_LOGIC := '0';
    signal Res   : STD_LOGIC := '0';
    signal Clk   : STD_LOGIC := '0';
    signal Q     : STD_LOGIC;
    signal Qbar  : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: D_FF Port Map (
        D     => D,
        Res   => Res,
        Clk   => Clk,
        Q     => Q,
        Qbar  => Qbar
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
        -- Test 1: Apply Reset with D=1
        Res <= '1'; D <= '1'; wait for 100 ns;

        -- Test 2: Deassert Reset, D=1
        Res <= '0'; D <= '1'; wait for 100 ns;

        -- Test 3: D = 0
        D <= '0'; wait for 100 ns;

        -- Test 4: D = 1
        D <= '1'; wait for 100 ns;

        -- Test 5: Reassert Reset
        Res <= '1'; wait for 100 ns;

        -- Test 6: Deassert Reset, D = 0
        Res <= '0'; D <= '0'; wait for 100 ns;

        -- Test 7: Hold D = 0
        wait for 100 ns;

        -- Test 8: D = 1
        D <= '1'; wait for 100 ns;

        -- Test 9: D = 0
        D <= '0'; wait for 100 ns;

        -- Test 10: D = 1
        D <= '1'; wait for 100 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;
