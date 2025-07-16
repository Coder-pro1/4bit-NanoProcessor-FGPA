library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Instruction_Decoder is
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

    -- Component Declaration
    component Instruction_Decoder
        Port (
            Instruction : in STD_LOGIC_VECTOR (11 downto 0);
            Chk_Jmp : in STD_LOGIC_VECTOR (3 downto 0);
            En_reg : out STD_LOGIC_VECTOR (2 downto 0);
            MUX_1 : out STD_LOGIC_VECTOR (2 downto 0);
            MUX_2 : out STD_LOGIC_VECTOR (2 downto 0);
            Jmp : out STD_LOGIC;
            ALU_in : out STD_LOGIC_vector(3 downto 0);
            Im_Val : out STD_LOGIC_VECTOR (3 downto 0);
            Load_Sel : out STD_LOGIC;
            Jmp_Add : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Signals for inputs
    signal Instruction : STD_LOGIC_VECTOR (11 downto 0);
    signal Chk_Jmp : STD_LOGIC_VECTOR (3 downto 0);

    -- Signals for outputs
    signal En_reg : STD_LOGIC_VECTOR (2 downto 0);
    signal MUX_1 : STD_LOGIC_VECTOR (2 downto 0);
    signal MUX_2 : STD_LOGIC_VECTOR (2 downto 0);
    signal Jmp : STD_LOGIC;
    signal ALU_in : STD_LOGIC_VECTOR (3 downto 0);
    signal Im_Val : STD_LOGIC_VECTOR (3 downto 0);
    signal Load_Sel : STD_LOGIC;
    signal Jmp_Add : STD_LOGIC_VECTOR (2 downto 0);

begin

    -- Instantiate the Unit Under Test
    uut: Instruction_Decoder
        port map (
            Instruction => Instruction,
            Chk_Jmp => Chk_Jmp,
            En_reg => En_reg,
            MUX_1 => MUX_1,
            MUX_2 => MUX_2,
            Jmp => Jmp,
            ALU_in => ALU_in,
            Im_Val => Im_Val,
            Load_Sel => Load_Sel,
            Jmp_Add => Jmp_Add
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test 1: ALU operation (Instruction bits 11-10 = "00")
        Instruction <= "000010001010"; -- example: ALU operation
        Chk_Jmp <= "0001";
        wait for 10 ns;

        -- Test 2: Load operation (Instruction(11) = '1')
        Instruction <= "100100110011"; -- example: load
        Chk_Jmp <= "0010";
        wait for 10 ns;

        -- Test 3: Jump operation with Chk_Jmp = "0000"
        Instruction <= "110111000101"; -- Instruction(11-10)="11"
        Chk_Jmp <= "0000";
        wait for 10 ns;

        -- Test 4: Jump instruction, but Chk_Jmp not "0000" (no jump expected)
        Instruction <= "110111000101";
        Chk_Jmp <= "0001";
        wait for 10 ns;

        -- Test 5: Another ALU instruction
        Instruction <= "000111010110";
        Chk_Jmp <= "1111";
        wait for 10 ns;

        wait;
    end process;

end Behavioral;
