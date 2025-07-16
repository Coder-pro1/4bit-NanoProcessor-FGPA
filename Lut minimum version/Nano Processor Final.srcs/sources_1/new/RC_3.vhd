library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RC_3 is
    Port ( 
        A     : in  STD_LOGIC_VECTOR(2 downto 0);
        B     : in  STD_LOGIC_VECTOR(2 downto 0);
        S     : out STD_LOGIC_VECTOR(2 downto 0)
    );
end RC_3;

architecture Behavioral of RC_3 is

    component Full_Adder
        Port (
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            C_in  : in  STD_LOGIC;
            S     : out STD_LOGIC;
            C_out : out STD_LOGIC
        );
    end component;

    signal C : STD_LOGIC_VECTOR(1 downto 0);

begin

    -- Ripple Carry Adder Chain
    FA0: Full_Adder port map (A => A(0), B => B(0), C_in => '0',     S => S(0), C_out => C(0));
    FA1: Full_Adder port map (A => A(1), B => B(1), C_in => C(0),    S => S(1), C_out => C(1));
    FA2: Full_Adder port map (A => A(2), B => B(2), C_in => C(1),    S => S(2));

end Behavioral;