----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 16:09:47
-- Design Name: 
-- Module Name: simm - Behavioral
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

entity simm is
--  Port ( );
end simm;

architecture Behavioral of simm is
    component schematic_wrapper 
        port ( 
            Anode : out STD_LOGIC_VECTOR (3 downto 0);
            Clock : in STD_LOGIC;
            D_IN : in STD_LOGIC;
            LED : out STD_LOGIC_VECTOR (6 downto 0);
            reset : in STD_LOGIC;
            updown : in STD_LOGIC );
    end component schematic_wrapper;
    
    signal Reset : STD_LOGIC := '0';
    signal D_IN : STD_LOGIC := '0';
    signal updown : STD_LOGIC := '0';
    signal Clock : STD_LOGIC := '0';
    -- declare output
    signal Anode : STD_LOGIC_VECTOR (3 downto 0) := B"1111";
    signal LED : STD_LOGIC_VECTOR (6 downto 0);
    
begin

insta : schematic_wrapper
port map(
    Anode(3 downto 0) => Anode(3 downto 0),
    Clock => Clock,
    D_IN => D_IN,
    LED (6 downto 0) => LED (6 downto 0),
    reset => reset,
    updown => updown );
    
clk : process
begin
    Clock <= '0'; wait for 1 ns;
    Clock <= '1'; wait for 1 ns;
end process;

tb : process
begin
    Reset <= '0'; D_IN <= '0'; updown <= '0'; wait for 10 ns;
    Reset <= '1'; wait for 10 ns;
    Reset <= '0'; wait for 157 ns;
    D_IN <= '1'; wait for 52 ns;
    D_IN <= '0'; wait for 152 ns;
    D_IN <= '1'; wait for 52 ns;
    D_IN <= '0'; wait for 82 ns;
end process;

end Behavioral;
