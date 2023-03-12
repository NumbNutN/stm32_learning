typedef unsigned char uint8_t;
typedef unsigned int uint32_t ;

typedef void (*function_entry)(void);

typedef struct _vector_table_t
{
    uint32_t __initial_sp;
    function_entry Reset;
    function_entry NMI_Handler;
    function_entry HardFault_Handler;
    function_entry MemManage_Handler;
    function_entry BusFault_Handler;
    function_entry UsageFault_Handler;
    uint32_t Reserve_0x1c[4];
    function_entry SVC_Handler; 
    uint32_t Reserve_0x34;
    function_entry PendSV_Handler;
    function_entry SysTick_Handler;
} vector_table_t;

extern uint32_t _data,_edata,_data_loadaddr;

void    Reset_Handler();
int     main();
void    reserve_handler();

void reserve_handler()
{
    while(1);
}

void __attribute__ ((weak)) Reset_Handler()
{   
    //将data段拷贝到数据段
    uint8_t *src,*dst;
    for(src = _data_loadaddr,dst = _data;dst < _edata;src++,dst++)
        *dst = *src;

    //配置时钟


    //进入主函数
    main();
}

__attribute__ ((section("._vectors")))
vector_table_t vector_table = {
    .__initial_sp       =   0x20017fe0,
    .Reset              =   Reset_Handler,
    .NMI_Handler        =   reserve_handler,
    .HardFault_Handler  =   reserve_handler
};






int main()
{
    while (1)
    {
        /* code */
    }
    
}