library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator is
    Port ( 
        A      : in  STD_LOGIC_VECTOR(3 downto 0);
        B      : in  STD_LOGIC_VECTOR(3 downto 0);
        equal  : out STD_LOGIC;
        less   : out STD_LOGIC;
        great  : out STD_LOGIC
    );
end Comparator;

architecture Behavioral of Comparator is

signal vA_less  : STD_LOGIC;
signal vA_equal : STD_LOGIC;
signal vA_grt   : STD_LOGIC;

begin

   vA_equal <= '1' when (A = B) else '0';

   vA_less <= '1' when 
                (A(3) = '0' and B(3) = '1') or
                (A(3) = B(3) and A(2) = '0' and B(2) = '1') or
                (A(3) = B(3) and A(2) = B(2) and A(1) = '0' and B(1) = '1') or
                (A(3) = B(3) and A(2) = B(2) and A(1) = B(1) and A(0) = '0' and B(0) = '1')
            else '0';

   vA_grt <= '1' when 
                (A(3) = '1' and B(3) = '0') or
                (A(3) = B(3) and A(2) = '1' and B(2) = '0') or
                (A(3) = B(3) and A(2) = B(2) and A(1) = '1' and B(1) = '0') or
                (A(3) = B(3) and A(2) = B(2) and A(1) = B(1) and A(0) = '1' and B(0) = '0')
            else '0';

   -- Output results
   great <= vA_grt;
   less  <= vA_less;
   equal <= vA_equal;

end Behavioral;
