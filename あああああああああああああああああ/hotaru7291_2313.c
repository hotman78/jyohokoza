#include<avr/io.h>

void init_io(void)
{
	DDRB = 0xff;
	PORTB = 0x00;
	DDRD = 0x00;
}

void wait(long wt)
{
	wt *= 30;
	for(volatile long i = 0; i < wt; i++)
	{
		
	}
}

int main(void)
{
	init_io();
	wait(1000);		//ÉXÉCÉbÉ`Çì¸ÇÍÇƒÇ©ÇÁÇPïbä‘ÇÕé~Ç‹Ç¡ÇΩÇ‹Ç‹Ç…Ç∑ÇÈ

	while(1)
	{
		PORTB = 0b0011;		//ç∂Ç‡âEÇ‡âÒÇÈÇ©ÇÁÅAëOêi
		wait(800);
		PORTB = 0b0001;		//âEÉÇÅ[É^ÇæÇØâÒÇÈÇ©ÇÁÅAç∂ê‹
		wait(300);
		PORTB = 0b0011;		//ëOêi
		wait(800);
		PORTB = 0b0010;		//ç∂ÉÇÅ[É^ÇæÇØâÒÇÈÇ©ÇÁÅAâEê‹
		wait(300);
	}
	return 0;
}
