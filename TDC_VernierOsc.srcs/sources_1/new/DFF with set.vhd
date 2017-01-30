----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2017 15:32:51
-- Design Name: 
-- Module Name: DFF with set - Behavioral
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

entity ffd_set is
    port ( 
        D, CLK, S : in std_logic;
        Q : out std_logic );
end ffd_set;

architecture Bech of ffd_set is
begin

    process( CLK, S )
        begin
            if S = '0' then
                Q <= '1';
            elsif rising_edge(CLK) then
                Q <= D;
            end if;
        end process;
end Bech;
