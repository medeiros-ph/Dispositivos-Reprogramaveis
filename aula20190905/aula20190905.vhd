library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity aula20190905 is
	port (
		signal CLOCK_50 : in std_logic;
		signal KEY		 : in std_logic_vector (3 downto 0);
		signal SW		 : in std_logic_vector (17 downto 0);
		signal LEDG		 : out std_logic_vector (7 downto 0);
		signal LEDR		 : out std_logic_vector (7 downto 0);
		signal HEX7		 : out std_logic_vector (6 downto 0);
		signal HEX6		 : out std_logic_vector (6 downto 0)
	);
end entity aula20190905;


architecture c_aula20190905 of aula20190905 is

	component aula20190905_QSYS is
		port (
			clk_clk       : in  std_logic                    := '0';             --   clk.clk
			reset_reset_n : in  std_logic                    := '0';             -- reset.reset_n
			key_export    : in  std_logic_vector(3 downto 0) := (others => '0'); --   key.export
			sw_export     : in  std_logic_vector(7 downto 0) := (others => '0'); --    sw.export
			ledg_export   : out std_logic_vector(7 downto 0);                    --  ledg.export
			ledr_export   : out std_logic_vector(7 downto 0);                    --  ledr.export
			hex6_export   : out std_logic_vector(6 downto 0);                    --  hex6.export
			hex7_export   : out std_logic_vector(6 downto 0)                     --  hex7.export
		);
	end component aula20190905_QSYS;	

signal clock, reset : std_logic;

begin
clock <= CLOCK_50;
reset <= SW(17);

xnios : aula20190905_QSYS port map (clock, reset, KEY, SW(7 downto 0), LEDG(7 downto 0), LEDR, HEX7, HEX6);	

end architecture c_aula20190905;