--Nios
-- Tools > Qsys


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity aula_220819 is
	port (
		clk : in  std_logic                    := '0';             --                       clk.clk
		reset_reset : in  std_logic                    := '0';             --                     reset.reset_n
		pio_0 : in  std_logic_vector(7 downto 0) := (others => '0'); -- pio_0_external_connection.export
		pio_1 : out std_logic_vector(7 downto 0)                     -- pio_1_external_connection.export
	);
end entity aula_220819;

architecture c_aula_220819 of aula_220819;

	component aula_220819-qsys is
		port (
			clk_clk                          : in  std_logic                    := 'X';             -- clk
			reset_reset_n                    : in  std_logic                    := 'X';             -- reset_n
			pio_0_external_connection_export : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			pio_1_external_connection_export : out std_logic_vector(7 downto 0)                     -- export
		);
	end component aula_220819-qsys;


begin

xnios: aula_220819-qsys port map (clk, reset. pio_0, pio_1);

end architecture c_aula_220819;