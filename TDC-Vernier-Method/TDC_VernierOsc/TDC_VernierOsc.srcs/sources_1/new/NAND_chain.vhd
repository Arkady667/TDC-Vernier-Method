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
--library UNISIM;
--use UNISIM.VComponents.all;

entity INV_chain_15 is
    Port ( input : in STD_LOGIC;
           output : out STD_LOGIC;
           cnt_sig : inout STD_LOGIC);
end INV_chain_15;

architecture Behavioral of INV_chain_15 is
    
       signal gate_o : std_logic_vector(14 downto 0);
begin
    
   gate_o(0) <= input; 
    
   inv_g_chain : for i in 1 to gate_o'high generate
        gate_o(i) <= not gate_o(i-1);
   end generate;
   
   gate_o(1) <= cnt_sig;
   output <= gate_o(14);
                      
end Behavioral;
