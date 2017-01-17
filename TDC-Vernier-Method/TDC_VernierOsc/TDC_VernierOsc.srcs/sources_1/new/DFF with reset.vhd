library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ffd is
    port (
         D, CLK, R : in std_logic;
        Q : out std_logic );
end ffd;

architecture Bech of ffd is
begin

    process( CLK, R )
        begin
            if R = '0' then
                Q <= '0';
             elsif rising_edge(CLK) then
                Q <= D;
            end if;
       end process;
end Bech;