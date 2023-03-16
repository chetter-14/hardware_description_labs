----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 11:41:28
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
port ( Clk : in STD_LOGIC;
       Reset : in STD_LOGIC;
       Address : out STD_LOGIC_VECTOR (1 downto 0);
       Anode : out STD_LOGIC_VECTOR (3 downto 0) );
end FSM;

architecture Behavioral of FSM is
type statetype is (S0, S1, S2, S3);
signal state : statetype;

begin

process (Clk, Reset)
begin
    if rising_edge(Clk) then
        if Reset = '1' then state <= S0; Anode <= B"1111";
        else 
            case state is 
                when S0 => Address <= B"00"; Anode <= B"1110"; state <= S1;
                when S1 => Address <= B"01"; Anode <= B"1101"; state <= S2;
                when S2 => Address <= B"10"; Anode <= B"1011"; state <= S3;
                when others => Address <= B"11"; Anode <= B"0111"; state <= S0;
             end case;
        end if;
    end if;
end process;

end Behavioral;
