.nolist
.INCLUDE "m8def.inc"

.list
.def mp = r16

.equ timer = 65000



.org 0x000
	rjmp init

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
  
	rcall ON            //go to subroutine ON
	rcall BREAK_2_low   //go to subroutine BREAK_2_low 
	rcall OFF
	rcall BREAK_2_low
	rcall ON
	rcall BREAK_2_low
	rcall OFF
	rcall BREAK_2_low


	rjmp main


//---------------------------CUBE ON---------------------------//
ON:

		ldi r17, 0b00111111
		out portc, r17

	ldi r18, 0b000000111
	out portb, r18

		ldi r19, 0b00011111
		out portd, r19

ret //return  


//---------------------------CUBE OFF---------------------------//
OFF:
 
		ldi r17,0b00000000
		out portc, r17

	ldi r18,0b00000000
	out portb, r18

		ldi r19,0b00000000
		out portd, r19

ret
//---------------------------break---------------------------//

BREAK_2_low:

ldi r24, low  (timer)
ldi r25, high (timer)
	loop1:
		sbiw r24,1
	brne loop1
ret
