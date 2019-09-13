library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity conv_7seg_hex is
port (
	signal en : in std_logic;
	signal num : in std_logic_vector (3 downto 0);
	signal disp_out : out std_logic_vector (6 downto 0) );
end entity conv_7seg_hex;


architecture c_conv_7seg_hex of conv_7seg_hex is

signal aux : std_logic_vector (6 downto 0 ) := "1111111";

begin


-- enable=1 - funcionamento normial;
-- saida alta apaga o segmento;
-- saida baixa acende o segmento;
-- enable = 0 - display apagado, todas saidas alta;

disp_out <= aux when en='1' else "1111111";

WITH num SELECT
aux <= 	"1000000" WHEN "0000", --0
			"1111001" WHEN "0001", --1
			"0100100" WHEN "0010", --2
			"0110000" WHEN "0011", --3
			"0011001" WHEN "0100", --4
			"0010010" WHEN "0101", --5
			"0000010" WHEN "0110", --6
			"1111000" WHEN "0111", --7
			"0000000" WHEN "1000", --8
			"0010000" WHEN "1001", --9
			"0001000" WHEN "1010", --A
			"0000011" WHEN "1011", --b
			"1000110" WHEN "1100", --C
			"0100001" WHEN "1101", --d
			"0000110" WHEN "1110", --E
			"0001110" WHEN "1111"; --F;

end architecture c_conv_7seg_hex;
