library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity conv7seg is
port(
signal dado : in std_logic_vector (3 downto 0);
signal en : in std_logic;
signal disp : out std_logic_vector (6 downto 0)
);
end entity conv7seg;

architecture c_conv7seg of conv7seg is
signal disp_in : std_logic_vector (6 downto 0);

begin
-- 1 Led do disp7seg off
-- 0 Led do disp7seg on

with dado select 
disp_in <= "1000000" when "0000", -- numero 0
			  "1111001" when "0001", -- numero 1
			  "0100100" when "0010", -- numero 2
			  "0110000" when "0011", -- numero 3
			  "0011001" when "0100", -- numero 4
			  "0010010" when "0101", -- numero 5
			  "0000010" when "0110", -- numero 6
			  "1111000" when "0111", -- numero 7
			  "0000000" when "1000", -- numero 8
			  "0010000" when "1001", -- numero 9
			  "1111111" when OTHERS; --blank when not a digit
disp <= disp_in when en='1' else
			  "1111111";

end architecture c_conv7seg;
-- https://www.digikey.com/eewiki/pages/viewpage.action?pageId=60031550
-- http://gen-io.grupogen.com.br/gen-io/index.php?option=com_content&view=article&id=300&catid=60&Itemid=96