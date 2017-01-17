----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2017 16:30:30
-- Design Name: 
-- Module Name: Detektor_koincyd - Behavioral
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

entity Detektor_koincyd is
    Port ( Osc_st : in STD_LOGIC;
           Osc_sp : in STD_LOGIC;
           Coin_en : in STD_LOGIC;
           Coin : out STD_LOGIC);
end Detektor_koincyd;

architecture Behavioral of Detektor_koincyd is

    signal d1_out : std_logic;
    signal d2_out : std_logic;
    signal d3_out : std_logic;
    signal d3_out_not : std_logic;
    signal d4_out : std_logic;
    signal coin_o : std_logic;
    
    component ffd
       port(
          D,CLK,R : in STD_LOGIC;
          Q: out STD_LOGIC
          );
    end component;

begin

    d3_out_not <= not d3_out;

    D1 : ffd port map(
        D => Osc_st,
        CLK => Osc_sp,
        R => Coin_en,
        Q => d1_out);
       
    D2 : ffd port map(
        D => d1_out,
        CLK => Osc_sp,
        R => Coin_en,
        Q => d2_out);
        
    D3 : ffd port map(
        D => d2_out,
        CLK => Osc_sp,
        R => Coin_en,
        Q => d3_out);
        
    D4 : ffd port map(
        D => '1',
        CLK => d3_out,
        R => Coin_en,
        Q => coin_o);
        
    Coin <= coin_o;

end Behavioral;
