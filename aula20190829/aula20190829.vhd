library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity aula20190829 is
	port (
		clk        : in  std_logic;
		reset  : in  std_logic;
		pio_in  : in  std_logic_vector(7 downto 0);
		pio_out : out std_logic_vector(7 downto 0)
	);
end entity aula20190829;

architecture c_aula20190829 of aula20190829 is

	component aula20190829_QSYS is
		port (
			clk_clk        : in  std_logic                    := 'X';             --     clk.clk
			reset_reset_n  : in  std_logic                    := 'X';             --   reset.reset_n
			pio_in_export  : in  std_logic_vector(7 downto 0) := (others => 'X'); --  pio_in.export
			pio_out_export : out std_logic_vector(7 downto 0)                     -- pio_out.export
		);
	end component aula20190829_QSYS;

begin
xnios: aula20190829_QSYS port map (clk, reset, pio_in, pio_out);

end architecture c_aula20190829;