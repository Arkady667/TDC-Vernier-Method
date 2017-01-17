----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2017 16:30:30
-- Design Name: 
-- Module Name: Oscylatory - Behavioral
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

entity Oscylator_ST is
    generic(
        -- Number of CARRY4 elements.
        g_WIDTH: positive :=2
    );
    Port ( Pulse_st : in STD_LOGIC;
           Osc_st : out STD_LOGIC
           );
end Oscylator_ST;

architecture Behavioral of Oscylator_ST is
        
        signal carry_o : std_logic_vector(4*g_WIDTH-1 downto 0);
        signal osc_o : std_logic_vector(4*g_WIDTH-1 downto 0);
        signal osc_st_sig : std_logic;
        signal pulse_st_sig : std_logic;
        signal pulse_st_sig_o : std_logic;
       
       
begin

   Osc_st <= osc_st_sig;
   pulse_st_sig <= Pulse_st; 
    -- generate a carry chain
    g_carry4: for i in 0 to g_WIDTH-1 generate
        g_firstcarry4: if i = 0 generate
            cmp_CARRY4: CARRY4 port map(
                CO => carry_o(3 downto 0),
                CI => '0',
                CYINIT => pulse_st_sig_o,
                DI => "0000",
                S => "1111"
            );
         end generate;
         g_nextcarry4: if i > 0 generate
            cmp_CARRY4: CARRY4 port map(
                CO(0) => osc_o(0),
                CO(1) => osc_o(1),
                CO(2) => osc_o(2),
                CO(3) => osc_o(3),
                CI => carry_o(3),
                CYINIT => '0',
                DI => "0000",
                S => "1111"
            );
         end generate;
    end generate;
     
--     carry_o(0) <= carry_o(1);
--     carry_o(1) <= carry_o(2);
--     carry_o(2) <= carry_o(3);
     
--     osc_o(0) <= osc_o(1);
--     osc_o(1) <= osc_o(2);
--     osc_o(2) <= osc_o(3);

     osc_st_sig <= osc_o(3);
     pulse_st_sig_o <= Pulse_st nand osc_o(3);


end Behavioral;
