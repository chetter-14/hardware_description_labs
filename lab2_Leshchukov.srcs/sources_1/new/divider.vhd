----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2023 11:13:05
-- Design Name: 
-- Module Name: divider - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ANDE is
port (
    X1, X2 : in STD_LOGIC;
    Y      : out STD_LOGIC);
end ANDE;

architecture ANDA of ANDE is

begin 
    Y <= X1 and X2;
end ANDA;

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JFF is 
port (
    J, C, R : in STD_LOGIC;
    Q       : out STD_LOGIC);
end JFF;

architecture JK of JFF is 

signal QIN : std_logic;

begin

process (C) 
begin 
    if C'event and C = '1' then
        if R = '1' then QIN <= '0';
        elsif J = '1' then QIN <= not QIN;
        end if;
    end if;
end process;
Q <= QIN;

end JK;

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider is
generic (Nd : integer := 24);
    Port ( Clock : in STD_LOGIC;
           Clk_led : out STD_LOGIC;
           Clk_deb : out STD_LOGIC;
           reset : in STD_LOGIC);
end divider;

architecture Behavioral of divider is

component JFF
port ( J, C, R : in STD_LOGIC;
            Q  : out STD_LOGIC);
end component;

component ANDE 
port ( X1, X2 : in STD_LOGIC;
            Y : out STD_LOGIC);
end component;

signal T,V : STD_LOGIC_VECTOR (0 to Nd);

begin

T(0) <= '1';
Clk_deb <= V(18);
Clk_led <= V(19);
ST0 : JFF port map (J => T(0), C => Clock, R => reset, Q => V(1) );
JK1 : for i in 1 to Nd-1 generate 
      begin 
        ST1 : ANDE port map (X1 => T(i - 1), X2 => V(i), Y => T(i) );
        ST2 : JFF port map (J => T(i), C => Clock, R => reset, Q => V(i + 1) );
      end generate;

end Behavioral;
