--
--  Curso de FPGAs WR Kits Channel Aula 011
--
--
--  Decodificador e contador BCD para Display 7 Segmentos Catodo Comum em VHDL
--
--  Objetivo: Incrementar o display de 0 a 9 a cada atualizaçao de clock externo
--         _________                     _____
--        |         |                   |  a  |
--        |         | 7                 |f   b|
--  clk --| entity  |-/- bar            |_____|
--        |         |                   |  g  |
--        |_________|                   |e   c|
--                                      |_____|
--                                         d
--  Kit de Desenvolvimento: EE02-SOQ
--
--  Adquira em: http://www.professoremersonmartins.com.br/site/products/KIT-FPGA-%252d-EE02-%252d-SOQ.html
--
--  Autor: Eng. Wagner Rambo  Data: Setembro de 2015
--
--  www.wrkits.com.br  |  facebook.com/wrkits  |  youtube.com/user/canalwrkits
--
		
		library IEEE;																	-- Biblioteca do Instituto de Engenheiros Elétricos e Eletrônicos
		use IEEE.std_logic_1164.all;												-- Inclui todo pacote padrão 1164

		entity disp_control is														-- Declaraçao da entidade
		port(
					bar	:		out	std_logic_vector(6 downto 0);			-- Barramento para o dado do display (saidas)
					clk	:		 in	std_logic);									-- Entrada de clock
		end disp_control;																-- Final da declaraçao da entidade
		
		architecture hardware of disp_control is								-- Declaração da arquitetura
		begin
		process(clk)																	-- Inicia um processo
		
				variable	counter	:	integer range 0 to 10;					-- Declaraçao de variável inteira que vai de 0 a 10
				
		begin																				-- Início do codigo concorrente
		
			if(clk = '1') then														-- clock em nivel alto?
																							-- Sim...
				counter := counter + 1;												-- Incrementa variável counter em uma unidade
				
				if(counter = 10) then												-- counter igual a 10?
																							-- Sim...
				   counter := 0;														-- Reinicia counter
				
				end if;																	-- fim do teste de counter
			
			end if;																		-- fim do teste de clk
			
			
			case counter is															-- Avalia os casos para counter
			
				 when 0 => bar <= "1111110";										-- Quando counter igual a 0, envia '0' para o barramento do display
				 when 1 => bar <= "0110000";										-- Quando counter igual a 1, envia '1' para o barramento do display
				 when 2 => bar <= "1101101";										-- Quando counter igual a 2, envia '2' para o barramento do display
				 when 3 => bar <= "1111001";										-- Quando counter igual a 3, envia '3' para o barramento do display
				 when 4 => bar <= "0110011";										-- Quando counter igual a 4, envia '4' para o barramento do display
				 when 5 => bar <= "1011011";										-- Quando counter igual a 5, envia '5' para o barramento do display
				 when 6 => bar <= "1011111";										-- Quando counter igual a 6, envia '6' para o barramento do display
				 when 7 => bar <= "1110000";										-- Quando counter igual a 7, envia '7' para o barramento do display
				 when 8 => bar <= "1111111";										-- Quando counter igual a 8, envia '8' para o barramento do display
				 when 9 => bar <= "1111011";										-- Quando counter igual a 9, envia '9' para o barramento do display
				 when others => bar <= "0000000";								-- Quando outros valores, desliga display 
				 
			end case;																	-- Final da construçao case
			
		end process;																	-- Final do processo 
		
		end hardware;																	-- Final da arquitetura 
















