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
  port(
    clk, reset : in  std_logic;
    count : buffer std_logic_vector (15 downto 0)
    );
end Licznik_ST;

architecture counter of Licznik_ST is
begin
bcd_counting: process (clk, reset)
begin  -- process bcd_counting
  if reset = '1' then                   -- asynchronous reset (active high)
    count <= ( others => '0');
  elsif (clk'event and clk = '1') then    -- rising clock edge
    if count ( 3 downto 0) = "1001" then
      count(3 downto 0) <= "0000";
      if count ( 7 downto 4) = "1001" then
        count(7 downto 4)  <= "0000";
        if count ( 11 downto 8 ) = "1001" then
          count(11 downto 8 )  <= "0000";
          if count ( 15 downto 12) = "1001" then
            count(15 downto 12) <= "0000";
          else
            count(15 downto 12) <= count(15 downto 12) + '1';
          end if;
        else
          count(11 downto 8 ) <= count(11 downto 8 ) + '1';
        end if;
      else
        count(11 downto 8 ) <= count(11 downto 8 ) + '1';
      end if;
    else
      count(3 downto 0 ) <= count(3 downto 0 ) + '1';
    end if;
  end if;
end process bcd_counting;
end counter;
