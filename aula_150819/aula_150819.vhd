entity aula_150819 is
port (
signal clk : in bit;
signal decimal : out bit_vector (6 downto 0);
signal unidade : out bit_vector (6 downto 0)
);
end entity aula_150819;

architecture c_aula_150819 of aula_150819 is

component maqest is
port(
signal clk : in bit;
signal decimal : out bit_vector (3 downto 0);
signal unidade : out bit_vector (3 downto 0)
);
end component maqest;

component conv7seg is
port(
signal dado : in bit_vector (3 downto 0);
signal en : in bit;
signal disp : out bit_vector (6 downto 0)
);
end component conv7seg;

signal dec_in, uni_in : bit_vector (3 downto 0); -- 4bits
-- chamar estancias

begin

xdec: conv7seg port map (dec_in, '1', decimal);
xuni: conv7seg port map (uni_in, '1', unidade);
xmaq: maqest port map (clk, dec_in, uni_in);

end architecture c_aula_150819;