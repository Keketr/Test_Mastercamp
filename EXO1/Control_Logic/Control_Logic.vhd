--Gela va choisir  entre RESET, BRANCH, addition normale, ou incrément.
-- entité princiapl qui gère les autres blocs

library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ControlLogic is

    Port ( 

        PC : in STD_LOGIC_VECTOR (15 downto 0);
           OFFSET : in STD_LOGIC_VECTOR (7 downto 0);
           RESET : in STD_LOGIC;
           BRANCH : in STD_LOGIC;
           NEXT_PC : out STD_LOGIC_VECTOR (15 downto 0)

         );

end ControlLogic;

architecture Behavioral of ControlLogic is

    component SignExtender
        Port ( 

            OFFSET_8 : in STD_LOGIC_VECTOR (7 downto 0);
               OFFSET_16 : out STD_LOGIC_VECTOR (15 downto 0)

             );
    end component;

    component PCAdder

        Port ( 
            
            PC : in STD_LOGIC_VECTOR (15 downto 0);
               OFFSET : in STD_LOGIC_VECTOR (15 downto 0);
               RESULT : out STD_LOGIC_VECTOR (15 downto 0)

             );
    end component;

    component PCIncrementer

        Port ( 
            PC : in STD_LOGIC_VECTOR (15 downto 0);
               NEXT_PC : out STD_LOGIC_VECTOR (15 downto 0)

             );
    end component;

    signal OFFSET_16 : STD_LOGIC_VECTOR (15 downto 0);
    signal ADD_RESULT : STD_LOGIC_VECTOR (15 downto 0);

begin

    SE: SignExtender Port Map (OFFSET, OFFSET_16);
    PA: PCAdder Port Map (PC, OFFSET_16, ADD_RESULT);
    PI: PCIncrementer Port Map (PC, NEXT_PC);


    process(RESET, BRANCH, PC, OFFSET_16, ADD_RESULT)

    begin
        if RESET = '1' then
            NEXT_PC <= (others => '0');
        elsif BRANCH = '1' then
            NEXT_PC <= ADD_RESULT;
        else
            NEXT_PC <= std_logic_vector(unsigned(PC) + 1);
        end if;
    end process;

end Behavioral;
