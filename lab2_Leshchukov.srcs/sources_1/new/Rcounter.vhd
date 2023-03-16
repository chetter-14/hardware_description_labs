----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 10:59:57
-- Design Name: 
-- Module Name: Rcounter - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rcounter is
    Port (  updown : in STD_LOGIC;
            Clk    : in STD_LOGIC;
            Reset  : in STD_LOGIC;
            data   : out STD_LOGIC_VECTOR (15 downto 0) );
end Rcounter;

architecture Behavioral of Rcounter is

begin

    process (Clk, reset)
       variable D : STD_LOGIC_VECTOR (15 downto 0);
       begin
        if reset = '1' then
            D := (others => '0');
        elsif Clk = '1' and Clk'event then
            if updown = '1' then
                D := D + 1;
            else
                D := D - 1;
            end if;
        end if;
       data <= D;
    end process;

end Behavioral;
