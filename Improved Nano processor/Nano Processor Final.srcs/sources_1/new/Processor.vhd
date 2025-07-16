
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Processor is
    port (clk_in : in STD_LOGIC;
          reset : in STD_LOGIC;
          overflow_flag : out STD_LOGIC;
          zero_flag : out STD_LOGIC;
          reg7_LED : out STD_LOGIC_VECTOR (3 downto 0);
          seven_segment : out STD_LOGIC_VECTOR(6 downto 0);
          
          equal_to     : out STD_LOGIC;
          less_than  : out STD_LOGIC;
          greater_than     : out STD_LOGIC;   
          
          Anode: out STD_LOGIC_VECTOR(3 downto 0) 
          );
          
          
end Processor;

architecture Behavioral of Processor is
component Program_Rom
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (11 downto 0));
end component;
component Instruction_Decoder
    Port (Instruction : in STD_LOGIC_VECTOR (11 downto 0);
        Chk_Jmp : in STD_LOGIC_VECTOR (3 downto 0);
        En_reg : out STD_LOGIC_VECTOR (2 downto 0);
        MUX_1 : out STD_LOGIC_VECTOR (2 downto 0);
        MUX_2 : out STD_LOGIC_VECTOR (2 downto 0);
        Jmp : out STD_LOGIC;
        ALU_in : out STD_LOGIC_vector(3 downto 0);
        Im_Val : out STD_LOGIC_VECTOR (3 downto 0);
        Load_Sel : out STD_LOGIC;
        Jmp_Add :  out STD_LOGIC_VECTOR (2 downto 0)
        );
end component;        

component Multiplexer_2_way_4_bit
    Port ( S : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Register_Bank 
    Port (
        S       : in STD_LOGIC_VECTOR (2 downto 0);  -- 3-bit select input
        RB_in   : in STD_LOGIC_VECTOR (3 downto 0);  -- 4-bit register input
        CLK_in  : in STD_LOGIC;    
        reset   : in STD_LOGIC;                     -- Clock signal
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

component Clock
    Port ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;

component Multiplexer_8_way_4_bit
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
       I1 : in STD_LOGIC_VECTOR (3 downto 0);
       I2 : in STD_LOGIC_VECTOR (3 downto 0);
       I3 : in STD_LOGIC_VECTOR (3 downto 0);
       I4 : in STD_LOGIC_VECTOR (3 downto 0);
       I5 : in STD_LOGIC_VECTOR (3 downto 0);
       I6 : in STD_LOGIC_VECTOR (3 downto 0);
       I7 : in STD_LOGIC_VECTOR (3 downto 0);
       I0 : in STD_LOGIC_VECTOR (3 downto 0);
       Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

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

component Multiplexer_2_way_3_bit
    Port ( S : in STD_LOGIC;
       A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Program_counter
    port (
    clk : in  std_logic;                 -- system clock
    Res : in  std_logic;                 -- active-high push-button reset
    I  : in  std_logic_vector(2 downto 0);      -- absolute 3-bit jump address
    Y  : out std_logic_vector(2 downto 0)       -- address into program ROM
);    -- address into program ROM
end component;

component RC_3
    Port ( 
        A     : in  STD_LOGIC_VECTOR(2 downto 0);
        B     : in  STD_LOGIC_VECTOR(2 downto 0);
        S     : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component LUT_16_7  
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
       data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal instruction_out: STD_LOGIC_VECTOR (11 downto 0);
signal mux1_sig, mux2_sig, reg_en, address, address_plus1 : STD_LOGIC_VECTOR (2 downto 0);
signal jp, load, add_sub_carry, add_sub_zero: STD_LOGIC;
signal  immediate: STD_LOGIC_VECTOR (3 downto 0);
signal seven_seg_out: STD_LOGIC_VECTOR (6 downto 0);
signal reg_b, muxA_out, muxB_out, alu_out, alu_input: STD_LOGIC_VECTOR  (3 downto 0);   
signal r0, r1, r2 ,r3, r4, r5 ,r6 ,r7 : STD_LOGIC_VECTOR(3 downto 0);
signal clk_o, equal, lesser, greater: STD_LOGIC;
signal mux_3bit_o, add_3bit: STD_LOGIC_VECTOR (2 downto 0);
signal pc_out: STD_LOGIC_VECTOR(2 downto 0);
begin

clk: Clock
    port map (Clk_in => clk_in,
              Clk_out => clk_o);

rom: Program_Rom
    PORT MAP(I => std_logic_vector(pc_out),
             O => instruction_out);
             
ins_dec : Instruction_Decoder
    port map( Instruction => instruction_out,
              Chk_Jmp => muxA_out,
              En_reg => reg_en,
              MUX_1 => mux1_sig,
              MUX_2 => mux2_sig,
              Jmp => jp,
              ALU_in => alu_input,
              Im_Val => immediate,
              Load_Sel => load,
              Jmp_Add => address);

load_mux: Multiplexer_2_way_4_bit
    port map (S => load,
              A => alu_out,
              B => immediate,
              Y => reg_b);

registerBank : Register_Bank
    port map (RB_in => reg_b,
              S => reg_en,
              reset => reset,
              CLK_in => clk_o,
              R0_out => r0,
              R1_out => r1,
              R2_out => r2,
              R3_out => r3,
              R4_out => r4,
              R5_out => r5,
              R6_out => r6,
              R7_out => r7);

MUX_A: Multiplexer_8_way_4_bit
    port map( S => mux1_sig,
              I0 => r0,
              I1 => r1,
              I2 => r2,
              I3 => r3,
              I4 => r4,
              I5 => r5,
              I6 => r6,
              I7 => r7,
              Y => muxA_out);
              
MUX_B: Multiplexer_8_way_4_bit
    port map( S => mux2_sig,
              I0 => r0,
              I1 => r1,
              I2 => r2,
              I3 => r3,
              I4 => r4,
              I5 => r5,
              I6 => r6,
              I7 => r7,
              Y => muxB_out);
 
ALU_0 : ALU
    port map(        
              A => muxA_out,
              B => muxB_out,
              operation => ALU_input,
              result  => alu_out,
              carry_out => add_sub_carry,
              equal => equal,
              less => lesser,
              great => greater,
              zero_flag => add_sub_zero);    
              
adder_3bit: RC_3
    port map (A => "001",
              B => std_logic_vector(pc_out),
              S => add_3bit);

mux_3bit: Multiplexer_2_way_3_bit
    port map (S => jp,
              A =>add_3bit,--- address
              B => address,---add_3bit
              Y => mux_3bit_o);
              


prgm_cntr : Program_Counter
    port map (
        clk => clk_o,
        Res => reset,
        I => mux_3bit_o,
        Y => pc_out
    );
    


seven_seg : LUT_16_7  
    Port map ( address => r7,
               data => seven_seg_out);

overflow_flag <= add_sub_carry;
zero_flag <= add_sub_zero;
reg7_LED <= r7;
Anode<= "1110";
seven_segment <= seven_seg_out;

equal_to <= equal;
less_than <= lesser;
greater_than <= greater;

end Behavioral;
