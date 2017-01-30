----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.01.2017 16:38:11
-- Design Name: 
-- Module Name: Uklad_WE - Behavioral
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

entity Uklad_WE is
    Port ( Start : in STD_LOGIC;
           Stop : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Pulse_st : out STD_LOGIC;
           Pulse_sp : out STD_LOGIC;
           Encnt_st : out STD_LOGIC;
           Encnt_sp : out STD_LOGIC 
           );
end Uklad_WE;

architecture Behavioral of Uklad_WE is

    signal start_sig : std_logic;
    signal stop_sig : std_logic;
    signal reset_sig : std_logic;
    signal dst1_out : std_logic;
    signal dst2_out : std_logic;
    signal dsp1_out : std_logic;
    signal dsp2_out : std_logic;
    signal INV_chain_13_o : std_logic;
    signal INV_chain_15_o : std_logic;
    signal gate_cnt1_o : std_logic;
    signal gate_cnt2_o : std_logic;
    signal dcnt1_out : std_logic;
    signal dcnt2_out : std_logic;

 constant vcc : std_logic := '1';
 constant gnd : std_logic := '0';

--attribute keep_hierarchy : string;
--attribute keep_hierarchy of Behavioral : architecture is "yes";
    

   

    component ffd
       port(
          D,CLK,R : in STD_LOGIC;
          Q: out STD_LOGIC
          );
     end component;
     
     component ffd_set
        port(
            D, CLK, S : in std_logic;
            Q : out std_logic 
            );
      end component;
      
      component INV_chain_13
        port(
            input : in STD_LOGIC;
            output : out STD_LOGIC;
            cnt_out : out std_logic
        );
       end component;
       
       component INV_chain_15
         port(
             input : in STD_LOGIC;
             output : out STD_LOGIC;
             cnt_out : out std_logic
          );
       end component;
    

begin
--    start_sig <= Start;
--    stop_sig <= Stop;
--    reset_sig <= Reset;
    
    

    DST1: ffd port map(
            D => vcc,
            CLK => Start,
            R => Reset,
            Q => dst1_out);
            
    DST2 : ffd_set port map(
            D => gnd,
            CLK => dst1_out,
            S => INV_chain_13_o,
            Q => dst2_out);
            
    DSP1 : ffd port map(
            D => dst1_out,
            CLK => Stop,
            R => Reset,
            Q => dsp1_out);
            
    DSP2 : ffd_set port map(
            D => gnd,
            CLK => dsp1_out,
            S => INV_chain_15_o,
            Q => dsp2_out);
            
    DCNT1 : ffd port map(
            D => vcc,
            CLK => gate_cnt1_o,
            R => Reset,
            Q => dcnt1_out);
            
    DCNT2 : ffd port map(
            D => vcc,
            CLK => gate_cnt2_o,
            R => Reset,
            Q => dcnt2_out);
            
    INV_chain_st : INV_chain_13 port map(
            input => dst2_out,
            output => INV_chain_13_o,
            cnt_out => gate_cnt1_o);
           
    INV_chain_sp : INV_chain_15 port map(
            input => dsp2_out,
            output => INV_chain_15_o,
            cnt_out => gate_cnt2_o);
            
    Pulse_st <= dst2_out;
    Pulse_sp <= dsp2_out;
    Encnt_st <= dcnt1_out;
    Encnt_sp <= dcnt2_out;
                   
        
end Behavioral;
