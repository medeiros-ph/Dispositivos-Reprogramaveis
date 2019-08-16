
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;oscilador1Hz_source.c,29 :: 		void interrupt()
;oscilador1Hz_source.c,31 :: 		if(TMR0IF_bit)                              //Houve o estouro do Timer0?
	BTFSS      TMR0IF_bit+0, 2
	GOTO       L_interrupt0
;oscilador1Hz_source.c,34 :: 		TMR0IF_bit = 0x00;                       //Limpa a flag
	BCF        TMR0IF_bit+0, 2
;oscilador1Hz_source.c,35 :: 		TMR0       = 0x06;                       //Reinicia TMR0
	MOVLW      6
	MOVWF      TMR0+0
;oscilador1Hz_source.c,36 :: 		counter++;                               //Incrementa counter
	INCF       _counter+0, 1
	BTFSC      STATUS+0, 2
	INCF       _counter+1, 1
;oscilador1Hz_source.c,38 :: 		if(counter == 0x01F4)                    //Counter igual a 500?
	MOVF       _counter+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt5
	MOVLW      244
	XORWF      _counter+0, 0
L__interrupt5:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt1
;oscilador1Hz_source.c,41 :: 		counter = 0x00;                       //Reinicia counter
	CLRF       _counter+0
	CLRF       _counter+1
;oscilador1Hz_source.c,43 :: 		output = ~output;                     //Inverte a saída
	MOVLW      16
	XORWF      RC4_bit+0, 1
;oscilador1Hz_source.c,46 :: 		} //end if counter
L_interrupt1:
;oscilador1Hz_source.c,49 :: 		} //end if TMR0IF
L_interrupt0:
;oscilador1Hz_source.c,51 :: 		} //end interrupt
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;oscilador1Hz_source.c,55 :: 		void main()
;oscilador1Hz_source.c,57 :: 		CMCON      = 0x07;                          //Desabilita comparadores
	MOVLW      7
	MOVWF      CMCON+0
;oscilador1Hz_source.c,58 :: 		OPTION_REG = 0x83;                          //Prescaler 1:16 associado ao Timer0
	MOVLW      131
	MOVWF      OPTION_REG+0
;oscilador1Hz_source.c,59 :: 		GIE_bit    = 0x01;                          //Habilita interrupção global
	BSF        GIE_bit+0, 7
;oscilador1Hz_source.c,60 :: 		PEIE_bit   = 0x01;                          //Habilita interrupção por periféricos
	BSF        PEIE_bit+0, 6
;oscilador1Hz_source.c,61 :: 		TMR0IE_bit = 0x01;                          //Habilita interrupção do Timer0
	BSF        TMR0IE_bit+0, 5
;oscilador1Hz_source.c,62 :: 		TMR0       = 0x06;                          //Inicializa Timer0 para contar até 250
	MOVLW      6
	MOVWF      TMR0+0
;oscilador1Hz_source.c,64 :: 		TRISC      = 0xEF;                          //Apenas RC4 como saída
	MOVLW      239
	MOVWF      TRISC+0
;oscilador1Hz_source.c,65 :: 		output     = 0x00;                          //Saída RC4 inicia em low
	BCF        RC4_bit+0, 4
;oscilador1Hz_source.c,67 :: 		while(1)
L_main2:
;oscilador1Hz_source.c,71 :: 		} //end while
	GOTO       L_main2
;oscilador1Hz_source.c,73 :: 		} //end main
	GOTO       $+0
; end of _main
