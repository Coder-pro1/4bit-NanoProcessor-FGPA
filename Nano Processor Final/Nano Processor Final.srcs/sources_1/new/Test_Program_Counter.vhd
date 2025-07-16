library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Test_Program_Counter is
    Port (
        clk_in  : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        jmp_sel : in  STD_LOGIC;                      -- Jump select: 0 = PC+1, 1 = jump address
        jmp_addr: in  STD_LOGIC_VECTOR(2 downto 0);  -- Jump address input
        pc_out  : out STD_LOGIC_VECTOR(2 downto 0)   -- Program counter output
    );
end Test_Program_Counter;

architecture Behavioral of Test_Program_Counter is

    -- Component Declarations
    component RC_3
        Port (
            A : in  STD_LOGIC_VECTOR(2 downto 0);
            B : in  STD_LOGIC_VECTOR(2 downto 0);
            S : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    component Multiplexer_2_way_3_bit
        Port (
            S : in STD_LOGIC;
            A : in STD_LOGIC_VECTOR(2 downto 0);
            B : in STD_LOGIC_VECTOR(2 downto 0);
            Y : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    component Program_Counter
        Port (
            Clk : in  STD_LOGIC;
            Res : in  STD_LOGIC;
            I   : in  STD_LOGIC_VECTOR(2 downto 0);
            Y   : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    -- Signals for internal connections
    signal pc_plus_one,pcout  : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal mux_out      : STD_LOGIC_VECTOR(2 downto 0);

begin

    -- Adder: pc_out + 1
    adder_inst: RC_3
        Port map (
            A => pcout,
            B => "001",
            S => pc_plus_one
        );

    -- MUX: Select between pc_plus_one and jump address based on jmp_sel
    mux_inst: Multiplexer_2_way_3_bit
        Port map (
            S => jmp_sel,
            A => pc_plus_one,
            B => jmp_addr,
            Y => mux_out
        );

    -- Program Counter: Updates on rising clock edge
    pc_inst: Program_Counter
        Port map (
            Clk => clk_in,
            Res => reset,
            I   => mux_out,
            Y   => pcout
        );
pc_out <= pcout;

end Behavioral;
