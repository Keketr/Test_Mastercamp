library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- SignExtender va prendre l'OFFSET de 8 bits et l'étendre à 16 bits.

entity SignExtender is
    
    Port (
         OFFSET_8 : in STD_LOGIC_VECTOR (7 downto 0);
           OFFSET_16 : out STD_LOGIC_VECTOR (15 downto 0)

         );

end SignExtender;

architecture Behavioral of SignExtender is

begin

    OFFSET_16(15 downto 8) <= (others => OFFSET_8(7));
    OFFSET_16(7 downto 0) <= OFFSET_8;

end Behavioral;
