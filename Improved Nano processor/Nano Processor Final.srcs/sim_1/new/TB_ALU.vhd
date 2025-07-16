library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_ALU is
end TB_ALU;

architecture Behavioral of TB_ALU is

    -- DUT component
    component ALU
        Port (
            A         : in  STD_LOGIC_VECTOR(3 downto 0);
            B         : in  STD_LOGIC_VECTOR(3 downto 0);
            operation : in  STD_LOGIC_VECTOR(3 downto 0);
            result    : out STD_LOGIC_VECTOR(3 downto 0);
            carry_out : out STD_LOGIC;
            equal     : out STD_LOGIC;
            less      : out STD_LOGIC;
            great     : out STD_LOGIC;
            zero_flag : out STD_LOGIC
        );
    end component;

    -- Signals to connect to DUT
    signal A_tb, B_tb     : STD_LOGIC_VECTOR(3 downto 0);
    signal op_tb          : STD_LOGIC_VECTOR(3 downto 0);
    signal result_tb      : STD_LOGIC_VECTOR(3 downto 0);
    signal carry_out_tb   : STD_LOGIC;
    signal equal_tb       : STD_LOGIC;
    signal less_tb        : STD_LOGIC;
    signal great_tb       : STD_LOGIC;
    signal zero_flag_tb   : STD_LOGIC;

begin

    -- Instantiate DUT
    UUT: ALU
        port map (
            A         => A_tb,
            B         => B_tb,
            operation => op_tb,
            result    => result_tb,
            carry_out => carry_out_tb,
            equal     => equal_tb,
            less      => less_tb,
            great     => great_tb,
            zero_flag => zero_flag_tb
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- ADD: 3 + 5 = 8
        A_tb <= "0011"; B_tb <= "0101"; op_tb <= "0000";
        wait for 100 ns;

        -- SUB: 7 - 2 = 5
        A_tb <= "0111"; B_tb <= "0010"; op_tb <= "0001";
        wait for 100 ns;

        -- NEG: -A (Two's complement of 5)
        A_tb <= "0101"; B_tb <= "0000"; op_tb <= "1000";
        wait for 100 ns;

        -- AND: 6 and 3 = 2
        A_tb <= "0110"; B_tb <= "0011"; op_tb <= "0010";
        wait for 100 ns;

        -- OR: 6 or 3 = 7
        A_tb <= "0110"; B_tb <= "0011"; op_tb <= "0011";
        wait for 100 ns;

        -- XOR: 6 xor 3 = 5
        A_tb <= "0110"; B_tb <= "0011"; op_tb <= "0100";
        wait for 100 ns;

        -- MUL: 4 × 3 = 12
        A_tb <= "0100"; B_tb <= "0011"; op_tb <= "0101";
        wait for 100 ns;

        -- CMP: A = 4, B = 4 => equal
        A_tb <= "0100"; B_tb <= "0100"; op_tb <= "0111";
        wait for 100 ns;

        -- CMP: A = 2, B = 5 => less
        A_tb <= "0010"; B_tb <= "0101"; op_tb <= "0111";
        wait for 100 ns;

        -- CMP: A = 9, B = 1 => greater
        A_tb <= "1001"; B_tb <= "0001"; op_tb <= "0111";
        wait for 100 ns;

        wait;
    end process;

end Behavioral;
