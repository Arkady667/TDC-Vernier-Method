----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2017 16:30:30
-- Design Name: 
-- Module Name: Liczniki - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Licznik_ST is
  generic( 
    nbit: INTEGER := 8);
  port(
    clk, reset : in  std_logic;
    count : buffer std_logic_vector (7 downto 0)
    );
end Licznik_ST;

architecture counter of Licznik_ST is

signal tmp: std_logic_vector((nbit-1) DOWNTO 0);

begin
  
      process (clk, reset) 
        begin  
          if (reset='1') then  
            tmp <= "00000000";  
          elsif (clk'event and clk='1') then  
            tmp <= tmp + 1; 
          end if;  
      end process; 
      count <= tmp;  
end counter;
