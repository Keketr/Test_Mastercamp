library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- ce code va juste incrémenter PC de 1 

entity PCIncrementer is

    Port ( 
        PC : in STD_LOGIC_VECTOR (15 downto 0);
           NEXT_PC : out STD_LOGIC_VECTOR (15 downto 0)

         );

end PCIncrementer;

architecture Behavioral of PCIncrementer is

begin

    NEXT_PC <= std_logic_vector(unsigned(PC) + 1);

end Behavioral;
