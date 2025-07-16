library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Instruction_Decoder is
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

    -- Component Declaration
    component Instruction_Decoder
        Port (
            Instruction : in  STD_LOGIC_VECTOR (11 downto 0);
            Chk_Jmp     : in  STD_LOGIC_VECTOR (3 downto 0);
            En_reg      : out STD_LOGIC_VECTOR (2 downto 0);
            MUX_1       : out STD_LOGIC_VECTOR (2 downto 0);
            MUX_2       : out STD_LOGIC_VECTOR (2 downto 0);
            Jmp         : out STD_LOGIC;
            Add_or_Sub  : out STD_LOGIC;
            Im_Val      : out STD_LOGIC_VECTOR (3 downto 0);
            Load_Sel    : out STD_LOGIC;
            Jmp_Add     : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Test Signals
    signal Instruction : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
    signal Chk_Jmp     : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal En_reg      : STD_LOGIC_VECTOR (2 downto 0);
    signal MUX_1       : STD_LOGIC_VECTOR (2 downto 0);
    signal MUX_2       : STD_LOGIC_VECTOR (2 downto 0);
    signal Jmp         : STD_LOGIC;
    signal Add_or_Sub  : STD_LOGIC;
    signal Im_Val      : STD_LOGIC_VECTOR (3 downto 0);
    signal Load_Sel    : STD_LOGIC;
    signal Jmp_Add     : STD_LOGIC_VECTOR (2 downto 0);

begin

    -- Instantiate the UUT
    uut: Instruction_Decoder Port Map (
        Instruction => Instruction,
        Chk_Jmp     => Chk_Jmp,
        En_reg      => En_reg,
        MUX_1       => MUX_1,
        MUX_2       => MUX_2,
        Jmp         => Jmp,
        Add_or_Sub  => Add_or_Sub,
        Im_Val      => Im_Val,
        Load_Sel    => Load_Sel,
        Jmp_Add     => Jmp_Add
    );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test 1: MOVI instruction to R1
        Instruction <= "100010000010"; -- MOVI R1, 2
        Chk_Jmp <= "0000"; wait for 100 ns;

        -- Test 2: MOVI instruction to R7
        Instruction <= "101110000011"; -- MOVI R7, 3
        wait for 100 ns;

        -- Test 3: NEG R2
        Instruction <= "010100000000"; -- NEG R2
        wait for 100 ns;

        -- Test 4: ADD R7, R1
        Instruction <= "001110010000"; -- ADD R7, R1
        wait for 100 ns;

        -- Test 5: SUB R1, R2
        Instruction <= "000010100000"; -- ADD (but will interpret via dec_line(1) logic)
        wait for 100 ns;

        -- Test 6: JZR R1, 7 — should set Jmp high if Chk_Jmp = "0000"
        Instruction <= "110010000110";
        Chk_Jmp <= "0000"; wait for 100 ns;

        -- Test 7: JZR R0, 5 — no jump if Chk_Jmp ? "0000"
        Instruction <= "110000000100";
        Chk_Jmp <= "0001"; wait for 100 ns;

        -- Test 8: Test with all bits high
        Instruction <= (others => '1');
        Chk_Jmp <= "0000"; wait for 100 ns;

        -- Test 9: All zeros
        Instruction <= (others => '0');
        Chk_Jmp <= "0000"; wait for 100 ns;

        -- Test 10: Random combination
        Instruction <= "011001010111";
        Chk_Jmp <= "0000"; wait for 100 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;