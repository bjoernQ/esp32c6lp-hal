cargo build --release --example basic
objcopy -O binary target\riscv32imac-unknown-none-elf\release\examples\basic dump.bin
REM objdump -b binary --adjust-vma=0x50000000 -m riscv:rv32imac -D dump.bin
REM hexdmp dump.bin
REM bin2rust dump.bin
