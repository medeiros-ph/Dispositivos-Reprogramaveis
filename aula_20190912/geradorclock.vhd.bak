library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity geradorclock is
port (
	signal clk_in : in std_logic;
	signal clk_out1, clk_out2 : out std_logic
	);
end entity geradorclock;

architecture c_geradorclock of geradorclock is

signal clk0, clk1, clk2 : std_logic;

begin

clk_out1 <= clk1;
clk_out2 <= clk2;

-- Tempo de 1ms - padrão
pclk0 : process (clk_in)

variable contador : integer range 0 to 25000 := 0;

begin

if clk_in='0' and clk_in'event then

if contador < 24999 then
		contador := contador + 1;
	else
		contador := 0;
		clk0 <= not clk0;
	end if;
	
end if;

end process pclk0;

-- Tempo de 500ms
pclk1 : process (clk0)

variable contador : integer range 0 to 500 := 0;

begin

if clk0='0' and clk0'event then

if contador < 499 then
		contador := contador + 1;
	else
		contador := 0;
		clk1 <= not clk1;
	end if;
	
end if;

end process pclk1;

-- Tempo de 100ms
pclk2 : process (clk0)

variable contador : integer range 0 to 100 := 0;

begin

if clk0='0' and clk0'event then

	if contador < 99 then
		contador := contador + 1;
	else
		contador := 0;
		clk2 <= not clk2;
	end if;
	
end if;

end process pclk2;

end architecture c_geradorclock;
