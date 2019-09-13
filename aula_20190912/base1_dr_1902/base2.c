#include "system.h"
#include "altera_avalon_pio_regs.h"

#include "sys/alt_stdio.h"
#include "alt_types.h"

//biblioteca para usar a função de atraso em microsegundos função => usleep("tempo_us")
#include <unistd.h>

//Comandos para leitura e escrita nas portas IO
#define PORT(base)		IORD_ALTERA_AVALON_PIO_DATA(base)
#define LAT(base, data)	IOWR_ALTERA_AVALON_PIO_DATA(base, data)

//Variáveis globais relacionadas as interruções síncronas por software
alt_u16 max_timer0, max_timer1, max_timer2;

void setup (void);
void f_timer0 (void);
void f_timer1 (void);
void f_timer2 (void);
void loop (void)
void f_interrupt (void);

void setup (void) {
  
}

void f_timer0 (void) {

}

void f_timer1 (void) {

}

void f_timer2 (void) {

}

void loop (void) { 
	f_interrupt();
	usleep(1000);
}

int main() { 
	setup();
	while (1) loop();
	return 0;
}

void f_interrupt (void) {

	static alt_u16 cont_timer0=0, cont_timer1=0, cont_timer2=0;

	cont_timer0++; cont_timer1++; cont_timer2++;

	if (cont_timer0 < max_timer0) 
		cont_timer0++;
	else {
		cont_timer0 = 0;
		f_timer0();
	}

	if (cont_timer1 < max_timer1) 
		cont_timer1++;
	else {
		cont_timer1 = 0;
		f_timer1();
	}

	if (cont_timer2 < max_timer2) 
		cont_timer2++;
	else {
		cont_timer2 = 0;
		f_timer2();
	}
}
