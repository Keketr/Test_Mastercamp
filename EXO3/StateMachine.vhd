library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity StateMachine is

    Port ( 

        clk : in STD_LOGIC;          
           rst : in STD_LOGIC;          
           X : in STD_LOGIC;            
           Y : in STD_LOGIC;            
           S1 : out STD_LOGIC;          
           S2 : out STD_LOGIC           
         );

end StateMachine;


--notre processus sera sensible à l'horloge et au signal de reset

architecture Behavioral of StateMachine is

    type state_type is (M0, M1, M2, M3);  
    signal current_state : state_type;  

begin
    process(clk, rst)

    begin
        if rst = '1' then -- Réinitialise l'état de la machine à 0
            
            current_state <= M0;
            S1 <= '0';
            S2 <= '0';

        elsif rising_edge(clk) then

            case current_state is

                when M0 =>
                    if Y = '1' then
                        current_state <= M1;
                        S1 <= '1';
                        S2 <= '0';
                    else
                        current_state <= M0;
                        S1 <= '0';
                        S2 <= '0';
                    end if;

                when M1 =>
                    if X = '0' then
                        current_state <= M2;
                        S1 <= '1';
                        S2 <= '1';
                    else
                        current_state <= M0;
                        S1 <= '0';
                        S2 <= '0';
                    end if;

                when M2 =>
                    current_state <= M3;
                    S1 <= '0';
                    S2 <= '1';

                when M3 =>
                    current_state <= M0;
                    S1 <= '0';
                    S2 <= '0';

                when others =>
                    current_state <= M0;
            end case;

        end if;

    end process;
    
end Behavioral;
