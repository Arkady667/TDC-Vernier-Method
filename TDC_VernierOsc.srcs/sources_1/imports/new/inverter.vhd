----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.01.2017 10:43:01
-- Design Name: 
-- Module Name: inverter - Behavioral
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

entity inverter is
    Port ( Input : in STD_LOGIC;
           Output : out STD_LOGIC);
end inverter;

architecture Behavioral of inverter is

signal I0 : std_logic;
attribute syn_keep: boolean;
attribute syn_keep of I0: signal is true;
--attribute dont_touch : string;
--attribute dont_touch of I0 : signal is "true";


begin

Output <= not Input;


--not_I0 <= not I0;

--LUT1_inst : LUT1
--generic map (
--    INIT => "00")
--port map (
--    O => O, -- LUT general output
--    I0 => not I0 -- LUT input
--    );

end Behavioral;
