library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
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
end ALU;

architecture Behavioral of ALU is

    -- Component declarations
    component RCAS_4
        Port (
            A      : in  STD_LOGIC_VECTOR(3 downto 0);
            B      : in  STD_LOGIC_VECTOR(3 downto 0);
            AddSub : in  STD_LOGIC;
            S      : out STD_LOGIC_VECTOR(3 downto 0);
            C_out  : out STD_LOGIC
        );
    end component;

    component Comparator
        Port (
            A      : in  STD_LOGIC_VECTOR(3 downto 0);
            B      : in  STD_LOGIC_VECTOR(3 downto 0);
            equal  : out STD_LOGIC;
            less   : out STD_LOGIC;
            great  : out STD_LOGIC
        );
    end component;

    component Multiplier
        Port (
            A      : in  STD_LOGIC_VECTOR(3 downto 0);
            B      : in  STD_LOGIC_VECTOR(3 downto 0);
            P      : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Internal signals
    signal sum_out, and_out, or_out, xor_out, neg_out, mul_out : STD_LOGIC_VECTOR(3 downto 0);
    signal cmp_eq, cmp_lt, cmp_gt : STD_LOGIC;
    signal carry_tmp : STD_LOGIC;
    signal alu_result : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate adder/subtractor
    U1: RCAS_4 port map (
        A      => A,
        B      => B,
        AddSub => operation(0),  -- 0 for ADD, 1 for SUB
        S      => sum_out,
        C_out  => carry_tmp
    );

    -- Bitwise logic
    and_out <= A and B;
    or_out  <= A or B;
    xor_out <= A xor B;

    -- Negation (2's complement of A)
    neg_out <= std_logic_vector(unsigned(not A) + 1);

    -- Comparator
    U2: Comparator port map (
        A     => A,
        B     => B,
        equal => cmp_eq,
        less  => cmp_lt,
        great => cmp_gt
    );

    -- Multiplier
    U3: Multiplier port map (
        A => A,
        B => B,
        P => mul_out
    );

    -- ALU Operation logic
    process (operation, sum_out, and_out, or_out, xor_out, neg_out, cmp_eq, cmp_lt, cmp_gt, mul_out, carry_tmp)
    begin
        case operation is
            when "0000" =>  -- ADD
                alu_result <= sum_out;
                carry_out <= carry_tmp;
            when "0001" =>  -- SUB
                alu_result <= sum_out;
                carry_out <= carry_tmp;
            when "1000" =>  -- NEG
                alu_result <= neg_out;
                carry_out <= '0';
            when "0010" =>  -- AND
                alu_result <= and_out;
                carry_out <= '0';
            when "0011" =>  -- OR
                alu_result <= or_out;
                carry_out <= '0';
            when "0100" =>  -- XOR
                alu_result <= xor_out;
                carry_out <= '0';
            when "0101" =>  -- MUL
                alu_result <= mul_out;
                carry_out <= '0';
            when "0111" =>  -- CMP: encoded
                alu_result <= cmp_gt & cmp_lt & cmp_eq & '0';  -- Optional visual encoding
                carry_out <= '0';
            when others =>
                alu_result <= (others => '0');
                carry_out <= '0';
        end case;
    end process;

    -- Assign final outputs
    result <= alu_result;
    equal  <= cmp_eq;
    less   <= cmp_lt;
    great  <= cmp_gt;
    zero_flag <= '1' when alu_result = "0000" else '0';

end Behavioral;
