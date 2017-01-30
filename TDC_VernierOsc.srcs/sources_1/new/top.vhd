----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.01.2017 11:13:23
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
  Port ( 
       START, STOP, RESET : in std_logic;
       CNT_ST : out std_logic_vector(7 downto 0)
   --    CNT_SP : out std_logic_vector(7 downto 0)  
       -- MUX : out std_logic_vector(7 downto 0)
    );
end top;

architecture Behavioral of top is

    signal pulse_st_sig : std_logic;
    signal pulse_sp_sig : std_logic;
    signal encnt_st_sig : std_logic;
    signal encnt_sp_sig : std_logic;
    signal osc_st_o : std_logic;
    signal osc_sp_o : std_logic; 
    signal coin_en_o : std_logic;
    signal coin_o : std_logic;
    signal cnt_out_st : std_logic_vector(7 downto 0);
    signal cnt_out_sp : std_logic_vector(7 downto 0);
     signal sp_sig : std_logic;
     signal sp1_sig : std_logic;
     signal sp2_sig : std_logic;
     signal st_sig : std_logic;
     signal st1_sig : std_logic;
     signal main : std_logic;
     signal sel_sig : std_logic_vector(1 downto 0);
     signal mux_out_sig : std_logic_vector(7 downto 0);
     
     attribute syn_keep: boolean;
     attribute syn_keep of sp_sig, sp1_sig, st_sig : signal is true;
     attribute dont_touch : string;
     attribute dont_touch of sp_sig, sp1_sig, st_sig  : signal is "true";
       
       
    component Uklad_WE 
        port(
          Start : in STD_LOGIC;
          Stop : in STD_LOGIC;
          Reset : in STD_LOGIC;
          Pulse_st : out STD_LOGIC;
          Pulse_sp : out STD_LOGIC;
          Encnt_st : out STD_LOGIC;
          Encnt_sp : out STD_LOGIC);
    end component; 
          
    component Oscylator_SP 
        port(
          Pulse_sp : in STD_LOGIC;
          Osc_sp : out STD_LOGIC);
    end component; 
         
    component Oscylator_ST
        port(
          Pulse_st : in STD_LOGIC;
          Osc_st : out STD_LOGIC);
    end component;      
    
    component Detektor_koincyd 
        port(
          Osc_st : in std_logic;
          Osc_sp : in std_logic;
          Coin_en : in STD_LOGIC;
          Coin : out std_logic);
    end component;
    
    component Licznik_ST
        port(
           clk : in std_logic;
           reset : in std_logic;
           count : buffer std_logic_vector(7 downto 0));
    end component;
    
    component Licznik_SP
         port(
           clk : in std_logic;
           reset : in std_logic;
           coin_en : out std_logic;
           count : buffer std_logic_vector(7 downto 0));
    end component;
    
    component mux_24_to_8
          port(
             input    :in  std_logic_vector (7 downto 0);
--             input2    :in  std_logic_vector (7 downto 0);
             sel     :in  std_logic_vector (1 downto 0);
             mux_out :out std_logic_vector (7 downto 0));
     end component;
         

begin
    st_sig <= START;
  --  sp_sig <= STOP;
    sp_sig <= st_sig;
    sp1_sig <=   sp_sig;

    


    Uklad_WE_cmp : Uklad_WE port map(
            Start => st_sig,
            Stop => sp1_sig,
            Reset => RESET,
            Pulse_st => pulse_st_sig,
            Pulse_sp => pulse_sp_sig,
            Encnt_st => encnt_st_sig,
            Encnt_sp => encnt_sp_sig);
            
    Oscylator_start : Oscylator_ST port map(
            Pulse_st => pulse_st_sig,
            Osc_st => osc_st_o);
          
    Oscylator_stop : Oscylator_SP port map(
            Pulse_sp => pulse_sp_sig,
            Osc_sp => osc_sp_o);
            
    Det_koincyd : Detektor_koincyd port map(
            Osc_st => osc_st_o,
            Osc_sp => osc_sp_o,
            Coin_en => coin_en_o,
            Coin => coin_o);
        
    Licznik_start : Licznik_ST port map(
            clk => osc_st_o or coin_o,
            reset => encnt_st_sig,
            count => cnt_out_st);
            
    Licznik_stop : Licznik_SP port map(
            clk => osc_sp_o or coin_o,
            reset => encnt_sp_sig,
            coin_en => coin_en_o,
            count => cnt_out_sp);
            
         --   cnt_out_sp <= cnt_out_st;
            
--     Multiplekser : mux_24_to_8 port map(
--            input => cnt_out_st ,
--           -- input2 => cnt_out_sp,
--            sel => sel_sig,
--            mux_out => mux_out_sig);
            
            
    CNT_ST <= cnt_out_st;
  --  CNT_SP <= cnt_out_sp;     

--       MUX <= mux_out_sig;
       

end Behavioral;
