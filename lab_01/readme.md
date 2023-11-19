Para empezar, con ayuda de Digital se realiza el diagrama del medio sumador (semi-sumador, o halfAdder).
<image src="images/ha.png" alt="simulacion" width="400px">

El circuito anterior se usa como un embebido para la creación del sumador completo (fullAdder). El sumador completo posee una entrada más que los semisumadores (Carry in[ci] y Carry out[co] respectivamente).
<image src="images/fa.png" alt="simulacion" width="400px">

Al fullAdder se le realizan una serie de pruebas (testbench), que se guardan en un archivo de verilog, al igual que el diagrama de todo el circuito.
<image src="images/top.png" alt="simulacion" width="400px">

Al archivo verilog del testbench se le realiza una modificación en la forma del siguinte codigo:

*"begin"
*"	$dumpfile("top.vcd");"
*"	$dumpvars(0, bb_fulladder_testbench_tb);"
*"end"

Lo anterior para poder generar un archivo vcd.

Se ejecutan los siguientes comandos en la consola de kali-linux:

* "iverilog -o top.vvp bb_fullAdder_testbench_tb.v bb_fullAdder.v"
*"vvp top.vvp -vcd"

Esto para generar el archivo top.vpp, y top.vcd.

Con el archivo vcd, se ejecuta el siguiente comando en consola:
* "gtkwave top.vcd"
Para abrir gtkwave, y ver la simulación de ondas generadas por el circuito.
<image src="images/wave.jpeg" alt="simulacion" width="400px">
