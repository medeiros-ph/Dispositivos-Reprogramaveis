#include "system.h"
#include "altera_avalon_pio_regs.h"

#include "sys/alt_stdio.h"
#include "alt_types.h"

//biblioteca para usar a função de atraso em microsegundos função => usleep("tempo_us")
#include <unistd.h>

//Comandos para leitura e escrita nas portas IO
#define PORT(base)	IORD_ALTERA_AVALON_PIO_DATA(base)
#define LAT(base, data)	IOWR_ALTERA_AVALON_PIO_DATA(base, data)

void setup (void) {

}

void loop (void) { 
	
}

int main() { 
  setup();
  while (1) loop();
  return 0;
}
