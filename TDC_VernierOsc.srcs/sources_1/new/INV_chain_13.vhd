----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2017 15:49:09
-- Design Name: 
-- Module Name: INV_chain - Behavioral
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity INV_chain_13 is
    Port ( input : in STD_LOGIC;
           output : out STD_LOGIC;
           cnt_out : out STD_LOGIC
           );
end INV_chain_13;

architecture Behavioral of INV_chain_13 is
 
       signal o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13 : std_logic;
      -- signal gate_o : std_logic_vector(12 downto 0);  
       attribute syn_keep: boolean;
       attribute syn_keep of o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13: signal is true;
       attribute dont_touch : string;
       attribute dont_touch of o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13 : signal is "true";
       
       component inverter
        port(
            Input : in STD_LOGIC;
            Output : out STD_LOGIC);
       end component;

begin

      Inv1 : inverter port map(
            Input => input,
            Output => o1);
            
      Inv2 : inverter port map(
            Input => o1,
            Output => o2);
            
      Inv3 : inverter port map(
            Input => o2,
            Output => o3);
            
      Inv4 : inverter port map(
             Input => o3,
             Output => o4);
                        
      Inv5 : inverter port map(
             Input => o4,
             Output => o5);
             
      Inv6 : inverter port map(
             Input => o5,
             Output => o6);
             
      Inv7 : inverter port map(
             Input => o6,
             Output => o7);
                         
      Inv8 : inverter port map(
             Input => o7,
             Output => o8);
                                     
      Inv9 : inverter port map(
             Input => o8,
             Output => o9);
                                                 
      Inv10 : inverter port map(
             Input => o9,
             Output => o10);
                                                             
      Inv11 : inverter port map(
             Input => o10,
             Output => o11);
                                                                         
      Inv12 : inverter port map(
             Input => o11,
             Output => o12);
                                                                                     
      Inv13 : inverter port map(
             Input => o12,
             Output => o13);
             
             
cnt_out <= o1;
Output <= o13;



                      
end Behavioral;
