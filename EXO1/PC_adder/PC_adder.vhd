library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- PCAdder, il va faire l'addtion entre PC et OFFSET (étendu)

entity PCAdder is
    
    Port ( 
        PC : in STD_LOGIC_VECTOR (15 downto 0);
           OFFSET : in STD_LOGIC_VECTOR (15 downto 0);
           RESULT : out STD_LOGIC_VECTOR (15 downto 0)

         );
end PCAdder;


architecture Behavioral of PCAdder is

begin

    RESULT <= std_logic_vector(unsigned(PC) + unsigned(OFFSET));

end Behavioral;
