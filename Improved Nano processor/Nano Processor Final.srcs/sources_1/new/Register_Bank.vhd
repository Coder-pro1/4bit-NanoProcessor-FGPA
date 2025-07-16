library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_Bank is
    Port (
        S       : in STD_LOGIC_VECTOR (2 downto 0);  -- 3-bit select input
        RB_in   : in STD_LOGIC_VECTOR (3 downto 0);  -- 4-bit register input
        CLK_in  : in STD_LOGIC;   
        reset   : in STD_LOGIC;                   -- Clock signal
        R0_out  : out STD_LOGIC_VECTOR (3 downto 0);
        R1_out  : out STD_LOGIC_VECTOR (3 downto 0);
        R2_out  : out STD_LOGIC_VECTOR (3 downto 0);
        R3_out  : out STD_LOGIC_VECTOR (3 downto 0);
        R4_out  : out STD_LOGIC_VECTOR (3 downto 0);
        R5_out  : out STD_LOGIC_VECTOR (3 downto 0);
        R6_out  : out STD_LOGIC_VECTOR (3 downto 0);
        R7_out  : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Register_Bank;

architecture Behavioral of Register_Bank is

    -- 3-to-8 decoder component declaration
    component Decoder_3_to_8
        Port (
            I  : in  STD_LOGIC_VECTOR (2 downto 0);
            EN : in  STD_LOGIC;
            Y  : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

    -- 4-bit register component declaration
    component Register_4_bit
        Port (
            R_in  : in  STD_LOGIC_VECTOR (3 downto 0);
            EN    : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            R_out : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Internal signal to carry decoder output (8 enable lines)
    signal tempEN : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Decoder instantiation: decode select signal S into 8 enable lines
    Decoder_Inst : Decoder_3_to_8
        Port Map (
            I  => S,
            EN => '1',         -- Decoder always enabled
            Y  => tempEN
        );

    -- R0: always outputs "0000", not controlled by decoder
    Register_R0 : Register_4_bit
        Port Map (
            R_in  => "0000",
            EN    => '1',
            reset => reset,
            CLK   => CLK_in,
            R_out => R0_out
        );

    -- R1 to R7: controlled by decoder output tempEN(1) to tempEN(7)
    Register_R1 : Register_4_bit
        Port Map (
            R_in  => RB_in,
            EN    => tempEN(1),
            reset => reset,
            CLK   => CLK_in,
            R_out => R1_out
        );

    Register_R2 : Register_4_bit
        Port Map (
            R_in  => RB_in,
            EN    => tempEN(2),
            reset => reset,
            CLK   => CLK_in,
            R_out => R2_out
        );

    Register_R3 : Register_4_bit
        Port Map (
            R_in  => RB_in,
            EN    => tempEN(3),
            reset => reset,
            CLK   => CLK_in,
            R_out => R3_out
        );

    Register_R4 : Register_4_bit
        Port Map (
            R_in  => RB_in,
            EN    => tempEN(4),
            reset => reset,
            CLK   => CLK_in,
            R_out => R4_out
        );

    Register_R5 : Register_4_bit
        Port Map (
            R_in  => RB_in,
            EN    => tempEN(5),
            reset => reset,
            CLK   => CLK_in,
            R_out => R5_out
        );

    Register_R6 : Register_4_bit
        Port Map (
            R_in  => RB_in,
            EN    => tempEN(6),
            reset => reset,
            CLK   => CLK_in,
            R_out => R6_out
        );

    Register_R7 : Register_4_bit
        Port Map (
            R_in  => RB_in,
            EN    => tempEN(7),
            reset => reset,
            CLK   => CLK_in,
            R_out => R7_out
        );

end Behavioral;