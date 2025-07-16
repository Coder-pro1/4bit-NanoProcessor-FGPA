
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCAS_4 is
    Port ( 
        A      : in  STD_LOGIC_VECTOR(3 downto 0);
        B      : in  STD_LOGIC_VECTOR(3 downto 0);
        AddSub : in  STD_LOGIC;  -- 0 for Add, 1 for Sub
        S      : out STD_LOGIC_VECTOR(3 downto 0);
        C_out  : out STD_LOGIC
    );
end RCAS_4;

architecture Behavioral of RCAS_4 is
    component Full_Adder
        Port (
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            C_in  : in  STD_LOGIC;
            S     : out STD_LOGIC;
            C_out : out STD_LOGIC
        );
end component;

signal B_xor     : STD_LOGIC_VECTOR(3 downto 0);
signal C         : STD_LOGIC_VECTOR(2 downto 0);

begin
    -- XOR B with AddSub to perform subtraction when AddSub = 1
    B_xor(0) <= B(0) xor AddSub;
    B_xor(1) <= B(1) xor AddSub;
    B_xor(2) <= B(2) xor AddSub;
    B_xor(3) <= B(3) xor AddSub;

    -- Ripple Carry Adder Chain
    FA0: Full_Adder port map (A => A(0), B => B_xor(0), C_in => AddSub,   S => S(0), C_out => C(0));
    FA1: Full_Adder port map (A => A(1), B => B_xor(1), C_in => C(0),     S => S(1), C_out => C(1));
    FA2: Full_Adder port map (A => A(2), B => B_xor(2), C_in => C(1),     S => S(2), C_out => C(2));
    FA3: Full_Adder port map (A => A(3), B => B_xor(3), C_in => C(2),     S => S(3), C_out => C_out);

end Behavioral;
