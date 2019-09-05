#include "system.h"
#include "altera_avalon_pio_regs.h"

#include "sys/alt_stdio.h"
#include "alt_types.h"

#define PORT(base)	IORD_ALTERA_AVALON_PIO_DATA(base)
#define LAT(base, data)	IOWR_ALTERA_AVALON_PIO_DATA(base, data)

#include "sys/alt_stdio.h"

int main()
{ 
	unsigned char dado;
  alt_putstr("Hello from Nios II!\n");

  /* Event loop never exits. */
  while (1);
  {
	  dado = PORT(PIO_IN_BASE);
	  LAT(PIO_OUT_BASE, dado);

  }

  return 0;
}
