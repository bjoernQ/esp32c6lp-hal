/*
 * SPDX-FileCopyrightText: 2023 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: Apache-2.0
 */

ENTRY(reset_vector)

CONFIG_ULP_COPROC_RESERVE_MEM = 1024 * 16;
CONFIG_ULP_SHARED_MEM = 0;

MEMORY
{
    /*first 128byte for exception/interrupt vectors*/
    vector_table(RX) :   ORIGIN = 0x50000000, LENGTH = 0x80
    ram(RWX) :           ORIGIN = 0x50000080, LENGTH = CONFIG_ULP_COPROC_RESERVE_MEM - 0x80 - CONFIG_ULP_SHARED_MEM
}

SECTIONS
{
    .vector.text :
    {
        /*exception/interrupt vectors*/
        __mtvec_base = .;
        KEEP (*(.init.vector))
        __mtvec_end = .;
    } > vector_table

    . = ORIGIN(ram);

    .text ALIGN(4):
    {
        *(.text.vectors) /* Default reset vector must link to offset 0x80 */
        
        KEEP(*(.init));
        KEEP(*(.init.rust));        
        *(.text)
        *(.text*)
    } > ram

    .rodata ALIGN(4):
    {
        *(.rodata)
        *(.rodata*)
    } > ram

    .data ALIGN(4):
    {
        *(.data)
        *(.data*)
        *(.sdata)
        *(.sdata*)
    } > ram

    .bss ALIGN(4) :
    {
        *(.bss)
        *(.bss*)
        *(.sbss)
        *(.sbss*)
        PROVIDE(end = .);
    } > ram

    __stack_top = ORIGIN(ram) + LENGTH(ram);
}
