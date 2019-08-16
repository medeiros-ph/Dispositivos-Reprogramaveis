entity maqest is
port(
signal clk : in bit;
signal decimal : out bit_vector (3 downto 0);
signal unidade : out bit_vector (3 downto 0)
);
end entity maqest;

architecture c_maqest of maqest is

begin
p1: process (clk) -- do concorrente pode ser sequencial
variable estado : bit_vector (3 downto 0) := "0000";
BEGIN
if clk = '0' and clk'event then --borda de decida
	
case estado is
when "0010" => 
		estado := "0011";
		decimal <= "1111";
		unidade <= "0011";

when "0011" => 
		estado := "0101";
		decimal <= "1111";
		unidade <= "0101";

when "0101" => 
		estado := "1011";
		decimal <= "1111";
		unidade <= "1011";		

when "0111" => 
		estado := "1011";
		decimal <= "0001";
		unidade <= "0011";	

when "1101" => 
		estado := "0010";
		decimal <= "1111";
		unidade <= "0010";	

when others => 
		estado := "0010";
		decimal <= "1111";
		unidade <= "0010";			
		
end case;
end if;
end process p1;
	
end architecture c_maqest;