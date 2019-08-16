/*
    Oscilador de 1 Hz com Timer 0
    
    MCU: PIC16F876A   Clock: 16MHz   Ciclo de máquina = 250ns
    
    Timer0:
    
    Estouro = TMR0 x prescaler x ciclo de máquina
    Estouro = 250  x    16    x   250E-9
    Estouro = 1ms
    
    Período = Estouro x Counter
     500E-3 =  1E-3   x Counter
    Counter = 500
    
    Autor: Eng. Wagner Rambo   Data: Setembro de 2015
    
    www.wrkits.com.br | facebook.com/wrkits | youtube.com/user/canalwrkits

*/

// --- Mapeamento de Hardware ---
#define output RC4_bit

// --- Variáveis Globais ---
int counter = 0x00;                              //Variável auxiliar para contagem

// --- Rotina de Interrupção ---
void interrupt()
{
     if(TMR0IF_bit)                              //Houve o estouro do Timer0?
     {                                           //Sim...
     
        TMR0IF_bit = 0x00;                       //Limpa a flag
        TMR0       = 0x06;                       //Reinicia TMR0
        counter++;                               //Incrementa counter
     
        if(counter == 0x01F4)                    //Counter igual a 500?
        {                                        //Sim...
        
           counter = 0x00;                       //Reinicia counter
           
           output = ~output;                     //Inverte a saída
        
        
        } //end if counter
     
     
     } //end if TMR0IF

} //end interrupt


// --- Função Principal ---
void main() 
{
     CMCON      = 0x07;                          //Desabilita comparadores
     OPTION_REG = 0x83;                          //Prescaler 1:16 associado ao Timer0
     GIE_bit    = 0x01;                          //Habilita interrupção global
     PEIE_bit   = 0x01;                          //Habilita interrupção por periféricos
     TMR0IE_bit = 0x01;                          //Habilita interrupção do Timer0
     TMR0       = 0x06;                          //Inicializa Timer0 para contar até 250
     
     TRISC      = 0xEF;                          //Apenas RC4 como saída
     output     = 0x00;                          //Saída RC4 inicia em low
     
     while(1)
     {
     
     
     } //end while

} //end main








