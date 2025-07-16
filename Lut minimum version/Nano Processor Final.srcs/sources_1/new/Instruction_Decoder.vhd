----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2025 04:13:01 PM
-- Design Name: 
-- Module Name: Instruction_decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Instruction_Decoder is
    Port (Instruction : in STD_LOGIC_VECTOR (11 downto 0);
          Chk_Jmp : in STD_LOGIC_VECTOR (3 downto 0);
          En_reg : out STD_LOGIC_VECTOR (2 downto 0);
          MUX_1 : out STD_LOGIC_VECTOR (2 downto 0);
          MUX_2 : out STD_LOGIC_VECTOR (2 downto 0);
          Jmp : out STD_LOGIC;
          Add_or_Sub : out STD_LOGIC;
          Im_Val : out STD_LOGIC_VECTOR (3 downto 0);
          Load_Sel : out STD_LOGIC;
          Jmp_Add :  out STD_LOGIC_VECTOR (2 downto 0)
          );
         
end Instruction_Decoder;

architecture Behavioral of Instruction_decoder is


begin

MUX_1 <= Instruction (9 downto 7);
MUX_2 <= Instruction (6 downto 4);
Add_or_Sub <= Instruction(10); --add=>0 and sub=>1
Load_Sel <= Instruction(11);
Jmp <= '1' when Chk_Jmp = "0000" and Instruction(11 downto 10) = "11" else '0';
En_Reg <= Instruction (9 downto 7);
Jmp_add <= Instruction (2 downto 0);
Im_Val <= Instruction(3 downto 0);

end Behavioral;
