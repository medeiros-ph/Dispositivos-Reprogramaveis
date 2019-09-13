library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity controladordisplay_par is
port (
	signal clk_pisca1, clk_pisca2 : in std_logic;
	signal grava : in std_logic;
	signal dado : in std_logic_vector (3 downto 0);
	signal tipo : in std_logic_vector (1 downto 0);
	signal local : in std_logic_vector (2 downto 0);
	signal disp7, disp6, disp5, disp4, 
		disp3, disp2, disp1, disp0 : out std_logic_vector (6 downto 0)
	);
end entity controladordisplay_par;

architecture c_controladordisplay_par of controladordisplay_par is

component conv_7seg_hex is
port (
	signal en : in std_logic;
	signal num : in std_logic_vector (3 downto 0);
	signal disp_out : out std_logic_vector (6 downto 0) );
end component conv_7seg_hex;

signal en7, en6, en5, en4, en3, en2, en1, en0 : std_logic;
signal dado7, dado6, dado5, dado4, dado3, dado2, dado1, dado0 : std_logic_vector (3 downto 0) := "0000";
signal tipo7, tipo6, tipo5, tipo4, tipo3, tipo2, tipo1, tipo0 : std_logic_vector (1 downto 0) := "00";

begin

memoria: process (grava)

begin

if grava='0' and grava'event then

	case local is
		when "000" => dado0 <= dado; tipo0 <= tipo;
		when "001" => dado1 <= dado; tipo1 <= tipo;
		when "010" => dado2 <= dado; tipo2 <= tipo;
		when "011" => dado3 <= dado; tipo3 <= tipo;
		when "100" => dado4 <= dado; tipo4 <= tipo;
		when "101" => dado5 <= dado; tipo5 <= tipo;
		when "110" => dado6 <= dado; tipo6 <= tipo;
		when "111" => dado7 <= dado; tipo7 <= tipo;
	end case;

end if;

end process memoria;

with tipo7 select
	en7 <=	'0' when "00",
				'1' when "01",
				clk_pisca1 when "10",
				clk_pisca2 when "11";
				
with tipo6 select
	en6 <=	'0' when "00",
				'1' when "01",
				clk_pisca1 when "10",
				clk_pisca2 when "11";
				
with tipo5 select
	en5 <=	'0' when "00",
				'1' when "01",
				clk_pisca1 when "10",
				clk_pisca2 when "11";
				
with tipo4 select
	en4 <=	'0' when "00",
				'1' when "01",
				clk_pisca1 when "10",
				clk_pisca2 when "11";
				
with tipo3 select
	en3 <=	'0' when "00",
				'1' when "01",
				clk_pisca1 when "10",
				clk_pisca2 when "11";
				
with tipo2 select
	en2 <=	'0' when "00",
				'1' when "01",
				clk_pisca1 when "10",
				clk_pisca2 when "11";
				
with tipo1 select
	en1 <=	'0' when "00",
				'1' when "01",
				clk_pisca1 when "10",
				clk_pisca2 when "11";
				
with tipo0 select
	en0 <=	'0' when "00",
				'1' when "01",
				clk_pisca1 when "10",
				clk_pisca2 when "11";

xdisplay7 : conv_7seg_hex port map (en7, dado7, disp7);
xdisplay6 : conv_7seg_hex port map (en6, dado6, disp6);
xdisplay5 : conv_7seg_hex port map (en5, dado5, disp5);
xdisplay4 : conv_7seg_hex port map (en4, dado4, disp4);
xdisplay3 : conv_7seg_hex port map (en3, dado3, disp3);
xdisplay2 : conv_7seg_hex port map (en2, dado2, disp2);
xdisplay1 : conv_7seg_hex port map (en1, dado1, disp1);
xdisplay0 : conv_7seg_hex port map (en0, dado0, disp0);



end architecture c_controladordisplay_par;
