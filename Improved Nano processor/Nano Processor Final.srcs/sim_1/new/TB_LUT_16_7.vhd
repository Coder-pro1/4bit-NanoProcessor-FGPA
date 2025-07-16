library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_LUT_16_7 is
end TB_LUT_16_7;

architecture Behavioral of TB_LUT_16_7 is

    -- Component Declaration
    component LUT_16_7
        Port (
            address : in STD_LOGIC_VECTOR (3 downto 0);
            data : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    -- Test Signals
    signal address : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal data : STD_LOGIC_VECTOR (6 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: LUT_16_7 Port Map (
        address => address,
        data => data
    );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test each address value from 0 to 15
        for i in 0 to 15 loop
            address <= std_logic_vector(to_unsigned(i, 4));
            wait for 50 ns; -- wait for signal update
        end loop;

        wait;
    end process;

end Behavioral;