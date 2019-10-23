.nolist
.INCLUDE "m8def.inc"

.list
.def mp = r16

.equ timer = 65000



.org 0x000
	rjmp init

.org 0x001
	rjmp INT_2




 //VORGABEN

		/*Vertikal
		Horizontal
		Spiral*/

init:


	ldi mp,0xff
	out DDRC,mp

	ldi mp,0xff
	out DDRD,mp

	ldi mp,0xff
	out DDRB,mp
	//timer setup
	ldi r24, low(timer)
	ldi r25, high(timer)
	//interrupt setup
	ldi mp, low(RAMEND)
	out SPL, mp

	ldi mp, high(RAMEND)
	out SPH, mp


	ldi mp, 1<<ISC01 | 1<<ISC11
	out MCUCR, mp

	ldi mp, 1<<INT0 | 1<<INT1
	out GICR, mp

	sei


main:



	/*rcall Seule_1
	rcall BREAK_2_low
	rcall Seule_4
	rcall BREAK_2_low
	rcall Seule_2
	rcall BREAK_2_low
	rcall Seule_5
	rcall BREAK_2_low
	rcall Seule_3
	rcall BREAK_2_low
	rcall Seule_6
	rcall BREAK_2_low
 */



	rcall Horizontalbewegung




	//rcall Rundherrum
	rjmp main


//---------------------------CUBE AN---------------------------//
ON:

		ldi r17, 0b00111111
		out portc, r17

	ldi r18, 0b000000111
	out portb, r18

		ldi r19, 0b00011111
		out portd, r19

ret


//---------------------------CUBE AUS---------------------------//
OFF:
/*sbiw R26, 1
brne OFF*/
		ldi r17,0b00000000
		out portc, r17

	ldi r18,0b00000000
	out portb, r18

		ldi r19,0b00000000
		out portd, r19

ret


//---------------------------Seule 1---------------------------//
Seule_1:

	ldi r17, 0b00000111
	out portc, r17

	ldi r18, 0b00000111
	out portb, r18

		ldi r19, 0b11000000
		out portd, r19
	ret
//---------------------------Seule 2---------------------------//
Seule_2:

	ldi r17, 0b00000111
	out portc, r17

	ldi r18, 0b00001111
	out portb, r18

		ldi r19, 0b10100000
		out portd, r19
	ret
//---------------------------Seule 3---------------------------//
Seule_3:

	ldi r17, 0b00000111
	out portc, r17

	ldi r18, 0b00001111
	out portb, r18

		ldi r19, 0b01100000
		out portd, r19
	ret
//---------------------------Seule 4---------------------------//
Seule_4:

	ldi r17, 0b11101101
	out portc, r17

	ldi r18, 0b11101101
	out portb, r18

		ldi r19, 0b11000000	//Oben
		out portd, r19
	ret
//---------------------------Seule 5---------------------------//
Seule_5:

	ldi r17, 0b11101101
	out portc, r17

	ldi r18, 0b11101101
	out portb, r18

		ldi r19, 0b10100000	//Mitte
		out portd, r19
	ret
//---------------------------Seule 6---------------------------//
Seule_6:

	ldi r17, 0b11101101
	out portc, r17

	ldi r18, 0b11101101
	out portb, r18

		ldi r19, 0b01100000	//Unten
		out portd, r19
ret
//---------------------------Seule 7---------------------------//
Seule_7:

	ldi r17, 0b00000001
		out portc, r17

	ldi r18, 0b11000000
	out portb, r18

		ldi r19, 0b11000000
		out portd, r19
	ret
//---------------------------Seule 8---------------------------//
Seule_8:

	ldi r17, 0b00000001
		out portc, r17

	ldi r18, 0b11000000
	out portb, r18

		ldi r19, 0b01100000
		out portd, r19
	ret
//---------------------------Seule 9---------------------------//
Seule_9:

		ldi r17, 0b00000001
			out portc, r17

	ldi r18, 0b11000000
	out portb, r18

		ldi r19, 0b01100000
		out portd, r19
ret
//---------------------------K1 ---------------------------//
k1:
		ldi r17, 0b00111111
		out portc, r17

	ldi r18, 0b00000111
	out portb, r18

		ldi r19, 0b11011111
		out portd, r19
ret
//---------------------------K2 ---------------------------//
K2:
		ldi r17, 0b00111111
		out portc, r17

	ldi r18, 0b00000111
	out portb, r18

		ldi r19, 0b10111111
		out portd, r19
ret

//---------------------------K3 ---------------------------//
K3:

		ldi r17, 0b00111111
		out portc, r17

	ldi r18, 0b00000111
	out portb, r18

		ldi r19, 0b01111111
		out portd, r19
 ret

 k1_o:
		ldi r17, 0b000000001
		out portc, r17

	ldi r18, 0b00000000
	out portb, r18

		ldi r19, 0b00000000
		out portd, r19
ret
K2_o:
		ldi r17, 0b000000010
		out portc, r17

	ldi r18, 0b00000000
	out portb, r18

		ldi r19, 0b00000000
		out portd, r19
ret

//---------------------------K3 ---------------------------//
K3_o:

		ldi r17, 0b000000100
		out portc, r17

	ldi r18, 0b00000000
	out portb, r18

		ldi r19, 0b00000000
		out portd, r19
 ret

//---------------------------K3 ---------------------------//
K4_o:

		ldi r17, 0b000100000
		out portc, r17

	ldi r18, 0b00000000
	out portb, r18

		ldi r19, 0b00000000
		out portd, r19
 ret

 //---------------------------K3 ---------------------------//
K5_o:

		ldi r17, 0b01000000
		out portc, r17

	ldi r18, 0b00000001
	out portb, r18

		ldi r19, 0b00000000
		out portd, r19
 ret


 //---------------------------K3 ---------------------------//
K6_o:

		ldi r17, 0b01000000
		out portc, r17

	ldi r18, 0b00000010
	out portb, r18

		ldi r19, 0b00000000
		out portd, r19
 ret
  //---------------------------K3 ---------------------------//
K7_o:

		ldi r17, 0b01000000
		out portc, r17

	ldi r18, 0b00000100
	out portb, r18

		ldi r19, 0b00000000
		out portd, r19
 ret

  //---------------------------K3 ---------------------------//
K8_o:

		ldi r17, 0b000001000
		out portc, r17

	ldi r18, 0b00000000
	out portb, r18

		ldi r19, 0b00000000
		out portd, r19
 ret

V_Hinten:

		ldi r17, 0b00000111
		out portc, r17

	ldi r18, 0b00000000
	out portb, r18

		ldi r19, 0b00011111
		out portd, r19
ret

V_Mitte:
	ldi r17, 0b000111000
	out portc, r17
	ldi r18, 0b00000000
	out portb, r18
	ldi r19, 0b00011111
	out portd,r19
ret

V_Vorne:
	ldi r17, 0b00000000
	out portc, r17
	ldi r18, 0b00000111
	out portb, r18
	ldi r19, 0b00011111
	out portd, r19
ret

//---------------------------Pause schnell---------------------------//
BREAK_1_fast:
Loop_00:
	Loop_11:
		dec r21
		brne Loop_11
	dec r22
	brne Loop_00
ret
//---------------------------Pause Langsam---------------------------//

BREAK_2_low:
/*
 loopa:
                loopb:
                    dec r18
                    brne loopb
                    dec r19
                    brne loopa

                        loopc:
                            loopd:
                                dec r18
                                brne loopd
                                dec r19
                                brne loopc*/

ldi r24, low  (timer)
ldi r25, high (timer)
	loop1:
		sbiw r24,1
	brne loop1
ret



Horizontalbewegung:

	rcall V_Hinten
	rcall BREAK_2_low
	rcall V_Mitte
	rcall BREAK_2_low
	rcall V_Vorne
	rcall BREAK_2_low
	rcall V_Mitte
	rcall BREAK_2_low
	rcall V_Hinten
	rcall BREAK_2_low
	rcall V_Mitte
	rcall BREAK_2_low
	rcall V_Vorne
	rcall BREAK_2_low
	rcall V_Mitte
	rcall BREAK_2_low
	rcall V_Hinten

ret
 

 
 

 

//---------------------------Taster 1---------------------------//
INT_1:

	in mp, SREG		//In Statusregister speichern
	push mp
	rcall Rundherrum
	rcall BREAK_2_low

				//Aus dem Statusregister nehmen

	pop mp	//Aus dem Statusregister nehmen
	out SREG, mp

reti
