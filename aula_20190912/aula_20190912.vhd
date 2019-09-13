library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity aula_20190912 is

port (
-- sinal de clock
signal CLOCK_50 : in std_logic;

-- chaves
signal KEY : in std_logic_vector (3 downto 0);
signal SW : in std_logic_vector (17 downto 0);

-- leds
signal LEDG : out std_logic_vector (7 downto 0);
signal LEDR : out std_logic_vector (17 downto 0);

-- displays de 7 segmentos
signal HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, 
       HEX1, HEX0 : out std_logic_vector (6 downto 0)


);
end entity aula_20190912;

architecture c_aula_20190912 of aula_20190912 is


component geradorclock is
port (
	signal clk_in : in std_logic;
	signal clk_out1, clk_out2 : out std_logic
	);
end component geradorclock;


component controladordisplay_par is
port (
	signal clk_pisca1, clk_pisca2 : in std_logic;
	signal grava : in std_logic;
	signal dado : in std_logic_vector (3 downto 0);
	signal tipo : in std_logic_vector (1 downto 0);
	signal local : in std_logic_vector (2 downto 0);
	signal disp7, disp6, disp5, disp4, 
		disp3, disp2, disp1, disp0 : out std_logic_vector (6 downto 0)
	);
end component controladordisplay_par;

	component aula_20190912_qsys is
		port (
			clk_clk       : in  std_logic                    := 'X';             -- clk
			reset_reset_n : in  std_logic                    := 'X';             -- reset_n
			grava_export  : out std_logic;                                       -- export
			local_export  : out std_logic_vector(2 downto 0);                    -- export
			tipo_export   : out std_logic_vector(1 downto 0);                    -- export
			dado_export   : out std_logic_vector(3 downto 0);                    -- export
			ledr_export   : out std_logic_vector(7 downto 0);                    -- export
			ledg_export   : out std_logic_vector(7 downto 0);                    -- export
			sw_export     : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			key_export    : in  std_logic_vector(3 downto 0) := (others => 'X')  -- export
		);
	end component aula_20190912_qsys;

signal reset, clk : std_logic;
signal clk1, clk2 : std_logic;

signal clk_pisca1, clk_pisca2 : std_logic;
signal grava : std_logic;
signal dado : std_logic_vector (3 downto 0);
signal tipo : std_logic_vector (1 downto 0);
signal local : std_logic_vector (2 downto 0);
signal disp7, disp6, disp5, disp4, disp3, disp2, disp1, disp0 : std_logic_vector (6 downto 0);

begin

reset <= SW(17);
clk <= CLOCK_50;

x1 : geradorclock port map (clk, clk1, clk2);

x2 : controladordisplay_par port map (clk1, clk2, grava, dado, tipo, local, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);

x3 : aula_20190912_qsys port map(clk, reset, grava, local, tipo, dado, ledr(7 downto 0) , ledg(7 downto 0), sw(7 downto 0), key(3 downto 0));

end architecture c_aula_20190912;