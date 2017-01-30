------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 18.01.2017 13:35:32
---- Design Name: 
---- Module Name: mux_24_to_8 - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity mux_24_to_8 is
--     Port (   input    :in  std_logic_vector (23 downto 0);
--              sel     :in  std_logic_vector (1 downto 0);
--              mux_out :out std_logic_vector (15 downto 0)
--     );
--end mux_24_to_8;

--architecture Behavioral of mux_24_to_8 is

--signal temp : std_logic_vector(7 downto 0);
--signal temp1 : std_logic_vector(7 downto 0);
--signal temp2 : std_logic_vector(7 downto 0);

--begin

----with (sel) select
----mux_out <= input(7 downto 0) when "00",
----           input(15 downto 8) when "01",
----           input(23 downto 16) when others;

--MUX:
--   process (sel, input) begin
--     if (sel = "00") then
--         temp <= input(7 downto 0);
--     elsif (sel = "01") then
--         temp1 <= input(7 downto 0);
--     else 
--         temp2 <= input(7 downto 0);
    
--end if;
--end process;      

--    mux_out <= temp & temp1 & temp2; 

--end Behavioral;
