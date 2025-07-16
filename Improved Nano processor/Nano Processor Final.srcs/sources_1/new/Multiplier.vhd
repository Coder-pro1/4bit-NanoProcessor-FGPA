library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        P : out STD_LOGIC_VECTOR(3 downto 0)  -- changed from 8 to 4 bits
    );
end Multiplier;

architecture Behavioral of Multiplier is

    signal PP0, PP1, PP2, PP3 : STD_LOGIC_VECTOR(3 downto 0);
    signal T1, T2 : STD_LOGIC_VECTOR(3 downto 0);

    component RCAS_4
        Port (
            A      : in  STD_LOGIC_VECTOR(3 downto 0);
            B      : in  STD_LOGIC_VECTOR(3 downto 0);
            AddSub : in  STD_LOGIC;
            S      : out STD_LOGIC_VECTOR(3 downto 0);
            C_out  : out STD_LOGIC
        );
    end component;

    -- helper signals for shifting
    signal A_B1 : STD_LOGIC_VECTOR(3 downto 0);
    signal A_B2 : STD_LOGIC_VECTOR(3 downto 0);
    signal A_B3 : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Base partial products
    PP0 <= A and (B(0) & B(0) & B(0) & B(0));  -- No shift

    A_B1 <= A and (B(1) & B(1) & B(1) & B(1));
    PP1  <= A_B1(2 downto 0) & '0';  -- Shifted left by 1

    A_B2 <= A and (B(2) & B(2) & B(2) & B(2));
    PP2  <= A_B2(1 downto 0) & "00"; -- Shifted left by 2

    A_B3 <= A and (B(3) & B(3) & B(3) & B(3));
    PP3  <= A_B3(0) & "000";         -- Shifted left by 3

    -- Ripple carry addition (3 additions)
    U1: RCAS_4 port map (A => PP0, B => PP1, AddSub => '0', S => T1, C_out => open);
    U2: RCAS_4 port map (A => T1,  B => PP2, AddSub => '0', S => T2, C_out => open);
    U3: RCAS_4 port map (A => T2,  B => PP3, AddSub => '0', S => P,  C_out => open);

end Behavioral;