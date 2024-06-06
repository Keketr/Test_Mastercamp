library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  

entity ClockDivider is

    Port ( 
        clk35MHz : in STD_LOGIC;
           clk7Hz : out STD_LOGIC;

         );

end ClockDivider;

architecture Behavioral of ClockDivider is

    signal counter : unsigned(22 downto 0) := (others => '0');  -- Il nous faut 5 millions car 35 000 000/5

    signal clk_out : STD_LOGIC := '0';

begin

    process(clk35MHz)

    begin

        if rising_edge(clk35MHz) then
            
            if counter = 2499999 then  -- ça va compter jus'qu'à la moitié de la période
                clk_out <= NOT clk_out;  -- 
                counter <= (others => '0');  -- réinitialise l'horloge à 0 
            else
                counter <= counter + 1;  
            end if;

        end if;

    end process;
    
    clk7Hz <= clk_out; 

end Behavioral;


-- Explication du choix : 

-- Division Factor = Output Frequency/Input Frequency = 35 000 000 Hz / 7 Hz = 5 000 000

--Nous utiliserons un compteur pour générer le signal d'horloge de 7 Hz à partir de l'horloge de référence de 35 MHz. 
--Lorsque le compteur atteint 2,500,000, nous changerons l'état du signal de sortie pour obtenir une période de 5,000,000 de cycles d'horloge pour correspondre à la fréquence de 7 Hz.