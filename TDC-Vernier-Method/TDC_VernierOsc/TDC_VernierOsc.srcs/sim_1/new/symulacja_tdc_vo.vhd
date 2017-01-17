----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.01.2017 14:57:49
-- Design Name: 
-- Module Name: symulacja_tdc_vo - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity symulacja_tdc_vo is

end symulacja_tdc_vo;

architecture Behavioral of symulacja_tdc_vo is

    component Uklad_WE
        Port(
                  Start : in STD_LOGIC;
                  Stop : in STD_LOGIC;
                  Reset : in STD_LOGIC;
                  Pulse_st : out STD_LOGIC;
                  Pulse_sp : out STD_LOGIC;
                  Encnt_st : out STD_LOGIC;
                  Encnt_sp : out STD_LOGIC);
    end component;
    
    component top
        Port ( 
           START, STOP, RESET : in std_logic;
           CNT_ST : out std_logic_vector(15 downto 0);
           CNT_SP : out std_logic_vector(11 downto 0)  
        );
    end component;
    
    component ffd
        port (
             D, CLK, R : in std_logic;
            Q : out std_logic );
    end component;
    
    component INV_chain_13 
        port(
             input : in STD_LOGIC;
             output : out STD_LOGIC;
             cnt_sig : inout std_logic
           );
    end component;
    --inputs
--    signal START : std_logic := '0';
--    signal STOP : std_logic := '0';
--    signal RESET : std_logic := '0';
    signal input : std_logic := '0';
    signal cnt_sig : std_logic ;
    signal output : std_logic ;

    
--    signal Start :  STD_LOGIC := '0';
--    signal Stop :  STD_LOGIC := '0';
--    signal Reset :  STD_LOGIC := '0';
   
    --outputs
--    signal Pulse_st :  STD_LOGIC;
--    signal Pulse_sp :  STD_LOGIC;
--    signal Encnt_st :  STD_LOGIC;
--    signal Encnt_sp :  STD_LOGIC;
--    signal CNT_ST : std_logic_vector(15 downto 0); 
--    signal CNT_SP : std_logic_vector(11 downto 0);
    
 
    
begin
    --uut  
--        uut1: top port map( 
--            START => START,
--            STOP => STOP,
--            RESET => RESET,
--            CNT_ST => CNT_ST,
--            CNT_SP => CNT_SP);

--         uut: Uklad_WE port map(
--            Start => Start,
--            Stop => Stop,
--            Reset => Reset,
--            Pulse_st => Pulse_st,
--            Pulse_sp => Pulse_sp, 
--            Encnt_st => Encnt_st,
--            Encnt_sp => Encnt_sp);

            uut : INV_chain_13 port map(
               input => input,
               output => output,
               cnt_sig => cnt_sig);
            
       -- stimuluis process
        stim_proc1: process
            begin
            input <= not input after 250 ps;
            wait for 500 ps;
                
--                START <= not START after 1 ps;
--                 wait for 500 ps;
        
        
        end process;
        
        
--        stim_proc2: process
--            begin
--            Stop <= not Stop after 50 ps;
--            wait for 500 ps;
                
----                STOP <= not STOP after 10 ps;
----                wait for 500 ps;
        
--        end process;
        
--        stim_proc3: process
--            begin
--            wait for 150 ps;
--            Reset <= not Reset;
----            wait for 500 ps; 
----                RESET <= not RESET after 350 ps;
----                wait for 500 ps;        
--        end process;
end Behavioral;
