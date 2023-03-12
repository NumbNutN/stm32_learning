Stack_Size  EQU 0x00000400

            AREA STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem   SPACE Stack_Size
__initial_sp

Heap_Size   EQU 0x00000200

            AREA HEAP, NOINIT, READWRITE, ALIGN=3
Heap_Mem    SPACE Heap_Size

            PRESERVE8
            THUMB


            AREA RESET, DATA, READONLY
            EXPORT _Vectors
_Vectors
            DCD __initial_sp
            DCD Reset_Handler

_Vectors_End


Reset_Handler   PROC NEAR
                ;重置中断服务函数，支持外部重写
                ;调用SystemInit函数配置时序
                ;调用__main，并在出口执行main
                EXPORT  Reset_Handler   [WEAK]
                IMPORT  SystemInit
                IMPORT __main

                LDR R0, =SystemInit
                BLX R0
                LDR R0, =__main
                BX R0
                ENDP



