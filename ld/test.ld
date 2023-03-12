
MEMORY
{
	flash (rx)	: ORIGIN = 0x08000000, LENGTH = 512K
	sram (rwx)	: ORIGIN = 0x20000000, LENGTH = 96K
}


SECTIONS
{
	.text : 
	{
		KEEP (* (._vectors))
		. = ALIGN(4);
		* (.text*)
	}>flash

	.data :
	AT (ADDR(.text) + SIZEOF(.text)) 
	{
		_data = .;
		* (.data*)
		_edata = .;
	}>sram
	_data_loadaddr = LOADADDR(.data);

	.bss : 
	{
		*(.bss*)
	}>sram
}
