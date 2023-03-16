----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 11:37:29
-- Design Name: 
-- Module Name: Mux - Behavioral
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

entity Mux is
port ( A : in STD_LOGIC_VECTOR (15 downto 0);
       Address : in STD_LOGIC_VECTOR (1 downto 0);
       Q : out STD_LOGIC_VECTOR (3 downto 0) );
end Mux;

architecture Behavioral of Mux is

begin
with Address select 
    Q <= A (3 downto 0) when "00",
         A (7 downto 4) when "01",
         A (11 downto 8) when "10",
         A (15 downto 12) when others;

end Behavioral;
