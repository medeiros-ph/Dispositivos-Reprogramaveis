# Dispositivos-Reprogramaveis

Aula 01 - 15/ago/19

Revisão de conceitos básicos como exemplo: 

Criar Entity e/ou Componet;
Definir entradas e saidas com signal em port;

Exemplo do display de 7 seguimentos

--         _________                     _____
--        |         |                   |  a  |
--        |         | 7                 |f   b|
--  clk --| entity  |-/- bar            |_____|
--        |         |                   |  g  |
--        |_________|                   |e   c|
--                                      |_____|
--                                         d

Arquivos criados em aula: 
aula_150819.vhd, conv7seg.vhd e maqest.vhd.

conv7seg.vhd: conversor para display de 7 seguimentos.

Maquina de estado (sem depender da entrada) de números primos até 15.
Sequência: 2, 3, 5, 7, 11 e 13.
Exemplo com dois displays de 7 seguimentos: decimal e estado.

<p>--         _________                     _____		 _____<p>
<p>--        |         |                   |  a  |		|  a  |<p>
<p>--        |         | 7                 |f   b|		|f   b|<p>
<p>--  clk --| entity  |-/- estado decimal |_____|		|_____|<p>
<p>--        |         |-/- estado unidade |  g  |		|  g  |<p>
<p>--        |_________|                   |e   c|		|e   c|<p>
<p>--                                      |_____|		|_____|<p>
<p>--                                         d		   d	<p>
<p>--					ESTADO		UNIDADE<p>

Material para download: 
http://gen-io.grupogen.com.br/gen-io/index.php?option=com_content&view=article&id=300&catid=60&Itemid=96

Consulta: http://gen-io.grupogen.com.br/gen-io/index.php?option=com_content&view=article&id=300&catid=60&Itemid=96
