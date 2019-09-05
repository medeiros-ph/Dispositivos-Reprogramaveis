library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity aula_150819 is
port (
signal clk : in std_logic;
signal decimal : out std_logic_vector (6 downto 0);
signal unidade : out std_logic_vector (6 downto 0)
);
end entity aula_150819;

architecture c_aula_150819 of aula_150819 is

component maqest is
port(
signal clk : in std_logic;
signal decimal : out std_logic_vector (3 downto 0);
signal unidade : out std_logic_vector (3 downto 0)
);
end component maqest;

component conv7seg is
port(
signal dado : in std_logic_vector (3 downto 0);
signal en : in bit;
signal disp : out std_logic_vector (6 downto 0)
);
end component conv7seg;

signal dec_in, uni_in : std_logic_vector (3 downto 0):= "1111"; -- 4bits
signal decimal_in, unidade_in : std_logic_vector (6 downto 0) := "1111111";
-- chamar estancias

begin

decimal <= decimal_in; -- variavel interna
unidade <= unidade_in; -- variavel interna

xdec: conv7seg port map (dec_in, '1', decimal_in);
xuni: conv7seg port map (uni_in, '1', unidade_in);
xmaq: maqest port map (clk, dec_in, uni_in);

end architecture c_aula_150819;